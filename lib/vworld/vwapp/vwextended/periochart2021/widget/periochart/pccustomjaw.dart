import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcsingleteeth.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';

class PcCustomJaw extends StatelessWidget {
  PcCustomJaw(this.pcProperties, this.pcPropertiesOnChangedCallback,
      this.teethNumberList, this.jawSide);

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;
  final List<String> teethNumberList;
  final String jawSide;

  static final String upperJawSideFMS = 'upperJawSide';
  static final String lowerJawSideFMS = 'lowerJawSide';

  Widget getTableColumnNameUpperJaw() {
    Widget returnValue = Container(
        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 18,
              child:
                  Text('', style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text(
                'Mobility',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Implant',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Furcation',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Bleeding on Probing',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text('Plaque',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Gingival Margin',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Probing Depth',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Note',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 60,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Buccal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: Colors.black)),
            ),
            Container(
              height: 105,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Lingual',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: Colors.black)),
            ),
            Container(
              height: 63,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Gingival Margin',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Probing Depth',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Plaque',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text(
                'Bleeding on Probing',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Furcation',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
          ],
        ));

    return returnValue;
  }

  Widget getTableColumnNameLowerjaw() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 4,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Note',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text(
                'Furcation',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Bleeding on probing',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Plaque',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text(
                'Gingival Margin',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Arial',
                    fontSize: 10,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 18,
              child: Text('Probing Depth',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 60,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Lingual',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: Colors.black)),
            ),
            Container(
              height: 130,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Buccal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: Colors.black)),
            ),
            Container(
              height: 72,
              child: Text('',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Gingival Margin',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Probing Depth',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Plaque',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Bleeding on Probing',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Furcation',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Implant',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
            Container(
              height: 18,
              child: Text('Mobility',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Arial',
                      fontSize: 10,
                      color: Colors.black)),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> teethColumnWidgets = List<Widget>();

    Widget tableColumnNameUpperJaw = this.getTableColumnNameUpperJaw();

    Widget tableColumnNameLowerJaw = this.getTableColumnNameLowerjaw();

    Widget tableColumnName;

    if (this.jawSide == PcCustomJaw.upperJawSideFMS) {
      tableColumnName = tableColumnNameUpperJaw;
    } else {
      tableColumnName = tableColumnNameLowerJaw;
    }

    teethColumnWidgets.add(tableColumnName);

    teethNumberList.forEach((element) {
      bool isSingleTeehthPropertiesFound = false;

      for (int la = 0; la < this.pcProperties.teeths.length; la++) {
        PcSingleTeethProperties lPcSingleTeethProperties =
            this.pcProperties.teeths.elementAt(la);
        if (lPcSingleTeethProperties.teethNumber == element) {
          isSingleTeehthPropertiesFound = true;
          PcSingleTeeth pcSingleTeeth = PcSingleTeeth(lPcSingleTeethProperties,
              pcPropertiesOnChangedCallback, this.pcProperties);
          if (element == '21' || element == '31') {
            teethColumnWidgets.add(SizedBox(
              width: 25,
            ));
          }

          teethColumnWidgets.add(pcSingleTeeth);
          break;
        }
      }

      if (isSingleTeehthPropertiesFound == false) {
        PcSingleTeethProperties pcSingleTeethProperties =
            PcSingleTeethProperties(
                teethNumber: element,
                buccalSide: PcSingleTeethSideProperties(
                    teethNumber: element,
                    teethSide:
                        PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS),
                lingualSide: PcSingleTeethSideProperties(
                    teethNumber: element,
                    teethSide: PcSingleTeethSideProperties
                        .pcSingleTeethSideLingualFMS));

        this.pcProperties.teeths.add(pcSingleTeethProperties);
        PcSingleTeeth pcSingleTeeth = PcSingleTeeth(pcSingleTeethProperties,
            pcPropertiesOnChangedCallback, this.pcProperties);

        if (element == '21' || element == '31') {
          teethColumnWidgets.add(SizedBox(
            width: 25,
          ));
        }
        teethColumnWidgets.add(pcSingleTeeth);
      }
    });

    Widget teethsPropertiesTable = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: teethColumnWidgets,
    );

    return teethsPropertiesTable;
  }
}
