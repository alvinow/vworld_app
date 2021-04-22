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
      @required this.createdDate,
      @required this.lastUpdate,
      @required this.lastUpdaterActorId});

  @HiveField(0)
  String fieldName;
  @HiveField(1)
  var value;
  @HiveField(2)
  String fieldCaption;
  @HiveField(3)
  String valueAfDataType;
  @HiveField(4)
  String createdDate;
  @HiveField(5)
  String lastUpdate;
  @HiveField(6)
  String lastUpdaterActorId;

  static List<String> afDataType = ["String", "Integer", "Double", "DateTime"];

  factory AfFieldValue.fromJson(Map<String, dynamic> json) =>
      _$AfFieldValueFromJson(json);

  Map<String, dynamic> toJson() => _$AfFieldValueToJson(this);
}
