import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';

class CounterWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding, margin;
  final int value;

  const CounterWidget({Key? key, this.margin = EdgeInsets.zero, this.padding = EdgeInsets.zero, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text('$value', style: TextStyle(color: Colors.white, fontSize: twelveDp)),
      decoration: BoxDecoration(color: ThemeColor.accent, shape: BoxShape.circle),
    );
  }
}
