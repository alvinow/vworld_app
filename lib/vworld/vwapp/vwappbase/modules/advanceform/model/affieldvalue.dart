import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'affieldvalue.g.dart';

@HiveType(typeId: 104)
@JsonSerializable()
class AfFieldValue {
  AfFieldValue(
      {@required this.fieldName,
      this.stringValue,
      this.integerValue,
      this.doubleValue,
      this.dateTimeValue,
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
  String stringValue;

  @HiveField(2)
  int integerValue;

  @HiveField(3)
  double doubleValue;

  @HiveField(4)
  DateTime dateTimeValue;



  @HiveField(5)
  final String fieldCaption;
  @HiveField(6)
  final String valueAfDataType;
  @HiveField(7)
  String created;
  @HiveField(8)
  String updated;
  @HiveField(9)
  String creatorActorId;
  @HiveField(10)
  String lastUpdaterActorId;
  @HiveField(11)
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
