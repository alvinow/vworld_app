import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/curvepainter.dart';
import 'dart:math' as math;
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/teethpicture.dart';

class PcSingleTeethGraphic extends StatelessWidget {
  PcSingleTeethGraphic(this.pcSingleTeethSideProperties, this.pcProperties,
      this.pcSingleTeethProperties, this.columnWidth);

  final PcSingleTeethSideProperties pcSingleTeethSideProperties;

  final PcSingleTeethProperties pcSingleTeethProperties;

  final PcProperties pcProperties;

  final double columnWidth;





  Widget getImplantPicture(String teethNumber, String side) {
    String pictureFileName =
        "assets/images/teeths/implant11_buccal_240x640.jpg";

    if (side == PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS) {
      pictureFileName = "assets/images/teeths/implant11_lingual_240x640.jpg";
    }

    Widget basePicture11 = Container(child: Image.asset(pictureFileName));

    return basePicture11;
  }

  @override
  Widget build(BuildContext context) {
    Widget teethPicture = Container(
        child: Stack(children: [
          TeethPicture(this.pcSingleTeethSideProperties.teethNumber, this.pcSingleTeethSideProperties.teethSide, this.pcSingleTeethProperties, this.pcSingleTeethSideProperties,columnWidth: this.columnWidth,),
      CustomPaint(
        painter:
        PerioTeethGraphic(this.pcSingleTeethSideProperties, this.pcProperties),
        child: Container(),
      ),
    ]));

    final String regio =
        this.pcSingleTeethSideProperties.teethNumber.substring(0, 1);

    Widget lReturnValue = Container();

    if (regio == '1' || regio == '2') {
      if (this.pcSingleTeethSideProperties.teethSide ==
          PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS) {
        lReturnValue = Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(math.pi),
          child: teethPicture,
        );
      } else {
        lReturnValue = teethPicture;
      }
    } else {
      if (this.pcSingleTeethSideProperties.teethSide ==
          PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        lReturnValue = Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(math.pi),
          child: teethPicture,
        );
      } else {
        lReturnValue = teethPicture;
      }
    }
    return lReturnValue;
  }
}
