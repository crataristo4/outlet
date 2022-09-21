import 'package:flutter/material.dart';

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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: walkThroughList
            .map((data) => WalkThroughItem(
                  data: data,
                ))
            .toList(),
      ),
    );
  }
}
