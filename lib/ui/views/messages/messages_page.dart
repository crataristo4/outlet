import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlet/business_logic/models/messages.dart';
import 'package:outlet/ui/widgets/animated.column.dart';
import 'package:outlet/ui/widgets/app_sliver_appbar.dart';
import 'package:outlet/ui/widgets/app_sliver_header.dart';
import 'package:outlet/utils/constants/dimens.dart';
import 'package:outlet/utils/constants/strings.dart';
import 'package:outlet/utils/functions.dart';

import '../../../business_logic/models/outlets.dart';
import '../../../generated/l10n.dart';
import '../../../utils/constants/theme_colors.dart';
import '../../../utils/enums.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_widget.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = 'message-page';
  final Outlet outlet;

  const MessagePage({Key? key, required this.outlet}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(
              leading: backButton(context),
              title: Text(
                widget.outlet.message!,
                style: TextStyle(fontFamily: 'extraBold', color: Colors.black),
              ),
              action: SizedBox()),
          AppSliverPersistentHeader(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(kHeadPhone1),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: eightDp),
                        child: RichText(
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              textSpan(
                                  '${widget.outlet.totalListeners}k ', TextStyle(fontFamily: 'extraBold', color: Colors.black)),
                              textSpan(S.current.peopleListening, TextStyle(fontFamily: 'extraBold', color: Colors.black)),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              min: nineteenDp,
              max: nineteenDp),
          SliverFillRemaining(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      final message = listOfMessage[index];
                      return messages(message: message);
                    },
                    itemCount: listOfMessage.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  )),
                  inputBox()
                ]),
          )
        ],
      ),
    );
  }

  Widget messages({required Message message}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
      child: AnimatedColumnWidget(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //message layout
        Container(
          //  height: hundredDp,
          //margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: 20),
          padding: EdgeInsets.all(twentyDp),
          //width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.message, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'regular')),
              SizedBox(height: tenDp),
              Text(dateFormatter(formatType: 'h:mm a', dateTime: message.timestamp),
                  maxLines: 1, style: TextStyle(fontFamily: 'extraBold')),
            ],
          ),
          decoration: BoxDecoration(
              color: ThemeColor.kPrimaryLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(fortyDp),
                topRight: Radius.circular(fortyDp),
                bottomRight: Radius.circular(fortyDp),
              )),
        ),
        SizedBox(height: fourDp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColor.kGreenLight, width: 0.1),
                  shape: BoxShape.circle,
                ),
                width: thirtyDp,
                child: Image.asset(
                    //todo change to network image
                    message.user.avatar!,
                    height: thirtyDp)),
            SizedBox(width: sixDp),
            SvgPicture.asset(kEarSvg, width: sixteenDp),
            SizedBox(width: sixDp),
            Text(message.user.username!, maxLines: 1, style: TextStyle(fontFamily: 'extraBold')),
          ],
        ),
      ]),
    );
  }

  Widget inputBox() {
    return Container(
      margin: EdgeInsets.all(sixteenDp),
      child: Row(
        children: [
          Expanded(
            child: InputWidget(
              controller: messageController,
              textInputAction: TextInputAction.done,
              hint: S.of(context).messages.substring(0, S.current.messages.length - 1),
              filledColor: ThemeColor.kAppGrayLight,
              focusAndEnableColor: ThemeColor.kAppGrayLight,
              textFieldType: AppTextFieldType.regular,
              edgeInsetsGeometry: const EdgeInsets.symmetric(),
              onValidate: (value) {},
              onChange: (value) {
                return null;
              },
              borderRadius: twentyDp,
              prefix: Padding(
                padding: const EdgeInsets.all(tenDp),
                child: SvgPicture.asset(kAttachSvg),
              ),
              suffixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.black),
              onFieldSubmitted: (String? value) {},
            ),
          ),
          GradientButtonWidget(
              child: Icon(Icons.mic_none, color: Colors.white),
              // boxShape: BoxShape.circle,
              onTap: () => onTap(),
              width: fiftyFiveDp,
              height: fiftyDp,
              borderRadiusGeometry: BorderRadius.circular(twentyDp),
              edgeInsetsGeometry: EdgeInsets.only(bottom: twentyDp, left: tenDp))
        ],
      ),
    );
  }

  onTap() {}
}
