import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:outlet/ui/views/walkthrough/walkthrough.dart';
import 'package:outlet/utils/constants/strings.dart';
import 'package:outlet/utils/functions.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(kLogoLotty),
    );
  }

  @override
  void initState() {
    onWidgetBindingComplete(
        duration: Duration(milliseconds: 3000),
        onComplete: () {
          switchScreen(context, WalkThroughPage.routeName, replace: true);
        });
    super.initState();
  }
}
