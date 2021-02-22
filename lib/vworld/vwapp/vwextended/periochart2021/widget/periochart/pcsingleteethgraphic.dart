import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/curvepainter.dart';
import 'dart:math' as math;

class PcSingleTeethGraphic extends StatelessWidget {
  PcSingleTeethGraphic(this.pcSingleTeethSideProperties, this.pcProperties,
      this.pcSingleTeethProperties);

  final PcSingleTeethSideProperties pcSingleTeethSideProperties;

  final PcSingleTeethProperties pcSingleTeethProperties;

  final PcProperties pcProperties;

  Widget getTeethPicture(String teethNumber, String side) {
    String pictureFileName = "assets/images/teeths/image_not_found.jpg";

    if (side == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      pictureFileName = "assets/images/teeths/teeth11_buccal_240x640.jpg";
    } else {
      pictureFileName = "assets/images/teeths/teeth11_lingual_240x640.jpg";
    }

    Widget implantPicture11 = Container();

    if (this.pcSingleTeethProperties.isImplant == 1) {
      implantPicture11 = this.getImplantPicture(teethNumber, side);
    }

    Widget basePicture11 = Stack(
        children: [
      Container(child: Image.asset(pictureFileName)),
      implantPicture11
    ]);

    final String regio =
        this.pcSingleTeethSideProperties.teethNumber.substring(0, 1);

    Widget lReturnValue = basePicture11;

    if (regio == '2' || regio == '3') //flip horizontal
    {
      lReturnValue = Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: basePicture11,
      );
    }

    return lReturnValue;
  }

  Widget getImplantPicture(String teethNumber, String side) {
    String pictureFileName =
        "assets/images/teeths/implant11_buccal_240x640.jpg";

    if(side==PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS)
      {
        pictureFileName =
        "assets/images/teeths/implant11_lingual_240x640.jpg";
      }

    Widget basePicture11 = Container( child: Image.asset(pictureFileName));

    return basePicture11;
  }

  @override
  Widget build(BuildContext context) {
    Widget teethPicture = Container(
        child: Stack(children: [
      this.getTeethPicture(this.pcSingleTeethSideProperties.teethNumber,
          this.pcSingleTeethSideProperties.teethSide),
      CustomPaint(
        painter:
            CurvePainter(this.pcSingleTeethSideProperties, this.pcProperties),
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
