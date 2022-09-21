import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:outlet/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/widgets/button_widget.dart';
import '../ui/widgets/custom_dialog_box.dart';
import 'constants/dimens.dart';
import 'constants/theme_colors.dart';
import 'enums.dart';

var logger = Logger(printer: PrettyPrinter(lineLength: 500));

FilteringTextInputFormatter decimalFiltering() => FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

FilteringTextInputFormatter numberFiltering() => FilteringTextInputFormatter.allow(RegExp('[0-9]'));

/// Formats bytes and returns a string
String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) {
    return '0 B';
  }
  const List<String> suffixes = <String>[
    'B',
    'KB',
    'MB',
    'GB',
    'TB',
    'PB',
    'EB',
    'ZB',
    'YB',
  ];
  final int i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

String getFileSize({required File file}) => formatBytes(file.lengthSync(), 2);

//focus node
fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  return FocusScope.of(context).requestFocus(nextFocus);
}

onWidgetBindingComplete({required Duration duration, required Function() onComplete}) {
  WidgetsBinding.instance.addPostFrameCallback((_) => Timer(duration, onComplete));
}

///Navigate to page
///[replace] determines whether to remove page from stack or to push
///[destination] is the route
///[args] Passes data to page
Future<dynamic> switchScreen(BuildContext context, String destination, {bool replace = false, dynamic args}) {
  return replace
      ? Navigator.of(context).pushNamedAndRemoveUntil(destination, (route) => false, arguments: args)
      : Navigator.of(context).pushNamed(destination, arguments: args);
}

///goes back
void pop(BuildContext context, {dynamic args, bool route = false}) {
  if (Platform.isAndroid) {
    HapticFeedback.vibrate();
  }
  return Navigator.of(context, rootNavigator: route).pop(args);
}

Size screenSize(BuildContext context) => MediaQuery.of(context).size;

ScreenSize getScreenSize(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final height = size.height;
  final width = size.width;
  final ratio = size.height / size.width;

  debugPrint("ratio ${height / width}");
  if (ratio < 1.60) {
    debugPrint("small screen");
    return ScreenSize.small;
  } else if (ratio >= 1.60 && ratio < 1.999) {
    debugPrint("medium screen");
    return ScreenSize.medium;
  } else {
    debugPrint("long screen");
    return ScreenSize.large;
  }
}

///LOADER ------------
Future loader({required BuildContext context, required String message}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: tenDp, sigmaY: tenDp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                    size: hundredDp,
                  ),
                ),
                Center(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.white, fontFamily: 'medium'),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

///------END LOADER

Future<void> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ///show error --- todo
    throw 'Error $url';
  }
}

///back button
/// [args] if arguments is need to another route
Widget backButton(BuildContext context, {dynamic args, void Function()? onPressed, Color iconColor = Colors.black}) => IconButton(
      onPressed: () {
        if (onPressed == null) {
          pop(context, args: args);
        } else {
          onPressed();
        }
      },
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: iconColor,
      ),
    );

///------------------INDICATOR -----------------------------///
Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: eightDp,
    width: eightDp,
    margin: const EdgeInsets.only(right: sixDp),
    decoration: BoxDecoration(
        color: isActive ? ThemeColor.kPrimary : ThemeColor.kPrimaryLight, borderRadius: BorderRadius.circular(fourDp)),
  );
}

List<Widget> indicatorCount({required int currentIndex, required List items}) {
  List<Widget> indicators = [];
  for (int i = 0; i < items.length; i++) {
    if (currentIndex == i) {
      indicators.add(indicator(true));
    } else {
      indicators.add(indicator(false));
    }
  }

  return indicators;
}

///End indicator ---------------------

///----ALERT DIALOG---------
showAlertDialog({
  String title = '',
  required String content,
  required BuildContext context,
  required List<Widget> actions,
}) {
  var alertDialog = Platform.isAndroid
      ? AlertDialog(
          title: Text(title),
          content: Text(content),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(twentyDp)),
          actions: actions,
        )
      : CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions,
        );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) => CustomDialogBox(child: alertDialog),
      barrierDismissible: true,
    );
  } else if (Platform.isIOS) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CustomDialogBox(child: alertDialog);
        });
  }
}

///-----END ALERT DIALOG

///BEGIN SNACK BAR --------------------
void showSnackBar(BuildContext context, String content,
    {Duration duration = const Duration(seconds: 3), backgroundColor = ThemeColor.accent}) {
  SnackBar snackBar = SnackBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.all(thirtyDp),
      duration: duration,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ));

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

///END SNACK BAR ----------------

/// BEGIN SHARE FILE
Future<void> shareFile(
    {required String url, required String subject, required String text, bool isSharingAppLink = false}) async {
  //write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  //todo ... sharing app url
  if (isSharingAppLink) {
    final filename = 'logo.png'; //todo app logo should be replaced
    var bytes = await rootBundle.load("assets/images/logo.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    await writeToFile(bytes, '$dir/$filename');
    if (Platform.isAndroid) {
      //todo give title and subject

    } else if (Platform.isIOS) {}
    await Share.shareFiles([File('$dir/logo.png').path], subject: subject, text: text);
  } else {
    await Share.share(
      '${text + '\n' + subject + '\n\n' + url + '\n'}',
    ); //todo add app link for users to download
  }
}

/// END SHARE FILES -------------

Future<void> showActionSheet(
    {required BuildContext context, required String title, required List data, void Function(dynamic value)? onPressed}) async {
  return await showCupertinoModalPopup<void>(
    context: context,
    barrierDismissible: false,
    filter: ImageFilter.blur(sigmaX: tenDp, sigmaY: tenDp),
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text(title, style: TextStyle(fontFamily: 'bold', color: ThemeColor.kSecondary)),
      actions: data
          .map((e) => MaterialButton(
                child: Text(
                  e.toString(),
                  style: const TextStyle(fontFamily: 'regular'),
                ),
                onPressed: () => onPressed!(e),
              ))
          .toList(),
      cancelButton: ButtonWidget(
          buttonName: S.current.cancel,
          onButtonTapped: () => pop(context),
          buttonColor: ThemeColor.accent,
          width: MediaQuery.of(context).size.width,
          borderRadiusGeometry: BorderRadius.circular(tenDp),
          buttonTextColor: Colors.white),
    ),
  );
}

bool validateForm(GlobalKey<FormState> formKey) {
  return formKey.currentState!.validate();
}

String? validateData(String value) {
  if (value.trim().isEmpty) {
    return S.current.required;
  }
  return null;
}
