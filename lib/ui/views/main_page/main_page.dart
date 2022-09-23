import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:outlet/business_logic/models/outlets.dart';
import 'package:outlet/generated/l10n.dart';
import 'package:outlet/ui/widgets/app_sliver_header.dart';
import 'package:outlet/ui/widgets/outlet_widget.dart';
import 'package:outlet/ui/widgets/user_image_with_message_count.dart';
import 'package:outlet/utils/constants/strings.dart';

import '../../../utils/constants/dimens.dart';
import '../../../utils/constants/theme_colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/drawer_widget.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'main-page';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(
        messageCount: 4,
      ),
      floatingActionButton: GradientButtonWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(kRecordLotty, width: sixteenDp),
              SizedBox(width: eightDp),
              Text(
                S.of(context).record,
                style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
              ),
            ],
          ),
          onTap: () => onFabTapped(),
          //gradient: ThemeColor.buttonGradient,
          width: MediaQuery.of(context).size.width / 4,
          borderRadiusGeometry: BorderRadius.circular(sixteenDp),
          edgeInsetsGeometry: EdgeInsets.zero),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          AppSliverPersistentHeader(
              child: SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    leadingItem(),
                    Container(
                      margin: EdgeInsets.only(right: sixteenDp, top: tenDp),
                      child: DottedBorder(
                        strokeWidth: 0.9,
                        borderType: BorderType.RRect,
                        color: ThemeColor.kPrimary,
                        dashPattern: [9, 2],
                        radius: Radius.circular(twelveDp),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(twelveDp)),
                          child: Container(
                            padding: EdgeInsets.all(tenDp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle_rounded, color: ThemeColor.kPrimary),
                                SizedBox(width: tenDp),
                                Text(S.of(context).createAnOutlet,
                                    style: TextStyle(color: ThemeColor.kPrimary, fontFamily: 'extraBold'))
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(color: ThemeColor.kPrimary.withOpacity(0.2)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              min: oneFiftyDp,
              max: oneFiftyDp),
          SliverFillRemaining(
              child: ListView.builder(
            padding: EdgeInsets.only(bottom: hundredDp),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final outlet = listOfOutlets[index];
              final randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

              return OutletWidget(outlet: outlet, randomColor: randomColor);
            },
            itemCount: listOfOutlets.length,
          )),
        ],
      ),
    );
  }

  Widget leadingItem() {
    return GestureDetector(
      onTap: () => onLeadingTapped(),
      child: UserImageWithMessageCount(messageCount: 5, imageUrl: kAvatar),
    );
  }

  onFabTapped() {}

  ///scaffold key
  var scaffoldKey = GlobalKey<ScaffoldState>();

  ///on leading tapped
  onLeadingTapped() {
    ///OPENS DRAWER
    scaffoldKey.currentState!.openDrawer();
  }
}
