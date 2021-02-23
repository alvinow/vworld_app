import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/cycliciconbutton.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcintegerfield.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcstringfield.dart';

class PcSingleTeethTable extends StatelessWidget {
  PcSingleTeethTable(this.pcSingleTeethProperties, this.teethSide,
      this.pcPropertiesOnChangedCallback,
      {this.columnWidth: 42});
  final PcSingleTeethProperties pcSingleTeethProperties;
  final String teethSide; //lingual, buccal
  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;
  final double columnWidth;

  void implementCallbackStringField(String fieldName, String value) {
    if (fieldName == PcSingleTeethProperties.noteCCFN) {
      pcSingleTeethProperties.note = value;
    }
  }

  void implementCallbackIntegerField(String fieldName, int value) {
    bool doSetState = false;

    if (fieldName == PcSingleTeethProperties.mobilityLevelCCFN) {
      pcSingleTeethProperties.mobilityLevel = value;
    } else if (fieldName == PcSingleTeethProperties.isImplantCCFN) {
      doSetState = true;
      pcSingleTeethProperties.isImplant = value;
    } else if (fieldName ==
        PcSingleTeethSideProperties.furcationLevelPointACCFN) {
      doSetState = true;
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.furcationLevelPointA = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.furcationLevelPointA = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.furcationLevelPointBCCFN) {
      doSetState = true;
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.furcationLevelPointB = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.furcationLevelPointB = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.isBleedingOnProbingPointACCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isBleedingOnProbingPointA =
            value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isBleedingOnProbingPointA =
            value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.isBleedingOnProbingPointBCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isBleedingOnProbingPointB =
            value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isBleedingOnProbingPointB =
            value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.isBleedingOnProbingPointCCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isBleedingOnProbingPointC =
            value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isBleedingOnProbingPointC =
            value;
      }
    } else if (fieldName == PcSingleTeethSideProperties.isPlaquePointACCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isPlaquePointA = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isPlaquePointA = value;
      }
    } else if (fieldName == PcSingleTeethSideProperties.isPlaquePointBCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isPlaquePointB = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isPlaquePointB = value;
      }
    } else if (fieldName == PcSingleTeethSideProperties.isPlaquePointCCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.isPlaquePointC = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.isPlaquePointC = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointACCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.gingivalMarginPointA = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.gingivalMarginPointA = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointBCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.gingivalMarginPointB = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.gingivalMarginPointB = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.gingivalMarginPointCCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.gingivalMarginPointC = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.gingivalMarginPointC = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointACCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.probingDepthPointA = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.probingDepthPointA = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointBCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.probingDepthPointB = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.probingDepthPointB = value;
      }
    } else if (fieldName ==
        PcSingleTeethSideProperties.probingDepthPointCCCFN) {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        this.pcSingleTeethProperties.buccalSide.probingDepthPointC = value;
      } else {
        this.pcSingleTeethProperties.lingualSide.probingDepthPointC = value;
      }
    }

    pcPropertiesOnChangedCallback(doSetState);
  }

  Widget getFurcationInputRow(String teethNumber, String teethSide) {
    Widget returnValue = Container(
      width: this.columnWidth,
      height: 20,
      padding: EdgeInsets.all(2),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
      child: Container(),
    );

    final String teethRegio = teethNumber.substring(0, 1);
    final String teethRow = teethNumber.substring(1, 2);

    if (teethRegio == '1' || teethRegio == '2') {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        if (teethRow == '8' || teethRow == '7' || teethRow == '6') {
          returnValue = Container(
              width: this.columnWidth,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: CyclicIconButton(
                  backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
                  fieldName:
                      PcSingleTeethSideProperties.furcationLevelPointACCFN,
                  initialIndex: this
                      .pcSingleTeethProperties
                      .buccalSide
                      .furcationLevelPointA,
                  iconDataList: <IconData>[
                    Icons.circle,
                    Icons.brightness_1_outlined,
                    Icons.brightness_medium_rounded,
                    Icons.circle
                  ],
                  iconSize: 14,
                  colorList: <Color>[
                    Color.fromRGBO(200, 200, 200, 25.0),
                    Colors.black,
                    Colors.black,
                    Colors.black
                  ],
                  pcCallbackIntegerField: this.implementCallbackIntegerField,
                  isReadOnly: false));
        }
      } else {
        if (teethRow == '8' ||
            teethRow == '7' ||
            teethRow == '6' ||
            teethRow == '4') {
          returnValue = Container(
              width: this.columnWidth,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CyclicIconButton(
                        backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
                        fieldName: PcSingleTeethSideProperties
                            .furcationLevelPointACCFN,
                        initialIndex: this
                            .pcSingleTeethProperties
                            .lingualSide
                            .furcationLevelPointA,
                        iconDataList: <IconData>[
                          Icons.circle,
                          Icons.brightness_1_outlined,
                          Icons.brightness_medium_rounded,
                          Icons.circle
                        ],
                        iconSize: 14,
                        colorList: <Color>[
                          Color.fromRGBO(200, 200, 200, 25.0),
                          Colors.black,
                          Colors.black,
                          Colors.black
                        ],
                        pcCallbackIntegerField:
                            this.implementCallbackIntegerField,
                        isReadOnly: false),
                    CyclicIconButton(
                        backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
                        fieldName: PcSingleTeethSideProperties
                            .furcationLevelPointBCCFN,
                        initialIndex: this
                            .pcSingleTeethProperties
                            .lingualSide
                            .furcationLevelPointB,
                        iconDataList: <IconData>[
                          Icons.circle,
                          Icons.brightness_1_outlined,
                          Icons.brightness_medium_rounded,
                          Icons.circle
                        ],
                        iconSize: 14,
                        colorList: <Color>[
                          Color.fromRGBO(200, 200, 200, 25.0),
                          Colors.black,
                          Colors.black,
                          Colors.black
                        ],
                        pcCallbackIntegerField:
                            this.implementCallbackIntegerField,
                        isReadOnly: false)
                  ]));
        }
      }
    } else if (teethRegio == '3' || teethRegio == '4') {
      if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        if (teethRow == '8' || teethRow == '7' || teethRow == '6') {
          returnValue = Container(
              width: this.columnWidth,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: CyclicIconButton(
                  backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
                  fieldName:
                      PcSingleTeethSideProperties.furcationLevelPointACCFN,
                  initialIndex: this
                      .pcSingleTeethProperties
                      .buccalSide
                      .furcationLevelPointA,
                  iconDataList: <IconData>[
                    Icons.circle,
                    Icons.brightness_1_outlined,
                    Icons.brightness_medium_rounded,
                    Icons.circle
                  ],
                  iconSize: 14,
                  colorList: <Color>[
                    Color.fromRGBO(200, 200, 200, 25.0),
                    Colors.black,
                    Colors.black,
                    Colors.black
                  ],
                  pcCallbackIntegerField: this.implementCallbackIntegerField,
                  isReadOnly: false));
        }
      } else {
        if (teethRow == '8' || teethRow == '7' || teethRow == '6') {
          returnValue = Container(
              width: this.columnWidth,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.black)),
              child: CyclicIconButton(
                  backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
                  fieldName:
                      PcSingleTeethSideProperties.furcationLevelPointACCFN,
                  initialIndex: this
                      .pcSingleTeethProperties
                      .lingualSide
                      .furcationLevelPointA,
                  iconDataList: <IconData>[
                    Icons.circle,
                    Icons.brightness_1_outlined,
                    Icons.brightness_medium_rounded,
                    Icons.circle
                  ],
                  iconSize: 14,
                  colorList: <Color>[
                    Color.fromRGBO(200, 200, 200, 25.0),
                    Colors.black,
                    Colors.black,
                    Colors.black
                  ],
                  pcCallbackIntegerField: this.implementCallbackIntegerField,
                  isReadOnly: false));
        }
      }
    }

    return returnValue;
  }

  Widget getTeethNumberRow() {
    return Container(
        width: this.columnWidth,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: Center(
            child: Text(
          this.pcSingleTeethProperties.teethNumber.toString(),
          style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )));
  }

  Widget getMobilityLevelRow() {
    return Container(
        child: PcIntegerField(
          value: this.pcSingleTeethProperties.mobilityLevel,
          fieldName: PcSingleTeethProperties.mobilityLevelCCFN,
          //caption: 'mobility',
          pcCallbackIntegerField: implementCallbackIntegerField,
          width: this.columnWidth,
          height: 14,
          borderWidth: 1,
          useBorder: false,
        ),
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.black)));
  }

  Widget getIsImplantRow() {
    return Container(
        width: this.columnWidth,
        padding: EdgeInsets.all(2),
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: CyclicIconButton(
            backgroundColor: Color.fromRGBO(200, 200, 200, 25.0),
            fieldName: PcSingleTeethProperties.isImplantCCFN,
            initialIndex: this.pcSingleTeethProperties.isImplant,
            iconDataList: <IconData>[
              Icons.check_box_outline_blank,
              Icons.check_box_sharp
            ],
            iconSize: 14,
            colorList: <Color>[
              Color.fromRGBO(200, 200, 200, 25.0),
              Colors.black
            ],
            pcCallbackIntegerField: this.implementCallbackIntegerField,
            isReadOnly: false));
  }

  Widget getBleedingOnProbingRow() {
    if (teethSide == PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      return Container(
        width: this.columnWidth,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointACCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .isBleedingOnProbingPointA,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointBCCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .isBleedingOnProbingPointB,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointCCCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .isBleedingOnProbingPointC,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
          ],
        ),
      );
    } else {
      return Container(
        width: this.columnWidth,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointACCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .isBleedingOnProbingPointA,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointBCCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .isBleedingOnProbingPointB,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName:
                    PcSingleTeethSideProperties.isBleedingOnProbingPointCCCFN,
                initialIndex: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .isBleedingOnProbingPointC,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.red,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
          ],
        ),
      );
    }
  }

  Widget getPlaqueRow() {
    if (this.teethSide ==
        PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      return Container(
        width: this.columnWidth,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointACCFN,
                initialIndex:
                    this.pcSingleTeethProperties.buccalSide.isPlaquePointA,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointBCCFN,
                initialIndex:
                    this.pcSingleTeethProperties.buccalSide.isPlaquePointB,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointCCCFN,
                initialIndex:
                    this.pcSingleTeethProperties.buccalSide.isPlaquePointC,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
          ],
        ),
      );
    } else {
      return Container(
        width: this.columnWidth,
        decoration:
            BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointACCFN,
                initialIndex:
                    this.pcSingleTeethProperties.lingualSide.isPlaquePointA,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointBCCFN,
                initialIndex:
                    this.pcSingleTeethProperties.lingualSide.isPlaquePointB,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
            CyclicIconButton(
                fieldName: PcSingleTeethSideProperties.isPlaquePointCCCFN,
                initialIndex:
                    this.pcSingleTeethProperties.lingualSide.isPlaquePointC,
                iconDataList: <IconData>[
                  Icons.check_box_sharp,
                  Icons.check_box_sharp,
                ],
                iconSize: 13,
                colorList: <Color>[
                  Color.fromRGBO(200, 200, 200, 25.0),
                  Colors.lightBlue,
                ],
                pcCallbackIntegerField: this.implementCallbackIntegerField,
                isReadOnly: false),
          ],
        ),
      );
    }
  }

  Widget getGingivalMarginRow() {
    if (this.teethSide ==
        PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      return Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .gingivalMarginPointA,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointACCFN,
                //caption: 'mobility',
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .gingivalMarginPointB,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointBCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .buccalSide
                    .gingivalMarginPointC,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointCCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              )
            ],
          ));
    } else {
      return Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .gingivalMarginPointA,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointACCFN,
                //caption: 'mobility',
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .gingivalMarginPointB,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointBCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value: this
                    .pcSingleTeethProperties
                    .lingualSide
                    .gingivalMarginPointC,
                fieldName: PcSingleTeethSideProperties.gingivalMarginPointCCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              )
            ],
          ));
    }
  }

  Widget getProbingDepthRow() {
    if (this.teethSide ==
        PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
      return Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.buccalSide.probingDepthPointA,
                fieldName: PcSingleTeethSideProperties.probingDepthPointACCFN,
                //caption: 'mobility',
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.buccalSide.probingDepthPointB,
                fieldName: PcSingleTeethSideProperties.probingDepthPointBCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.buccalSide.probingDepthPointC,
                fieldName: PcSingleTeethSideProperties.probingDepthPointCCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              )
            ],
          ));
    } else {
      return Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.lingualSide.probingDepthPointA,
                fieldName: PcSingleTeethSideProperties.probingDepthPointACCFN,
                //caption: 'mobility',
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.lingualSide.probingDepthPointB,
                fieldName: PcSingleTeethSideProperties.probingDepthPointBCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              ),
              PcIntegerField(
                value:
                    this.pcSingleTeethProperties.lingualSide.probingDepthPointC,
                fieldName: PcSingleTeethSideProperties.probingDepthPointCCCFN,
                pcCallbackIntegerField: implementCallbackIntegerField,
                width: (this.columnWidth / 3) - 2,
                height: 18,
                borderWidth: 1,
                useBorder: false,
              )
            ],
          ));
    }
  }

  Widget getNoteRow() {
    return Container(
      width: this.columnWidth,
      height: 18,
      padding: EdgeInsets.all(2),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black)),
      child: PcStringField(
          value: this.pcSingleTeethProperties.note,
          fieldName: PcSingleTeethProperties.noteCCFN,
          width: 100,
          height: 25,
          caption: '',
          pcCallbackStringFieldField: implementCallbackStringField),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
    BoxDecoration borderBoxDecoration = BoxDecoration(
      border: Border.all(width: 1, color: Colors.black),
    );
*/
    final String regio =
        this.pcSingleTeethProperties.teethNumber.substring(0, 1);

    if (regio == '1' || regio == '2') {
      if (this.teethSide ==
          PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        return Container(
            width: this.columnWidth,
            child: Column(
              children: [
                this.getTeethNumberRow(),
                this.getMobilityLevelRow(),
                this.getIsImplantRow(),
                this.getFurcationInputRow(
                    this.pcSingleTeethProperties.teethNumber,
                    PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS),
                this.getBleedingOnProbingRow(),
                this.getPlaqueRow(),
                this.getGingivalMarginRow(),
                this.getProbingDepthRow(),
                this.getNoteRow()
              ],
            ));
      } else {
        return Container(
            width: this.columnWidth,
            child: Column(
              children: [
                this.getGingivalMarginRow(),
                this.getProbingDepthRow(),
                this.getPlaqueRow(),
                this.getBleedingOnProbingRow(),
                this.getFurcationInputRow(
                    this.pcSingleTeethProperties.teethNumber,
                    PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS),
              ],
            ));
      }
    } else {
      if (this.teethSide ==
          PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS) {
        return Container(
            width: this.columnWidth,
            child: Column(
              children: [
                this.getGingivalMarginRow(),
                this.getProbingDepthRow(),
                this.getPlaqueRow(),
                this.getBleedingOnProbingRow(),
                this.getFurcationInputRow(
                    this.pcSingleTeethProperties.teethNumber,
                    PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS),
                this.getIsImplantRow(),
                this.getMobilityLevelRow(),
                this.getTeethNumberRow(),
              ],
            ));
      } else {
        return Container(
            width: this.columnWidth,
            child: Column(
              children: [
                this.getNoteRow(),
                this.getFurcationInputRow(
                    this.pcSingleTeethProperties.teethNumber,
                    PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS),
                this.getBleedingOnProbingRow(),
                this.getPlaqueRow(),
                this.getGingivalMarginRow(),
                this.getProbingDepthRow(),
              ],
            ));
      }
    }
  }
}
