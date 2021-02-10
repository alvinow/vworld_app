import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcsingleteeth.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';

class PcLowerJaw extends StatelessWidget{

  PcLowerJaw(this.pcProperties,this.pcPropertiesOnChangedCallback);

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;

  void updateTeeth(PcSingleTeethProperties pcSingleTeethProperties){

    this.pcPropertiesOnChangedCallback(false);


  }

  @override
  Widget build(BuildContext context) {
    List<Widget> teethColumnWidgets=List<Widget>();

    List<String> teethNumberList=<String>[
      '48',
      '47',
      '46',
      '45',
      '44',
      '43',
      '42',
      '41',
      '31',
      '32',
      '33',
      '34',
      '35',
      '36',
      '37',
      '38'

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
          teethColumnWidgets.add(pcSingleTeeth);
          break;
        }


      }

      if (isSingleTeehthPropertiesFound == false) {
        PcSingleTeethProperties pcSingleTeethProperties =
        PcSingleTeethProperties(
            teethNumber: element,
            buccalSide:
            PcSingleTeethSideProperties(
                teethNumber: element,
                teethSide:
                PcSingleTeethSideProperties
                    .pcSingleTeethSideBuccalFMS),
            lingualSide: PcSingleTeethSideProperties(
                teethNumber: element,
                teethSide: PcSingleTeethSideProperties
                    .pcSingleTeethSideLingualFMS));

        this.pcProperties.teeths.add(pcSingleTeethProperties);
        PcSingleTeeth pcSingleTeeth =
        PcSingleTeeth(pcSingleTeethProperties, pcPropertiesOnChangedCallback,this.pcProperties);

        teethColumnWidgets.add(pcSingleTeeth);
      }

    });

    Widget returnValue = Row(
      children: teethColumnWidgets,
    );

    return returnValue;


  }

}