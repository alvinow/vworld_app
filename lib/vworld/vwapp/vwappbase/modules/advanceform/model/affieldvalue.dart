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
      this.displayValue,
      @required this.fieldCaption,
      @required this.valueAfDataType: "String",
      @required this.created,
      @required this.updated,
      @required this.creatorActorId,
      @required this.lastUpdaterActorId,
      @required this.afRefValueFormId,
      @required this.comboStringList,

      });

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
  String displayValue;



  @HiveField(7)
  final String fieldCaption;
  @HiveField(8)
  final String valueAfDataType;
  @HiveField(9)
  String created;
  @HiveField(10)
  String updated;
  @HiveField(11)
  String creatorActorId;
  @HiveField(12)
  String lastUpdaterActorId;
  @HiveField(13)
  final String afRefValueFormId;

  @HiveField(14)
  final List<AfFieldValue> comboStringList;





  static List<String> afDataType = [
    "String",
    "Integer",
    "Double",
    "DateTime",
    "ComboString",
    "AfFormRecord",
    "AfFormRecordList"
  ];

  factory AfFieldValue.fromJson(Map<String, dynamic> json) =>
      _$AfFieldValueFromJson(json);

  Map<String, dynamic> toJson() => _$AfFieldValueToJson(this);
}
