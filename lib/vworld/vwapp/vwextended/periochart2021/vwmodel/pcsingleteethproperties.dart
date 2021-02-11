import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwcore/vwmodel/vwdocumentcontent.dart';

class PcSingleTeethProperties extends VwDocumentContent {
  PcSingleTeethProperties({@required this.teethNumber, this.mobilityLevel:0,  this.isImplant:0,@required this.buccalSide,@required this.lingualSide, this.note});

  String teethNumber;
  int mobilityLevel;
  int isImplant;
  PcSingleTeethSideProperties buccalSide;
  PcSingleTeethSideProperties lingualSide;
  String note;

  static final String teethNumberCCFN = 'teethNumber';
  static final String mobilityLevelCCFN = 'mobilityLevel';
  static final String isImplantCCFN = 'isImplant';
  static final String buccalSideCCFN='buccalSide';
  static final String lingualSideCCFN='lingualSide';
  static final String noteCCFN='note';

  @override
  String getDocumenttypeId() {
    return VwDocumentContent.documenttypeIdPcSingleTeethProperties;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      PcSingleTeethProperties.teethNumberCCFN: this.teethNumber,
      PcSingleTeethProperties.mobilityLevelCCFN: this.mobilityLevel,
      PcSingleTeethProperties.isImplantCCFN: this.isImplant,
    PcSingleTeethProperties.buccalSideCCFN: this.buccalSide.toJson(),
    PcSingleTeethProperties.lingualSideCCFN: this.lingualSide.toJson(),
    PcSingleTeethProperties.noteCCFN: this.note
    };
  }

  factory PcSingleTeethProperties.fromJson(Map<String, dynamic> data) {


     return  PcSingleTeethProperties(
          teethNumber: data[PcSingleTeethProperties.teethNumberCCFN],
          mobilityLevel: data[PcSingleTeethProperties.mobilityLevelCCFN],
        isImplant: data[PcSingleTeethProperties.isImplantCCFN],
       note: data[PcSingleTeethProperties.noteCCFN],
        buccalSide: data[PcSingleTeethProperties.buccalSideCCFN]==null? PcSingleTeethSideProperties(teethSide:PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS ):PcSingleTeethSideProperties.fromJson(data[PcSingleTeethProperties.buccalSideCCFN]),
        lingualSide: data[PcSingleTeethProperties.buccalSideCCFN]==null? PcSingleTeethSideProperties(teethSide:PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS ):PcSingleTeethSideProperties.fromJson(data[PcSingleTeethProperties.lingualSideCCFN]),
          );

  }
}
