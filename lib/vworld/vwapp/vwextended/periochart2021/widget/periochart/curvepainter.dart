import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';

class CurvePainter extends CustomPainter {
  CurvePainter(this.pcSingleTeethSideProperties, this.pcProperties);

  final PcSingleTeethSideProperties pcSingleTeethSideProperties;

  final PcProperties pcProperties;

  @override
  void paint(Canvas canvas, Size size) {
    this.paintItLightBlue(canvas, size);
    this.paintItRed(canvas, size);
  }

  //gingival margin
  void paintItRed(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var baseheight = 90.0;

    var startPoint = Offset(0, baseheight);
    var controlPoint1 = Offset(2 * size.width / 4, baseheight);
    var endPoint = Offset(size.width, baseheight);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(startPoint.dx, startPoint.dy, controlPoint1.dx,
        controlPoint1.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  static String getLeftNeighbourTeethNumber(String teethNumber) {
    String returnValue;
    try {
      if (teethNumber == '18' ||
          teethNumber == '21' ||
          teethNumber == '48' ||
          teethNumber == '31') {
      } else {
        int regio = int.parse(teethNumber.substring(0, 1));
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

  static String getRightNeighbourTeethNumber(String teethNumber) {
    String returnValue;
    try {
      if (teethNumber == '11' ||
          teethNumber == '28' ||
          teethNumber == '41' ||
          teethNumber == '38') {
      } else {
        int regio = int.parse(teethNumber.substring(0, 1));
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

  PcSingleTeethSideProperties getLeftNeighborSingleTeethSideProperties() {
    PcSingleTeethSideProperties returnValue;

    try {
      String leftNeighbourTeethNumber = CurvePainter
          .getLeftNeighbourTeethNumber(
          this.pcSingleTeethSideProperties.teethNumber);

      if (leftNeighbourTeethNumber != null &&
          leftNeighbourTeethNumber.length == 2) {
        PcSingleTeethProperties pcSingleTeethProperties =
        this.pcProperties.getTeeth(leftNeighbourTeethNumber);

        if (this.pcSingleTeethSideProperties.teethSide ==
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
          returnValue = pcSingleTeethProperties.buccalSide;
        } else {
          returnValue = pcSingleTeethProperties.lingualSide;
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

  PcSingleTeethSideProperties getRightNeighborSingleTeethSideProperties() {
    PcSingleTeethSideProperties returnValue;

    try {
      String rightNeighbourTeethNumber =
          CurvePainter.getRightNeighbourTeethNumber(
              this.pcSingleTeethSideProperties.teethNumber);

      if (rightNeighbourTeethNumber != null &&
          rightNeighbourTeethNumber.length == 2) {
        PcSingleTeethProperties pcSingleTeethProperties =
            this.pcProperties.getTeeth(rightNeighbourTeethNumber);

        if (this.pcSingleTeethSideProperties.teethSide ==
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
          returnValue = pcSingleTeethProperties.buccalSide;
        } else {
          returnValue = pcSingleTeethProperties.lingualSide;
        }
      }
    } catch (error) {
      print(
          "Error catched on CurvePainter.PcSingleTeethSideProperties getRightNeighborSingleTeethSideProperties();ErrorMessage=" +
              error.toString());
    }

    return returnValue;
  }

  //probing depth
  void paintItLightBlue(Canvas canvas, Size size) {
    try {
      var paint = Paint();

      paint.color = Colors.lightBlue;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3;

      var baseheight = 90.0;

      PcSingleTeethSideProperties leftNeighborSingleTeethSideProperties =
          this.getLeftNeighborSingleTeethSideProperties();

      PcSingleTeethSideProperties rightNeighborSingleTeethSideProperties =
          this.getRightNeighborSingleTeethSideProperties();

      double leftNeighbourDx = 0;
      double leftNeighbourDy;

      if (leftNeighborSingleTeethSideProperties != null) {
        leftNeighbourDy = baseheight -
            (0.5 *
                6 *
                (this.pcSingleTeethSideProperties.probingDepthPointA +
                    leftNeighborSingleTeethSideProperties.probingDepthPointC));
      }

      var startPointDx = size.width / 8;
      var startPointDy = baseheight -
          (this.pcSingleTeethSideProperties.probingDepthPointA * 6);

      var controlPoint1Dx = size.width / 2;
      var controlPoint1Dy = baseheight -
          (this.pcSingleTeethSideProperties.probingDepthPointB * 6);

      var endPointDx = 7 * size.width / 8;
      var endPointDy = baseheight -
          (this.pcSingleTeethSideProperties.probingDepthPointC * 6);

      double rightNeighbourDx = size.width;
      double rightNeighbourDy;

      if (rightNeighborSingleTeethSideProperties != null) {
        rightNeighbourDy = baseheight -
            (0.5 *
                6 *
                (this.pcSingleTeethSideProperties.probingDepthPointC +
                    rightNeighborSingleTeethSideProperties.probingDepthPointA));
      }

      Offset leftNeighbourPoint;
      if (leftNeighbourDy != null) {
        leftNeighbourPoint = Offset(leftNeighbourDx, leftNeighbourDy);
      }
      var startPoint = Offset(startPointDx, startPointDy);
      var controlPoint1 = Offset(controlPoint1Dx, controlPoint1Dy);
      var endPoint = Offset(endPointDx, endPointDy);

      Offset rightNeighbourPoint;
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
