import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';

class PerioTeethGraphic extends CustomPainter {
  PerioTeethGraphic(this.pcSingleTeethSideProperties, this.pcProperties);

  final PcSingleTeethSideProperties? pcSingleTeethSideProperties;

  final PcProperties? pcProperties;

  @override
  void paint(Canvas canvas, Size size) {
    final double baseheight=74;

    final double heightmultiplier=5;

    this.paintHorizontalGrid(canvas, size,baseheight,heightmultiplier);
    this.paintProbingDepth(canvas, size,baseheight,heightmultiplier);
    this.paintGingivalMargin(canvas, size,baseheight,(heightmultiplier*-1));

  }

  void paintHorizontalGrid(Canvas canvas, Size size, double baseheight,double heightmultiplier){

    var paint = Paint();

    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;


    for(int la=0;la<14;la++){

      double currentHeight=baseheight-(heightmultiplier*la);

      var startPoint = Offset(0, currentHeight);
      var controlPoint1 = Offset(2 * size.width / 4, currentHeight);
      var endPoint = Offset(size.width, currentHeight);

      var path = Path();
      path.moveTo(startPoint.dx, startPoint.dy);
      path.cubicTo(startPoint.dx, startPoint.dy, controlPoint1.dx,
          controlPoint1.dy, endPoint.dx, endPoint.dy);

      canvas.drawPath(path, paint);

    }



  }

  //gingival margin
  void paintItRed(Canvas canvas, Size size, double baseheight,double heightmultiplier) {
    var paint = Paint();

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    //var baseheight = 74.0;

    var startPoint = Offset(0, baseheight);
    var controlPoint1 = Offset(2 * size.width / 4, baseheight);
    var endPoint = Offset(size.width, baseheight);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(startPoint.dx, startPoint.dy, controlPoint1.dx,
        controlPoint1.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  static String? getLeftNeighbourTeethNumber(String? teethNumber) {
    String? returnValue;
    try {
      if (teethNumber == '18' ||
          teethNumber == '21' ||
          teethNumber == '48' ||
          teethNumber == '31') {
      } else {
        int regio = int.parse(teethNumber!.substring(0, 1));
        int row = int.parse(teethNumber.substring(1, 2));

        if (regio == 1 || regio == 4) {
          returnValue = regio.toString() + (row + 1).toString();
        } else {
          returnValue = regio.toString() + (row - 1).toString();
        }
      }
    } catch (error) {
      print(
          "Error Catched on static String getLeftNeighbourTeethNumber(String teethNumber);ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }

  static String? getRightNeighbourTeethNumber(String? teethNumber) {
    String? returnValue;
    try {
      if (teethNumber == '11' ||
          teethNumber == '28' ||
          teethNumber == '41' ||
          teethNumber == '38') {
      } else {
        int regio = int.parse(teethNumber!.substring(0, 1));
        int row = int.parse(teethNumber.substring(1, 2));

        if (regio == 1 || regio == 4) {
          returnValue = regio.toString() + (row - 1).toString();
        } else {
          returnValue = regio.toString() + (row + 1).toString();
        }
      }
    } catch (error) {}

    return returnValue;
  }

  PcSingleTeethSideProperties? getLeftNeighborSingleTeethSideProperties() {
    PcSingleTeethSideProperties? returnValue;

    try {
      String? leftNeighbourTeethNumber = PerioTeethGraphic
          .getLeftNeighbourTeethNumber(
          this.pcSingleTeethSideProperties!.teethNumber);

      if (leftNeighbourTeethNumber != null &&
          leftNeighbourTeethNumber.length == 2) {
        PcSingleTeethProperties? pcSingleTeethProperties =
        this.pcProperties!.getTeeth(leftNeighbourTeethNumber);

        if (this.pcSingleTeethSideProperties!.teethSide ==
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
          returnValue = pcSingleTeethProperties!.buccalSide;
        } else {
          returnValue = pcSingleTeethProperties!.lingualSide;
        }
      }
    }
    catch(error){
      print(
          "Error catched on CurvePainter.PcSingleTeethSideProperties getLeftNeighborSingleTeethSideProperties();ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }

  PcSingleTeethSideProperties? getRightNeighborSingleTeethSideProperties() {
    PcSingleTeethSideProperties? returnValue;

    try {
      String? rightNeighbourTeethNumber =
      PerioTeethGraphic.getRightNeighbourTeethNumber(
              this.pcSingleTeethSideProperties!.teethNumber);

      if (rightNeighbourTeethNumber != null &&
          rightNeighbourTeethNumber.length == 2) {
        PcSingleTeethProperties? pcSingleTeethProperties =
            this.pcProperties!.getTeeth(rightNeighbourTeethNumber);

        if (this.pcSingleTeethSideProperties!.teethSide ==
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
          returnValue = pcSingleTeethProperties!.buccalSide;
        } else {
          returnValue = pcSingleTeethProperties!.lingualSide;
        }
      }
    } catch (error) {
      print(
          "Error catched on CurvePainter.PcSingleTeethSideProperties getRightNeighborSingleTeethSideProperties();ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }


  void paintGingivalMargin(Canvas canvas, Size size,double baseheight,double heightmultiplier){
    try {
      var paint = Paint();

      paint.color = Colors.red;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 2;

      //var baseheight = 90.0;

      PcSingleTeethSideProperties? leftNeighborSingleTeethSideProperties =
      this.getLeftNeighborSingleTeethSideProperties();

      PcSingleTeethSideProperties? rightNeighborSingleTeethSideProperties =
      this.getRightNeighborSingleTeethSideProperties();

      double leftNeighbourDx = 0;
      double? leftNeighbourDy;

      if (leftNeighborSingleTeethSideProperties != null) {
        leftNeighbourDy = baseheight -
            (0.5 *
                heightmultiplier *
                (this.pcSingleTeethSideProperties!.gingivalMarginPointA! +
                    leftNeighborSingleTeethSideProperties.gingivalMarginPointC!));
      }

      var startPointDx = size.width / 8;
      var startPointDy = baseheight -
          (this.pcSingleTeethSideProperties!.gingivalMarginPointA! * heightmultiplier);

      var controlPoint1Dx = size.width / 2;
      var controlPoint1Dy = baseheight -
          (this.pcSingleTeethSideProperties!.gingivalMarginPointB! * heightmultiplier);

      var endPointDx = 7 * size.width / 8;
      var endPointDy = baseheight -
          (this.pcSingleTeethSideProperties!.gingivalMarginPointC! * heightmultiplier);

      double rightNeighbourDx = size.width;
      double? rightNeighbourDy;

      if (rightNeighborSingleTeethSideProperties != null) {
        rightNeighbourDy = baseheight -
            (0.5 *
                heightmultiplier *
                (this.pcSingleTeethSideProperties!.gingivalMarginPointC! +
                    rightNeighborSingleTeethSideProperties.gingivalMarginPointA!));
      }

      Offset? leftNeighbourPoint;
      if (leftNeighbourDy != null) {
        leftNeighbourPoint = Offset(leftNeighbourDx, leftNeighbourDy);
      }
      var startPoint = Offset(startPointDx, startPointDy);
      var controlPoint1 = Offset(controlPoint1Dx, controlPoint1Dy);
      var endPoint = Offset(endPointDx, endPointDy);

      Offset? rightNeighbourPoint;
      if (rightNeighbourDy != null) {
        rightNeighbourPoint = Offset(rightNeighbourDx, rightNeighbourDy);
      }

      var path = Path();

      if (leftNeighbourPoint != null) {
        path.moveTo(leftNeighbourPoint.dx, leftNeighbourPoint.dy);
        path.lineTo(startPoint.dx, startPoint.dy);
      } else {
        path.moveTo(startPoint.dx, startPoint.dy);
      }
      path.lineTo(controlPoint1.dx, controlPoint1.dy);
      path.lineTo(endPoint.dx, endPoint.dy);

      if (rightNeighbourPoint != null) {
        path.lineTo(rightNeighbourPoint.dx, rightNeighbourPoint.dy);
      }

      /*
    path.cubicTo(startPoint.dx, startPoint.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);*/

      canvas.drawPath(path, paint);
    } catch (error) {
      print(
          "Error Catched on CurvePainter.paintItLightBlue(Canvas canvas, Size size);ErrorMessage=" +
              error.toString());
    }
  }


  void paintProbingDepth(Canvas canvas, Size size,double baseheight,double heightmultiplier) {
    try {
      var paint = Paint();

      paint.color = Colors.lightBlue;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 2;

      //var baseheight = 90.0;

      PcSingleTeethSideProperties? leftNeighborSingleTeethSideProperties =
          this.getLeftNeighborSingleTeethSideProperties();

      PcSingleTeethSideProperties? rightNeighborSingleTeethSideProperties =
          this.getRightNeighborSingleTeethSideProperties();

      double leftNeighbourDx = 0;
      double? leftNeighbourDy;

      if (leftNeighborSingleTeethSideProperties != null) {
        leftNeighbourDy = baseheight -
            (0.5 *
                heightmultiplier *
                ((this.pcSingleTeethSideProperties!.probingDepthPointA!-this.pcSingleTeethSideProperties!.gingivalMarginPointA!) +
                    (leftNeighborSingleTeethSideProperties.probingDepthPointC!-leftNeighborSingleTeethSideProperties.gingivalMarginPointC!)   ));
      }

      var startPointDx = size.width / 8;
      var startPointDy = baseheight -
          ((this.pcSingleTeethSideProperties!.probingDepthPointA!-this.pcSingleTeethSideProperties!.gingivalMarginPointA!)  * heightmultiplier);

      var controlPoint1Dx = size.width / 2;
      var controlPoint1Dy = baseheight -
          ((this.pcSingleTeethSideProperties!.probingDepthPointB!-this.pcSingleTeethSideProperties!.gingivalMarginPointB!) * heightmultiplier);

      var endPointDx = 7 * size.width / 8;
      var endPointDy = baseheight -
          ((this.pcSingleTeethSideProperties!.probingDepthPointC!-this.pcSingleTeethSideProperties!.gingivalMarginPointC!) * heightmultiplier);

      double rightNeighbourDx = size.width;
      double? rightNeighbourDy;

      if (rightNeighborSingleTeethSideProperties != null) {
        rightNeighbourDy = baseheight -
            (0.5 *
                heightmultiplier *
                ((this.pcSingleTeethSideProperties!.probingDepthPointC!-this.pcSingleTeethSideProperties!.gingivalMarginPointC!) +
                    (rightNeighborSingleTeethSideProperties.probingDepthPointA!-rightNeighborSingleTeethSideProperties.gingivalMarginPointC!)  ));
      }

      Offset? leftNeighbourPoint;
      if (leftNeighbourDy != null) {
        leftNeighbourPoint = Offset(leftNeighbourDx, leftNeighbourDy);
      }
      var startPoint = Offset(startPointDx, startPointDy);
      var controlPoint1 = Offset(controlPoint1Dx, controlPoint1Dy);
      var endPoint = Offset(endPointDx, endPointDy);

      Offset? rightNeighbourPoint;
      if (rightNeighbourDy != null) {
        rightNeighbourPoint = Offset(rightNeighbourDx, rightNeighbourDy);
      }

      var path = Path();

      if (leftNeighbourPoint != null) {
        path.moveTo(leftNeighbourPoint.dx, leftNeighbourPoint.dy);
        path.lineTo(startPoint.dx, startPoint.dy);
      } else {
        path.moveTo(startPoint.dx, startPoint.dy);
      }
      path.lineTo(controlPoint1.dx, controlPoint1.dy);
      path.lineTo(endPoint.dx, endPoint.dy);

      if (rightNeighbourPoint != null) {
        path.lineTo(rightNeighbourPoint.dx, rightNeighbourPoint.dy);
      }

      /*
    path.cubicTo(startPoint.dx, startPoint.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);*/

      canvas.drawPath(path, paint);
    } catch (error) {
      print(
          "Error Catched on CurvePainter.paintItLightBlue(Canvas canvas, Size size);ErrorMessage=" +
              error.toString());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
