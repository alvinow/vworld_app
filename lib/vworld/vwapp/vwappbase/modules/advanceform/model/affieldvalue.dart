import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'affieldvalue.g.dart';

@HiveType(typeId: 104)
@JsonSerializable()
class AfFieldValue {
  AfFieldValue(
      {@required this.fieldName,
      @required this.value,
      @required this.fieldCaption,
      @required this.valueAfDataType: "String",
      @required this.created,
      @required this.updated,
      @required this.creatorActorId,
      @required this.lastUpdaterActorId,
      @required this.afRefValueFormId});

  @HiveField(0)
  final String fieldName;
  @HiveField(1)
  var value;
  @HiveField(2)
  final String fieldCaption;
  @HiveField(3)
  final String valueAfDataType;
  @HiveField(4)
  String created;
  @HiveField(5)
  String updated;
  @HiveField(6)
  String creatorActorId;
  @HiveField(7)
  String lastUpdaterActorId;
  @HiveField(8)
  final String afRefValueFormId;

  static List<String> afDataType = [
    "String",
    "Integer",
    "Double",
    "DateTime",
    "AfFormRecord",
    "AfFormRecordList"
  ];

  factory AfFieldValue.fromJson(Map<String, dynamic> json) =>
      _$AfFieldValueFromJson(json);

  Map<String, dynamic> toJson() => _$AfFieldValueToJson(this);
}
