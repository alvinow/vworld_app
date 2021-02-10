import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/curvepainter.dart';

class PcSingleTeethGraphic extends StatelessWidget {
  PcSingleTeethGraphic(
      this.pcSingleTeethSidePropertiesProperties, this.pcProperties);

  final PcSingleTeethSideProperties pcSingleTeethSidePropertiesProperties;

  final PcProperties pcProperties;

  Widget getTeethPicture(String teethNumber, String Side) {
    final String assetName = "assets/svg/jaw/svg_teeth.svg";

    final Widget svg = SvgPicture.asset(
      assetName,

    height: 100,width: 50,
    );

    return svg;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Container(child: Image.asset("assets/images/teeth11.jpg")
      Container(  transform: Matrix4.diagonal3Values(3.0, 3.0, 1.0),  child:this.getTeethPicture(this.pcSingleTeethSidePropertiesProperties.teethNumber, this.pcSingleTeethSidePropertiesProperties.teethSide)
      ),
      CustomPaint(
        painter: CurvePainter(
            this.pcSingleTeethSidePropertiesProperties, this.pcProperties),
        child: Container(),
      ),
    ]);
  }
}
