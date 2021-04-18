import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwcore/vwmodel/vwdocumentcontent.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'pcproperties.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class PcProperties extends VwDocumentContent {
  PcProperties(
      {@required this.id,
      @required this.patientName,
      @required this.patientDob,
      @required this.operatorName,
      @required this.examDateTime,
      @required this.examTypeId,
      @required this.teeths,
      this.documenttypeId: 'documenttypeId_PcProperties'});

  @HiveField(0)
  String id;

  @HiveField(1)
  String patientId;

  @HiveField(2)
  String patientName;

  @HiveField(3)
  DateTime patientDob;

  @HiveField(4)
  String operatorName;

  @HiveField(5)
  DateTime examDateTime;

  @HiveField(6)
  String examTypeId;

  @HiveField(7)
  @override
  String documenttypeId;

  @HiveField(8)
  List<PcSingleTeethProperties> teeths;

  static final String idCCFN = 'id';
  static final String patientNameCCFN = 'patientName';
  static final String patientDobCCFN = 'patientDob';
  static final String operatorNameCCFN = 'operatorName';
  static final String examDateTimeCCFN = 'examDateTime';
  static final String examTypeIdCCFN = 'examTypeId';
  static final String teethsCCFN = 'teeths';

  factory PcProperties.fromJson(Map<String, dynamic> json) =>
      _$PcPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PcPropertiesToJson(this);

  @override
  String getDocumenttypeId() {
    return VwDocumentContent.documenttypeIdPcSingleTeethProperties;
  }

/*
  @override
  Map<String, dynamic> toJson() {
    return {
      PcProperties.idCCFN: this.id,
      PcProperties.patientNameCCFN: this.patientName,
      PcProperties.patientDobCCFN: this.patientDob,
      PcProperties.operatorNameCCFN: this.operatorName,
      PcProperties.examDateTimeCCFN: this.examDateTime,
      PcProperties.examTypeIdCCFN: this.examTypeId,
      PcProperties.teethsCCFN: this.teeths != null && this.teeths.length > 0
          ? this.teeths.map((item) => item.toJson()).toList()
          : [],
    };
  }*/

  PcSingleTeethProperties getTeeth(String teethNumber) {
    PcSingleTeethProperties returnValue;

    teeths.forEach((element) {
      if (element.teethNumber == teethNumber) {
        returnValue = element;
      }
    });

    return returnValue;
  }
/*
  factory PcProperties.fromJson(Map<String, dynamic> data) => PcProperties(
      id: data[PcProperties.idCCFN],
      patientName: data[PcProperties.patientNameCCFN],
      patientDob: data[PcProperties.patientDobCCFN],
      operatorName: data[PcProperties.operatorNameCCFN],
      examDateTime: data[PcProperties.examDateTimeCCFN],
      examTypeId: data[PcProperties.examTypeIdCCFN],
      teeths: data[PcProperties] == null
          ? List<PcSingleTeethProperties>()
          : data[PcProperties.examTypeIdCCFN]
              .map<PcSingleTeethProperties>(
                  (item) => PcSingleTeethProperties.fromJson(item))
              .toList());

 */
}
