import 'package:flutter/material.dart';
import 'package:outlet/ui/views/profile/profile.dart';
import 'package:outlet/utils/constants/dimens.dart';

import '../../../generated/l10n.dart';
import '../../../utils/functions.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/walkthrough_item_widget.dart';

class WalkThroughPage extends StatefulWidget {
  static const String routeName = 'walk through';
  const WalkThroughPage({Key? key}) : super(key: key);

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: walkThroughList.map((data) => WalkThroughItem(data: data, index: currentIndex)).toList(),
          ),
          Positioned(
            bottom: threeHundredDp,
            child: Row(
              children: indicatorCount(currentIndex: currentIndex, items: walkThroughList),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GradientButtonWidget(
                child: Center(
                  child: Text(
                    currentIndex == 2 ? S.of(context).start : S.of(context).getStarted,
                    style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                  ),
                ),
                onTap: () => onButtonTapped(),
                // gradient: LinearGradient(colors: ThemeColor.gradientPrimary, begin: Alignment.topLeft),
                width: MediaQuery.of(context).size.width,
                borderRadiusGeometry: BorderRadius.circular(twentyDp),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: twentyDp, horizontal: twentyDp)),
          ),
        ],
      ),
    );
  }

  onButtonTapped() {
    switchScreen(context, ProfilePage.routeName, replace: true);
  }
}
