import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:outlet/business_logic/models/outlets.dart';
import 'package:outlet/generated/l10n.dart';
import 'package:outlet/utils/constants/dimens.dart';
import 'package:outlet/utils/constants/strings.dart';

DateFormat dateFormat = DateFormat('dd MMM yyyy | h:mm a');

class OutletWidget extends StatefulWidget {
  final Outlet outlet;
  final Color randomColor;
  const OutletWidget({Key? key, required this.outlet, required this.randomColor}) : super(key: key);

  @override
  State<OutletWidget> createState() => _OutletWidgetState();
}

class _OutletWidgetState extends State<OutletWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: twoHundredDp,
      margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
      child: Padding(
        padding: const EdgeInsets.all(sixteenDp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: tenDp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.outlet.message!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                ),
              ),
              //SizedBox(width: fourDp),
              /*    Expanded(
                child: ExpandableText(
                  widget.outlet.message!,
                  expandText: S.current.showMore,
                  collapseText: S.current.showLess,
                  maxLines: 2,
                  linkColor: Colors.blue,
                  style: TextStyle(color: Colors.white, fontFamily: 'extraBold'),
                ),
              ),*/
              Image.asset(
                kVoiceWave,
                width: twentyDp,
              )
            ],
          ),
          Expanded(
            child: RichText(
              textWidthBasis: TextWidthBasis.parent,
              textAlign: TextAlign.start,
              text: TextSpan(
                text: '',
                children: <TextSpan>[
                  textSpan('${S.current.by} ', TextStyle(color: Colors.white, fontFamily: 'extraBold')),
                  textSpan(widget.outlet.username!, TextStyle(color: Colors.white, fontFamily: 'regular')),
                ],
              ),
            ),
          ),

          //todo add audio wave
          SizedBox(height: fiftyDp),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: widget.outlet.audioUrl!.isEmpty
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(tenDp),
                            child: Text(dateFormat.format(widget.outlet.reminder!)),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(sixteenDp)),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(kCalenderSvg),
                            label: Text(
                              S.current.setReminder,
                              style: TextStyle(color: Colors.white, fontFamily: 'bold'),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Image.asset(
                            kHeadPhone,
                            width: thirtySixDp,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: eightDp),
                              child: RichText(
                                textWidthBasis: TextWidthBasis.parent,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: '',
                                  children: <TextSpan>[
                                    textSpan('${widget.outlet.totalListeners}k ',
                                        TextStyle(color: Colors.white, fontFamily: 'extraBold')),
                                    textSpan(S.current.peopleListening, TextStyle(color: Colors.white, fontFamily: 'regular')),
                                  ],
                                ),
                              ))
                        ],
                      ),
              ),
              SvgPicture.asset(kMenuSvg)
            ],
          )
        ]),
      ),
      decoration: BoxDecoration(color: widget.randomColor, borderRadius: BorderRadius.circular(sixteenDp)),
    );
  }

  TextSpan textSpan(String value, TextStyle textStyle) {
    return TextSpan(
      text: value,
      style: textStyle,
    );
  }
}
