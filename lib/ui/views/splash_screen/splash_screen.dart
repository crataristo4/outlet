import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(child: Lottie.asset(kLogoLotty)),
    );
  }

  @override
  void initState() {
    onWidgetBindingComplete(
        duration: Duration(milliseconds: 2500),
        onComplete: () {
          switchScreen(context, WalkThroughPage.routeName, replace: true);
        });
    super.initState();
  }
}
