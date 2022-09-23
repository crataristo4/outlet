import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outlet/ui/widgets/animated.column.dart';
import 'package:outlet/ui/widgets/counter_widget.dart';
import 'package:outlet/ui/widgets/user_image_with_message_count.dart';
import 'package:outlet/utils/constants/strings.dart';

import '../../generated/l10n.dart';
import '../../utils/constants/dimens.dart';
import '../../utils/constants/theme_colors.dart';

class DrawerWidget extends StatefulWidget {
  final int messageCount;
  const DrawerWidget({Key? key, this.messageCount = 0}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AnimatedColumnWidget(
              children: [
                Container(
                  decoration: BoxDecoration(gradient: ThemeColor.buttonGradient),
                  height: oneFiftyDp,
                  child: Padding(
                    padding: const EdgeInsets.only(top: thirtyDp, left: sixteenDp),
                    child: Row(
                      children: [
                        //user profile with message count
                        UserImageWithMessageCount(messageCount: widget.messageCount, imageUrl: kAvatar),
                        //user name
                        Text(
                          'Dev Enoch',
                          style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                        )
                      ],
                    ),
                  ),
                ),
                //todo change this to user image
                SizedBox(height: thirtyDp),
                drawerItems(icon: kOutletSvg, label: S.current.outlets),
                drawerItems(icon: kProfileSvg, label: S.current.profile),
                drawerItems(icon: kMsgSvg, label: S.current.messages, messageCount: widget.messageCount),
              ],
            ),
          ),
          SafeArea(
            child: AnimatedColumnWidget(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: ThemeColor.kPrimary),
                Padding(
                  padding: const EdgeInsets.only(left: sixteenDp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      subTitles(title: S.current.settings, onTap: () {}),
                      subTitles(title: S.current.helpCenter, onTap: () {}),
                      SizedBox(height: twentyDp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subTitles({required String title, required Function()? onTap}) {
    return ListTile(
      title: Text(title, style: TextStyle(fontFamily: 'bold')),
      onTap: onTap,
    );
  }

  ///items that show in the drawer
  Widget drawerItems({required String icon, required String label, Color iconColor = Colors.black, int messageCount = 0}) =>
      Builder(builder: (context) {
        return ListTile(
          onTap: () => onDrawerItemTapped(label, context),
          contentPadding: EdgeInsets.symmetric(horizontal: thirtyDp),
          leading: icon.isEmpty ? SizedBox() : SvgPicture.asset(icon),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontFamily: 'semiBold', fontSize: sixteenDp),
              ),
              SizedBox(width: sixDp),
              if (label.contains(S.current.messages))
                CounterWidget(
                  value: messageCount, //todo get from db
                  padding: EdgeInsets.all(fourDp),
                ),
            ],
          ),
        );
      });

  ///callback for drawer
  onDrawerItemTapped(String label, BuildContext context) {}
}
