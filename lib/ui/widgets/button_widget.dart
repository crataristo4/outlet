import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onButtonTapped;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color borderColor;
  final BorderRadiusGeometry borderRadiusGeometry;
  final double width;
  final double elevation;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  const ButtonWidget(
      {Key? key,
      required this.buttonName,
      required this.onButtonTapped,
      this.elevation = 0,
      required this.buttonColor,
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
                side: MaterialStateProperty.all(BorderSide(color: borderColor)),
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
