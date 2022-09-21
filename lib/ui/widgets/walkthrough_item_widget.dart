import 'package:flutter/material.dart';
import 'package:outlet/utils/constants/strings.dart';

import '../../generated/l10n.dart';
import '../../utils/constants/dimens.dart';

class WalkThroughItem extends StatelessWidget {
  final WalkThroughModel data;
  final int index;

  const WalkThroughItem({Key? key, required this.data, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: twoHundredDp,
                    left: MediaQuery.of(context).size.width / 5,
                    right: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Image.asset(
                          data.images[3],
                          width: MediaQuery.of(context).size.width / 0.5,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: oneFiftyDp,
                            ),
                            Text(
                              data.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontFamily: 'extraBold', fontSize: fifteenDp),
                            ),
                            const SizedBox(
                              height: sixDp,
                            ),
                            Text(
                              data.content,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'regular',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: eightyDp, left: sixteenDp, child: Image.asset(data.images[0], width: eightyDp)),
                  //joke emoji
                  Positioned(top: oneSixtyDp, right: fiftyDp, child: Image.asset(data.images[1], width: fiftyDp)),
                  //Second page
                  if (data.title.contains(S.current.providingOutlet) || data.title.contains(S.current.sendAnonymousMessage))
                    Positioned(top: twoEightyDp, right: ninetyDp, child: Image.asset(data.images[6], width: eightyDp)),
                  if (data.title.contains(S.current.providingOutlet) || data.title.contains(S.current.sendAnonymousMessage))
                    Positioned(top: twoTwentyDp, right: fortyDp, child: Image.asset(data.images[7], width: ninetyDp)),
                  if (data.title.contains(S.current.sendAnonymousMessage))
                    Positioned(top: twoEightyDp, right: twentyDp, child: Image.asset(data.images[8], width: ninetyDp)),

                  Positioned(top: oneEightyDp, left: fortyEightDp, child: Image.asset(data.images[2], width: eightyDp)),
                  Positioned(bottom: threeEightyDp, left: thirtyDp, child: Image.asset(data.images[4], width: sixtyDp)),
                  Positioned(bottom: threeFiftyDp, right: thirtyDp, child: Image.asset(data.images[5], width: hundredDp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThroughModel {
  final String title, content;
  List<String> images;

  WalkThroughModel({required this.title, required this.content, required this.images});
}

final List<String> wt1 = [kCry, kJoke, kFace, kMic, kLoud, kSad];
final List<String> wt2 = [kCry, kJoke, kFace, kMic, kLoud, kSad, kLady, kDoc];
final List<String> wt3 = [kCry, kJoke, kFace, kMic, kLoud, kSad, kLady, kDoc, kManHat];
List<WalkThroughModel> walkThroughList = [
  WalkThroughModel(title: S.current.shareYourThoughtAnonymously, content: S.current.shareYourThoughtDescription, images: wt1),
  WalkThroughModel(title: S.current.providingOutlet, content: S.current.providingOutletDescription, images: wt2),
  WalkThroughModel(title: S.current.sendAnonymousMessage, content: S.current.sendAnonymousMessageDescription, images: wt3),
];
