import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:outlet/ui/views/profile/final_profile.dart';
import 'package:outlet/ui/widgets/animated.column.dart';
import 'package:outlet/ui/widgets/app_sliver_appbar.dart';
import 'package:outlet/utils/constants/strings.dart';
import 'package:outlet/utils/functions.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/theme_colors.dart';
import '../../../utils/enums.dart';
import '../../../utils/username_generator.dart';
import '../../widgets/animated_grid_view.dart';
import '../../widgets/app_labelled_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_widget.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController anonymousController = TextEditingController();
  int itemSelected = -1;
  var generator = UsernameGenerator();
  Random random = Random();
  late String defaultAvatar = kAvatar;
  String? userName, randomUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          AppSliverAppBar(leading: SizedBox(), title: SizedBox(), action: SizedBox()),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: twentyDp),
              child: AnimatedColumnWidget(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLabelledWidget(
                      label: Padding(
                        padding: const EdgeInsets.only(top: tenDp),
                        child: RichText(
                          textWidthBasis: TextWidthBasis.parent,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              textSpan(value: S.current.enterNickName, fontFamily: 'extraBold', color: Colors.black),
                              textSpan(value: S.current.optional, fontFamily: 'regular', color: Colors.black45),
                            ],
                          ),
                        ),
                      ),
                      child: InputWidget(
                        controller: anonymousController,
                        textInputAction: TextInputAction.done,
                        hint: S.of(context).whatIsItAbout,
                        filledColor: ThemeColor.kAppGrayLight,
                        focusAndEnableColor: ThemeColor.kAppGrayLight,
                        textFieldType: AppTextFieldType.regular,
                        edgeInsetsGeometry: const EdgeInsets.symmetric(),
                        onValidate: (value) {},
                        onChange: (value) {
                          return null;
                        },
                        prefix: SizedBox.shrink(),
                        onFieldSubmitted: (String? value) {},
                      ),
                      edgeInsetsGeometry: EdgeInsets.zero),
                  SizedBox(height: twentyDp),
                  Text(
                    S.of(context).selectAnonymousPic,
                    style: TextStyle(fontFamily: 'semiBold'),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Expanded(
                  child: AppGridView(
                    crossAxisCount: 4,
                    list: [kAvatar, kAvatar1, kAvatar2, kAvatar3, kAvatar4, kAvatar5, kAvatar6, kAvatar7]
                        .asMap()
                        .map((index, image) {
                          return MapEntry(
                              index,
                              AnimationLimiter(
                                child: AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    columnCount: 4,
                                    duration: const Duration(milliseconds: 500),
                                    child: SlideAnimation(
                                      verticalOffset: -90.0,
                                      horizontalOffset: -90.0,
                                      child: FadeInAnimation(
                                        child: images(image, index),
                                      ),
                                    )),
                              ));
                        })
                        .values
                        .toList(),
                  ),
                ),
                GradientButtonWidget(
                    child: Center(
                      child: Text(
                        S.of(context).start,
                        style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                      ),
                    ),
                    onTap: () => onTap(),
                    // gradient: LinearGradient(colors: ThemeColor.gradientPrimary, begin: Alignment.topLeft),
                    width: MediaQuery.of(context).size.width,
                    borderRadiusGeometry: BorderRadius.circular(twentyDp),
                    edgeInsetsGeometry: EdgeInsets.symmetric(vertical: twentyDp, horizontal: twentyDp))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget images(String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemSelected = index;
          defaultAvatar = image;
        });
      },
      child: AnimatedContainer(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: itemSelected == index ? ThemeColor.kPrimary : Colors.transparent, width: 3)),
          margin: EdgeInsets.symmetric(horizontal: twentyDp),
          duration: Duration(milliseconds: 800),
          child: Image.asset(image)),
    );
  }

  TextSpan textSpan({required String value, required String fontFamily, double? fontSize, Color? color}) {
    return TextSpan(
      text: value,
      style: TextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize),
    );
  }

  Future<void> onTap() async {
    final generatedRandomName = generateRandomString(5);
    if (anonymousController.text.isNotEmpty) {
      userName = generator.generate(anonymousController.text, hasNumbers: true, prefix: '@');
    } else {
      randomUserName = generator.generate(generatedRandomName, hasNumbers: true, prefix: '@');
    }

    await switchScreenWithConstructor(
        context,
        FinalProfilePage(
          userName: anonymousController.text.isEmpty ? randomUserName! : userName!,
          image: defaultAvatar,
        ),
        replace: true);
  }

  String generateRandomString(int length) {
    return String.fromCharCodes(List.generate(length, (index) => random.nextInt(33) + 89));
  }

  @override
  void initState() {
    super.initState();
  }
}
