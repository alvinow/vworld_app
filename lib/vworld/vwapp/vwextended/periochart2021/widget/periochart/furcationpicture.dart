import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/cycliciconbutton.dart';

class FurcationPicture extends StatelessWidget{

  FurcationPicture(this.teethNumber, this.side, {this.furcationLevelPointA:0,this.furcationLevelPointB:0});

  final String teethNumber;
  final String side;
  final int furcationLevelPointA;
  final int furcationLevelPointB;
  //final PcSingleTeethProperties pcSingleTeethProperties;

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
          backgroundColor: Colors.white70,
          fieldName: PcSingleTeethSideProperties.furcationLevelPointACCFN,
          initialIndex: this.furcationLevelPointA,
          iconDataList: <IconData>[
            Icons.circle,
            Icons.brightness_1_outlined,
            Icons.brightness_medium_rounded,
            Icons.circle
          ],
          iconSize: 14,
          colorList: <Color>[
            Colors.green,
            Colors.yellow,
            Colors.orange,
            Colors.red
          ],
          isReadOnly: true);
    } else if (furcationType == 2) {

      /*
      if (side == PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS) {
        initialIndexA =
            this.pcSingleTeethProperties.lingualSide.furcationLevelPointA;
        initialIndexB =
            this.pcSingleTeethProperties.lingualSide.furcationLevelPointB;
      } else {
        initialIndexA =
            this.pcSingleTeethProperties.buccalSide.furcationLevelPointA;
        initialIndexB =
            this.pcSingleTeethProperties.buccalSide.furcationLevelPointB;
      }*/

      returnValue = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CyclicIconButton(
              backgroundColor: Colors.yellow,
              fieldName: PcSingleTeethSideProperties.furcationLevelPointACCFN,
              initialIndex: this.furcationLevelPointA,
              iconDataList: <IconData>[
                Icons.circle,
                Icons.brightness_1_outlined,
                Icons.brightness_medium_rounded,
                Icons.circle
              ],
              iconSize: 14,
              colorList: <Color>[
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red
              ],
              isReadOnly: true),
          CyclicIconButton(
              backgroundColor: Colors.yellow,
              fieldName: PcSingleTeethSideProperties.furcationLevelPointBCCFN,
              initialIndex: this.furcationLevelPointB,
              iconDataList: <IconData>[
                Icons.circle,
                Icons.brightness_1_outlined,
                Icons.brightness_medium_rounded,
                Icons.circle
              ],
              iconSize: 14,
              colorList: <Color>[
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.red
              ],
              isReadOnly: true)
        ],
      );
    }

    return returnValue;

  }
}