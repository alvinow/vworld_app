import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcsingleteeth.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';

class PcUpperJaw extends StatelessWidget {
  PcUpperJaw(this.pcProperties, this.pcPropertiesOnChangedCallback);

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;


  @override
  Widget build(BuildContext context) {
    List<Widget> teethColumnWidgets = List<Widget>();

    Widget tableColumnName=Container(
        padding: EdgeInsets.fromLTRB(0, 0, 4, 0) ,

        child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 21,
          child: Text('',style: TextStyle( fontSize: 12,color: Colors.black
          )),
        ),
        Container(
          height: 21,
          child: Text('Mobility',style: TextStyle(fontWeight: FontWeight.w100, fontFamily: 'Arial',fontSize: 12,color: Colors.black),),
        ),
        Container(
          height: 21,
          child: Text('Gingival Margin',style: TextStyle(fontWeight: FontWeight.w100, fontFamily: 'Arial',fontSize: 12,color: Colors.black)),
        ),
        Container(
          height: 21,
          child: Text('Probing Depth',style: TextStyle(fontWeight: FontWeight.w100, fontFamily: 'Arial',fontSize: 12,color: Colors.black)),
        ),
      ],
    ));

    teethColumnWidgets.add(tableColumnName);


    List<String> teethNumberList = <String>[
      '18',
      '17',
      '16',
      '15',
      '14',
      '13',
      '12',
      '11',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28'
    ];

    teethNumberList.forEach((element) {
      bool isSingleTeehthPropertiesFound = false;

      for (int la = 0; la < this.pcProperties.teeths.length; la++) {
        PcSingleTeethProperties lPcSingleTeethProperties =
            this.pcProperties.teeths.elementAt(la);
        if (lPcSingleTeethProperties.teethNumber == element) {
          isSingleTeehthPropertiesFound = true;
          PcSingleTeeth pcSingleTeeth =
              PcSingleTeeth(lPcSingleTeethProperties, pcPropertiesOnChangedCallback,this.pcProperties);
          if(element=='21')
          {
            teethColumnWidgets.add(SizedBox(width: 25,));
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
        PcSingleTeeth pcSingleTeeth =
            PcSingleTeeth(pcSingleTeethProperties, pcPropertiesOnChangedCallback,this.pcProperties);

        if(element=='21')
          {
            teethColumnWidgets.add(SizedBox(width: 25,));
          }
        teethColumnWidgets.add(pcSingleTeeth);
      }
    });


    Widget returnValue = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: teethColumnWidgets,
    );

    return returnValue;
  }
}
