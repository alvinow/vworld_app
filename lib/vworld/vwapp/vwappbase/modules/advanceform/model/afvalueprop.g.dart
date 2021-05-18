// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afvalueprop.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfValuePropAdapter extends TypeAdapter<AfValueProp> {
  @override
  final int typeId = 103;

  @override
  AfValueProp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfValueProp(
      uifieldType: fields[0] as String,
      stringMaxLines: fields[1] as int,
      stringMaxLength: fields[2] as int,
      intMaxValue: fields[3] as int,
      intMinValue: fields[4] as int,
      doubleDigitPrecision: fields[5] as int,
      doubleDigitMaxLength: fields[6] as int,
      isMandatory: fields[7] as bool,
      isGuiReadOnly: fields[8] as bool,
      isObscureText: fields[9] as bool,
      isNotNull: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AfValueProp obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uifieldType)
      ..writeByte(1)
      ..write(obj.stringMaxLines)
      ..writeByte(2)
      ..write(obj.stringMaxLength)
      ..writeByte(3)
      ..write(obj.intMaxValue)
      ..writeByte(4)
      ..write(obj.intMinValue)
      ..writeByte(5)
      ..write(obj.doubleDigitPrecision)
      ..writeByte(6)
      ..write(obj.doubleDigitMaxLength)
      ..writeByte(7)
      ..write(obj.isMandatory)
      ..writeByte(8)
      ..write(obj.isGuiReadOnly)
      ..writeByte(9)
      ..write(obj.isObscureText)
      ..writeByte(10)
      ..write(obj.isNotNull);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfValuePropAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfValueProp _$AfValuePropFromJson(Map<String, dynamic> json) {
  return AfValueProp(
    uifieldType: json['uifieldType'] as String,
    stringMaxLines: json['stringMaxLines'] as int,
    stringMaxLength: json['stringMaxLength'] as int,
    intMaxValue: json['intMaxValue'] as int,
    intMinValue: json['intMinValue'] as int,
    doubleDigitPrecision: json['doubleDigitPrecision'] as int,
    doubleDigitMaxLength: json['doubleDigitMaxLength'] as int,
    isMandatory: json['isMandatory'] as bool,
    isGuiReadOnly: json['isGuiReadOnly'] as bool,
    isObscureText: json['isObscureText'] as bool,
    isNotNull: json['isNotNull'] as bool,
  );
}

Map<String, dynamic> _$AfValuePropToJson(AfValueProp instance) =>
    <String, dynamic>{
      'uifieldType': instance.uifieldType,
      'stringMaxLines': instance.stringMaxLines,
      'stringMaxLength': instance.stringMaxLength,
      'intMaxValue': instance.intMaxValue,
      'intMinValue': instance.intMinValue,
      'doubleDigitPrecision': instance.doubleDigitPrecision,
      'doubleDigitMaxLength': instance.doubleDigitMaxLength,
      'isMandatory': instance.isMandatory,
      'isGuiReadOnly': instance.isGuiReadOnly,
      'isObscureText': instance.isObscureText,
      'isNotNull': instance.isNotNull,
    };
