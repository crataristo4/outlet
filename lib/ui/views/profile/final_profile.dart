import 'package:flutter/material.dart';
import 'package:outlet/ui/views/main_page/main_page.dart';
import 'package:outlet/ui/widgets/animated.column.dart';
import 'package:outlet/ui/widgets/app_sliver_appbar.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/dimens.dart';
import '../../../utils/functions.dart';
import '../../widgets/button_widget.dart';

class FinalProfilePage extends StatefulWidget {
  static const String routeName = 'final-profile';
  final String userName, image;
  const FinalProfilePage({Key? key, required this.userName, required this.image}) : super(key: key);

  @override
  State<FinalProfilePage> createState() => _FinalProfilePageState();
}

class _FinalProfilePageState extends State<FinalProfilePage> {
  final TextEditingController anonymousController = TextEditingController();
  int itemSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          AppSliverAppBar(leading: SizedBox(), title: SizedBox(), action: SizedBox()),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AnimatedColumnWidget(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Image.asset(widget.image, width: eightyDp),
                      SizedBox(height: tenDp),
                      Text(widget.userName, style: TextStyle(fontFamily: 'regular')),
                    ])),
                Expanded(
                  child: AnimatedColumnWidget(children: [
                    Text(S.of(context).youAreAllSet, style: TextStyle(fontFamily: 'extraBold', fontSize: twentyTwoDp)),
                    Text(S.of(context).weKeepYouAnonymous, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'regular')),
                  ]),
                ),
                GradientButtonWidget(
                    child: Center(
                      child: Text(
                        S.of(context).okay,
                        style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                      ),
                    ),
                    onTap: () => onOkTapped(),
                    //gradient: ThemeColor.buttonGradient,
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

  Future<void> onOkTapped() async {
    await switchScreen(context, MainPage.routeName);
  }
}
