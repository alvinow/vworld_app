import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwcore/vwmodel/vwdocumentcontent.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'pcsingleteethproperties.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PcSingleTeethProperties {
  PcSingleTeethProperties({@required this.teethNumber, this.mobilityLevel:0,  this.isImplant:0,@required this.buccalSide,@required this.lingualSide, this.note});

  @HiveField(0)
  String teethNumber;

  @HiveField(1)
  int mobilityLevel;

  @HiveField(2)
  int isImplant;

  @HiveField(3)
  PcSingleTeethSideProperties buccalSide;

  @HiveField(4)
  PcSingleTeethSideProperties lingualSide;

  @HiveField(5)
  String note;

  static final String teethNumberCCFN = 'teethNumber';
  static final String mobilityLevelCCFN = 'mobilityLevel';
  static final String isImplantCCFN = 'isImplant';
  static final String buccalSideCCFN='buccalSide';
  static final String lingualSideCCFN='lingualSide';
  static final String noteCCFN='note';


  String getDocumenttypeId() {
    return VwDocumentContent.documenttypeIdPcSingleTeethProperties;
  }

  factory PcSingleTeethProperties.fromJson(Map<String, dynamic> json) =>
      _$PcSingleTeethPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PcSingleTeethPropertiesToJson(this);

  /*
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

   */

  /*
  factory PcSingleTeethProperties.fromJson(Map<String, dynamic> data) {


     return  PcSingleTeethProperties(
          teethNumber: data[PcSingleTeethProperties.teethNumberCCFN],
          mobilityLevel: data[PcSingleTeethProperties.mobilityLevelCCFN],
        isImplant: data[PcSingleTeethProperties.isImplantCCFN],
       note: data[PcSingleTeethProperties.noteCCFN],
        buccalSide: data[PcSingleTeethProperties.buccalSideCCFN]==null? PcSingleTeethSideProperties(teethSide:PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS ):PcSingleTeethSideProperties.fromJson(data[PcSingleTeethProperties.buccalSideCCFN]),
        lingualSide: data[PcSingleTeethProperties.buccalSideCCFN]==null? PcSingleTeethSideProperties(teethSide:PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS ):PcSingleTeethSideProperties.fromJson(data[PcSingleTeethProperties.lingualSideCCFN]),
          );

  }*/
}
