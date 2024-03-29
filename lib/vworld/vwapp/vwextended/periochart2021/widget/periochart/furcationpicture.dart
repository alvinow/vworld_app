import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/fonts/perio_icon_icons.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/cycliciconbutton.dart';


class FurcationPicture extends StatelessWidget {
  FurcationPicture(this.teethNumber, this.side,
      {this.furcationLevelPointA: 0, this.furcationLevelPointB: 0});

  final String? teethNumber;
  final String? side;
  final int? furcationLevelPointA;
  final int? furcationLevelPointB;

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container();

    int furcationType = 0;

    if (side == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      if (teethNumber == "18" ||
          teethNumber == "17" ||
          teethNumber == "16" ||
          teethNumber == "28" ||
          teethNumber == "27" ||
          teethNumber == "26" ||
          teethNumber == "48" ||
          teethNumber == "47" ||
          teethNumber == "46" ||
          teethNumber == "38" ||
          teethNumber == "37" ||
          teethNumber == "36") {
        furcationType = 1;
      }
    } else if (side ==
        PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS) {
      if (teethNumber == "48" ||
          teethNumber == "47" ||
          teethNumber == "46" ||
          teethNumber == "38" ||
          teethNumber == "37" ||
          teethNumber == "36") {
        furcationType = 1;
      } else if (teethNumber == "18" ||
          teethNumber == "17" ||
          teethNumber == "16" ||
          teethNumber == "14" ||
          teethNumber == "28" ||
          teethNumber == "27" ||
          teethNumber == "26" ||
          teethNumber == "24") {
        furcationType = 2;
      }
    }

    if (furcationType == 0) {
    } else if (furcationType == 1) {
      returnValue = CyclicIconButton(
          backgroundColor: Colors.transparent,
          fieldName: PcSingleTeethSideProperties.furcationLevelPointACCFN,
          initialIndex: this.furcationLevelPointA,
          iconDataList: <IconData>[
            Icons.circle,
            Icons.brightness_1_outlined,
            PerioIcon.half_circle_svgrepo_com,
            Icons.circle
          ],
          iconSize: 14,
          colorList: <Color>[
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.black
          ],
          isReadOnly: true);
    } else if (furcationType == 2) {
      returnValue = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CyclicIconButton(
              backgroundColor: Colors.transparent,
              fieldName: PcSingleTeethSideProperties.furcationLevelPointACCFN,
              initialIndex: this.furcationLevelPointA,
              iconDataList: <IconData>[
                Icons.circle,
                Icons.brightness_1_outlined,
                PerioIcon.half_circle_svgrepo_com,
                Icons.circle
              ],
              iconSize: 14,
              colorList: <Color>[
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.black
              ],
              isReadOnly: true),
          CyclicIconButton(
              backgroundColor: Colors.transparent,
              fieldName: PcSingleTeethSideProperties.furcationLevelPointBCCFN,
              initialIndex: this.furcationLevelPointB,
              iconDataList: <IconData>[
                Icons.circle,
                Icons.brightness_1_outlined,
                PerioIcon.half_circle_svgrepo_com,
                Icons.circle
              ],
              iconSize: 14,
              colorList: <Color>[
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.black
              ],
              isReadOnly: true)
        ],
      );
    }

    return returnValue;
  }
}
