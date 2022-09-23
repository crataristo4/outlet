import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onButtonTapped;
  final Color? buttonColor;
  final Color buttonTextColor;
  final Color? borderColor;
  final BorderRadiusGeometry borderRadiusGeometry;
  final double width;
  final double elevation;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  const ButtonWidget(
      {Key? key,
      required this.buttonName,
      required this.onButtonTapped,
      this.elevation = 0,
      this.buttonColor,
      this.borderColor = Colors.transparent,
      required this.width,
      this.edgeInsetsGeometry = EdgeInsets.zero,
      required this.borderRadiusGeometry,
      required this.buttonTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: width,
          height: fortyFourDp,
          margin: edgeInsetsGeometry,
          child: ElevatedButton(
            onPressed: () {
              //HapticFeedback.vibrate();
              onButtonTapped();
            },
            child: Text(
              buttonName,
              style: TextStyle(color: buttonTextColor, fontFamily: 'medium'),
            ),
            style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: borderColor!)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: borderRadiusGeometry,
                )),
                elevation: MaterialStateProperty.resolveWith<double>((states) => elevation),
                backgroundColor: MaterialStateProperty.all(buttonColor)),
          ),
        );
      },
    );
  }
}

class GradientButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final double width;
  final Widget child;
  final BoxShape? boxShape;
  final double height;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  // final Gradient gradient;

  const GradientButtonWidget(
      {Key? key,
      required this.onTap,
      required this.width,
      this.edgeInsetsGeometry = EdgeInsets.zero,
      this.height = fortyFourDp,
      this.boxShape = BoxShape.rectangle,
      required this.borderRadiusGeometry,
      // required this.gradient,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            margin: edgeInsetsGeometry,
            decoration: BoxDecoration(shape: boxShape!, gradient: ThemeColor.buttonGradient, borderRadius: borderRadiusGeometry),
            child: child,
          ),
        );
      },
    );
  }
}

class DialogActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const DialogActionButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextButton(child: child, onPressed: onPressed)
        : CupertinoDialogAction(child: child, onPressed: onPressed);
  }
}
