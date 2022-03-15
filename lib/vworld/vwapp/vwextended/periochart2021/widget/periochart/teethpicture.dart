import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/furcationpicture.dart';
import 'dart:math' as math;

class TeethPicture extends StatelessWidget {

  TeethPicture(this.teethNumber, this.side, this.pcSingleTeethProperties,this.pcSingleTeethSideProperties,{this.columnWidth});

  final String? teethNumber;
  final String? side;
  final PcSingleTeethProperties pcSingleTeethProperties;
  final PcSingleTeethSideProperties? pcSingleTeethSideProperties;
  final double? columnWidth;




  @override
  Widget build(BuildContext context) {


    String pictureFileName = "assets/images/teeths/image_not_found.jpg";

    int? furcationLevelPointA=0;

    int? furcationLevelPointB=0;


    if (side == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      pictureFileName = "assets/images/teeths/teeth11_buccal_240x640.jpg";
      furcationLevelPointA=this.pcSingleTeethProperties.buccalSide!.furcationLevelPointA;
      furcationLevelPointB=this.pcSingleTeethProperties.buccalSide!.furcationLevelPointB;
    } else {
      pictureFileName = "assets/images/teeths/teeth11_lingual_240x640.jpg";
      furcationLevelPointA=this.pcSingleTeethProperties.lingualSide!.furcationLevelPointA;
      furcationLevelPointB=this.pcSingleTeethProperties.lingualSide!.furcationLevelPointB;
    }

    Widget implantPicture11 = Container();

    if (this.pcSingleTeethProperties.isImplant == 1) {
      implantPicture11 = this.getImplantPicture(teethNumber, side);
    }

    Widget furcationPicture11=Container();

    if(this.pcSingleTeethProperties.isImplant==0) {
      furcationPicture11 =FurcationPicture(
        teethNumber, side, furcationLevelPointA: furcationLevelPointA,
        furcationLevelPointB: furcationLevelPointB,);
    }

    Widget basePicture11 = Stack(children: [
      Container(child: Image.asset(pictureFileName)),
      implantPicture11,
      Container(height: 115, width: this.columnWidth, child: furcationPicture11)
    ]);

    final String regio =
    this.pcSingleTeethSideProperties!.teethNumber!.substring(0, 1);

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

  Widget getImplantPicture(String? teethNumber, String? side) {
    String pictureFileName =
        "assets/images/teeths/implant11_buccal_240x640.jpg";

    if (side == PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS) {
      pictureFileName = "assets/images/teeths/implant11_lingual_240x640.jpg";
    }

    Widget basePicture11 = Container(child: Image.asset(pictureFileName));

    return basePicture11;
  }
}