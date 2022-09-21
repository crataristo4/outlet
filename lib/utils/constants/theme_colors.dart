import 'package:flutter/services.dart';

class ThemeColor {
  //******************  APP COLORS ***********************************//
  static Color kPrimary = const Color(0xff833ab4);
  static Color kPrimaryLight = const Color(0xffe8c6ff);
  static Color kSecondary = const Color(0xff4c9a2a);
  static const accent = Color(0xffcc0229);
  static const kGreenLight = Color(0xff6fcf97);
  static const kAppBgDark = Color(0xfff8f8f8);
  static const kAppGrayLight = Color(0xfff0eded);
  static const kAppGray = Color(0xffc4c4c4);
  static const kAppGrayDeep = Color(0xff787777);
  static Color kPending = const Color(0xfff29f18);
  static const kAppGrayComment = Color(0xff545454);
  static const kAppBgColor = Color(0xffe5e5e5);

  //*******GRADIENT************//
  static List<Color> gradientPrimary = [Color(0xff8e2de2), Color(0xff4a00e0)];

  //todo change to match screen where necessary
  static void overlayStyle(Color color) {
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: color));
  }
}
