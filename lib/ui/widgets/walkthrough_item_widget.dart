import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../utils/constants/dimens.dart';

class WalkThroughItem extends StatelessWidget {
  final WalkThroughModel data;

  const WalkThroughItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sixteenDp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(tenDp),
            child: Image.asset(
              data.images[0],
              fit: BoxFit.cover,
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(
            height: twentyDp,
          ),
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: twentyDp,
              fontFamily: 'bold',
            ),
          ),
          const SizedBox(
            height: tenDp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: thirtyDp),
            child: Text(
              data.content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: sixteenDp,
                fontFamily: 'regular',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThroughModel {
  final String title, content;
  List<String> images;

  WalkThroughModel({required this.title, required this.content, required this.images});
}

List<WalkThroughModel> walkThroughList = [
  WalkThroughModel(title: S.current.shareYourThoughtAnonymously, content: S.current.shareYourThoughtDescription, images: ['']),
  WalkThroughModel(title: S.current.providingOutlet, content: S.current.providingOutletDescription, images: ['']),
  WalkThroughModel(title: S.current.sendAnonymousMessage, content: S.current.sendAnonymousMessageDescription, images: ['']),
];
