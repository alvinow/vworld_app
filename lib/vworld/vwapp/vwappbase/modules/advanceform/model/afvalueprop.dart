import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'afvalueprop.g.dart';

@HiveType(typeId: 103)
@JsonSerializable()
class AfValueProp {
  AfValueProp(
      {this.uifieldType: 'String',
      this.stringMaxLines: 1,
      this.stringMaxLength: 160,
      this.intMaxValue: 9223372036854775807,
      this.intMinValue: -9223372036854775807,
      this.doubleDigitPrecision: 6,
      this.doubleDigitMaxLength: 26,
      this.isMandatory: false,
      this.isReadOnly: false,
      this.isObscureText: false,
      this.isNotNull: false});

  @HiveField(0)
  String uifieldType;
  @HiveField(1)
  final int stringMaxLines;
  @HiveField(2)
  final int stringMaxLength;
  @HiveField(3)
  final int intMaxValue;
  @HiveField(4)
  final int intMinValue;
  @HiveField(5)
  final int doubleDigitPrecision;
  @HiveField(6)
  final int doubleDigitMaxLength;
  @HiveField(7)
  final bool isMandatory;
  @HiveField(8)
  final bool isReadOnly;
  @HiveField(9)
  final bool isObscureText;
  @HiveField(10)
  final bool isNotNull;

  factory AfValueProp.fromJson(Map<String, dynamic> json) =>
      _$AfValuePropFromJson(json);

  Map<String, dynamic> toJson() => _$AfValuePropToJson(this);
}
