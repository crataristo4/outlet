import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  final Widget leading, title, action;
  final bool centerTitle, automaticallyImplyLeading;

  const AppSliverAppBar({
    Key? key,
    required this.leading,
    required this.title,
    required this.action,
    this.automaticallyImplyLeading = false,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: Colors.black),
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      floating: false,
      leading: leading,
      title: title,
      actions: [
        ///action button
        action
        /* GestureDetector(
          onTap: onActionButtonTapped,
          child: Container(
            child: action,
            margin: EdgeInsets.symmetric(horizontal: twentyDp),
          ),
        )*/
      ],
    );
  }
}
