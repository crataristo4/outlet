import 'package:flutter/material.dart';

import '../ui/views/splash_screen/splash_screen.dart';
import '../ui/views/walkthrough/walkthrough.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      ///splash screen
      case SplashScreenPage.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreenPage());

      ///walk through screen
      case WalkThroughPage.routeName:
        return CustomPageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const WalkThroughPage(),
        );

      default:
        //error page
        return _errorRoute();
    }
  }

//error page ..
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Page not Found"),
        ),
      );
    });
  }
}

class CustomPageRouteBuilder<T> extends PageRoute<T> {
  final RoutePageBuilder pageBuilder;
  final PageTransitionsBuilder matchingBuilder =
      const CupertinoPageTransitionsBuilder(); // Default iOS/macOS (to get the swipe right to go back gesture)
  // final PageTransitionsBuilder matchingBuilder = const FadeUpwardsPageTransitionsBuilder(); // Default Android/Linux/Windows

  CustomPageRouteBuilder({required this.pageBuilder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300); // Can give custom Duration, unlike in MaterialPageRoute

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return matchingBuilder.buildTransitions<T>(this, context, animation, secondaryAnimation, child);
  }
}
