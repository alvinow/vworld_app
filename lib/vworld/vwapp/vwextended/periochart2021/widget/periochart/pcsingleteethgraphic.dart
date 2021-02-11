import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/curvepainter.dart';
import 'dart:math' as math;

class PcSingleTeethGraphic extends StatelessWidget {
  PcSingleTeethGraphic(
      this.pcSingleTeethSideProperties, this.pcProperties);

  final PcSingleTeethSideProperties pcSingleTeethSideProperties;

  final PcProperties pcProperties;

  /*
  Widget getTeethPicture(String teethNumber, String side) {
    final String assetName = "assets/svg/jaw/svg_teeth.svg";

    final Widget svg = SvgPicture.asset(
      assetName,

    height: 100,width: 50,
    );

    return svg;
  }
  */

  Widget getTeethPicture(String teethNumber, String side){

    Widget basePicture11=Container(child: Image.asset("assets/images/teeth11.jpg")
    //Container(  transform: Matrix4.diagonal3Values(3.0, 3.0, 1.0),  child:this.getTeethPicture(this.pcSingleTeethSidePropertiesProperties.teethNumber, this.pcSingleTeethSidePropertiesProperties.teethSide)
    );

    final String regio=this.pcSingleTeethSideProperties.teethNumber.substring(0,1);


    Widget lReturnValue=basePicture11;

    if(regio=='2' || regio=='3') //flip horizontal
      {
      lReturnValue=Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: basePicture11,
      );
      }

    return lReturnValue;
  }



  @override
  Widget build(BuildContext context) {


    Widget teethPicture= Stack(children: [
      /*Container(child: Image.asset("assets/images/teeth11.jpg")
      //Container(  transform: Matrix4.diagonal3Values(3.0, 3.0, 1.0),  child:this.getTeethPicture(this.pcSingleTeethSidePropertiesProperties.teethNumber, this.pcSingleTeethSidePropertiesProperties.teethSide)
      ),*/
      this.getTeethPicture(this.pcSingleTeethSideProperties.teethNumber,this.pcSingleTeethSideProperties.teethSide),
      CustomPaint(
        painter: CurvePainter(
            this.pcSingleTeethSideProperties, this.pcProperties),
        child: Container(),
      ),
    ]);

   final String regio=this.pcSingleTeethSideProperties.teethNumber.substring(0,1);

   Widget lReturnValue=Container();

   if(regio=='1' || regio=='2'){

     if(this.pcSingleTeethSideProperties.teethSide==PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS)
       {
         lReturnValue=Transform(
           alignment: Alignment.center,
           transform: Matrix4.rotationX(math.pi),
           child: teethPicture,
         );
       }
     else{
       lReturnValue= teethPicture;
     }

   }
   else{
     if(this.pcSingleTeethSideProperties.teethSide==PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS)
     {
       lReturnValue=Transform(
         alignment: Alignment.center,
         transform: Matrix4.rotationX(math.pi),
         child: teethPicture,
       );
     }
     else{
       lReturnValue= teethPicture;
     }
   }
 return lReturnValue;
  }
}
