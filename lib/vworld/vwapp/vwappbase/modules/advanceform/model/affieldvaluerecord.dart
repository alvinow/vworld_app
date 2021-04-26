import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'affieldvaluerecord.g.dart';

@HiveType(typeId: 105)
@JsonSerializable()
class AfFieldValueRecord {
  AfFieldValueRecord({
    @required this.afFormId,
    @required this.afRecordId,
    @required this.record
});


  @HiveField(0)
  final String afFormId;

  @HiveField(1)
  final String afRecordId;

  @HiveField(2)
  final List<AfFieldValue> record;

  factory AfFieldValueRecord.fromJson(Map<String, dynamic> json) =>
      _$AfFieldValueRecordFromJson(json);

  Map<String, dynamic> toJson() => _$AfFieldValueRecordToJson(this);
}
