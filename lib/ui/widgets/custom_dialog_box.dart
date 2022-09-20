import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';

class CustomDialogBox extends StatefulWidget {
  final Widget child;

  const CustomDialogBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: tenDp, sigmaY: tenDp),
      child: widget.child,
    );
  }
}
