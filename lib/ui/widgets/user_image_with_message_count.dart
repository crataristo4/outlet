import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';
import 'counter_widget.dart';

class UserImageWithMessageCount extends StatelessWidget {
  final String imageUrl;
  final int messageCount;
  const UserImageWithMessageCount({Key? key, required this.messageCount, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          margin: EdgeInsets.only(left: sixteenDp, top: tenDp, right: sixteenDp),
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColor.kGreenLight, width: 0.1),
            shape: BoxShape.circle,
          ),
          width: fiftyDp,
          child: Image.asset(imageUrl), //todo change to network image
        ),
        Positioned(
          right: twelveDp,
          top: sixDp,
          child: CounterWidget(value: messageCount, padding: EdgeInsets.all(fourDp)),
        ),
      ],
    );
  }
}
