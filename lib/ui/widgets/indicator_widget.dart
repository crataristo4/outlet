import 'package:flutter/material.dart';

import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';

class Indicators extends StatefulWidget {
  final List list;
  final int index;

  const Indicators({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: tenDp,
                  height: tenDp,
                  margin: const EdgeInsets.only(left: fourDp, right: fourDp, bottom: twelveDp),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(twentyDp),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? ThemeColor.kPrimary
                              : ThemeColor.kSecondary.withOpacity(.4))
                          .withOpacity(widget.index == entry.key ? 1 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
