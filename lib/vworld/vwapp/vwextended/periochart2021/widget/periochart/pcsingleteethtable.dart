import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/cycliciconbutton.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcintegerfield.dart';

class PcSingleTeethTable extends StatelessWidget {
  PcSingleTeethTable(this.pcSingleTeethProperties, this.teethSide,
      this.pcPropertiesOnChangedCallback);
  final PcSingleTeethProperties pcSingleTeethProperties;
  final String teethSide; //lingual, buccal
  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;

  void implementCallbackIntegerField(String fieldName, int value) {
    if (fieldName == PcSingleTeethProperties.mobilityLevelCCFN) {
      pcSingleTeethProperties.mobilityLevel = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointACCFN) {
      this.pcSingleTeethProperties.buccalSide.gingivalMarginPointA = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointBCCFN) {
      this.pcSingleTeethProperties.buccalSide.gingivalMarginPointA = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointCCCFN) {
      this.pcSingleTeethProperties.buccalSide.gingivalMarginPointC = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointACCFN) {
      this.pcSingleTeethProperties.buccalSide.probingDepthPointA = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointBCCFN) {
      this.pcSingleTeethProperties.buccalSide.probingDepthPointB = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointCCCFN) {
      this.pcSingleTeethProperties.buccalSide.probingDepthPointC = value;
    } else if (fieldName == PcSingleTeethProperties.isImplantCCFN) {
      this.pcSingleTeethProperties.isImplant = value;
    }

    pcPropertiesOnChangedCallback(false);
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration(
      border: Border.all(width: 1, color: Colors.black),
    );

    return Container(
        width: 53,
        child: Column(
          children: [
            Container(
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: Center(
                    child: Text(
                  this.pcSingleTeethProperties.teethNumber.toString(),
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ))),
            PcIntegerField(
              value: this.pcSingleTeethProperties.mobilityLevel,
              fieldName: PcSingleTeethProperties.mobilityLevelCCFN,
              //caption: 'mobility',
              pcCallbackIntegerField: implementCallbackIntegerField,
              width: 30,
              height: 18,
              borderWidth: 1,
              useBorder: true,
            ),
            CyclicIconButton(
                fieldName: PcSingleTeethProperties.isImplantCCFN,
                initialIndex: this.pcSingleTeethProperties.isImplant,
                iconDataList: <IconData>[
                  Icons.check_box_outline_blank,
                  Icons.check_box_sharp
                ],
                iconSize:18,
                colorList: <Color>[Colors.grey, Colors.black],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            Container(
                decoration: borderBoxDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .gingivalMarginPointA,
                      fieldName:
                          PcSingleTeethSideProperties.gingivalMarginPointACCFN,
                      //caption: 'mobility',
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    ),
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .gingivalMarginPointB,
                      fieldName:
                          PcSingleTeethSideProperties.gingivalMarginPointBCCFN,
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    ),
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .gingivalMarginPointC,
                      fieldName:
                          PcSingleTeethSideProperties.gingivalMarginPointCCCFN,
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    )
                  ],
                )),
            Container(
                decoration: borderBoxDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .probingDepthPointA,
                      fieldName:
                          PcSingleTeethSideProperties.probingDepthPointACCFN,
                      //caption: 'mobility',
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    ),
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .probingDepthPointB,
                      fieldName:
                          PcSingleTeethSideProperties.probingDepthPointBCCFN,
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    ),
                    PcIntegerField(
                      value: this
                          .pcSingleTeethProperties
                          .buccalSide
                          .probingDepthPointC,
                      fieldName:
                          PcSingleTeethSideProperties.probingDepthPointCCCFN,
                      pcCallbackIntegerField: implementCallbackIntegerField,
                      width: 17,
                      height: 18,
                      borderWidth: 1,
                      useBorder: false,
                    )
                  ],
                )),
          ],
        ));
  }
}
