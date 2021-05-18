// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affieldform.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfFieldFormAdapter extends TypeAdapter<AfFieldForm> {
  @override
  final int typeId = 102;

  @override
  AfFieldForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfFieldForm(
      fieldValue: fields[0] as AfFieldValue,
      valueProp: fields[1] as AfValueProp,
      useExpansionTile: fields[2] as bool,
      autoExpandWhenNotNull: fields[3] as bool,
      initiallyExpanded: fields[4] as bool,
      isHidden: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldForm obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fieldValue)
      ..writeByte(1)
      ..write(obj.valueProp)
      ..writeByte(2)
      ..write(obj.useExpansionTile)
      ..writeByte(3)
      ..write(obj.autoExpandWhenNotNull)
      ..writeByte(4)
      ..write(obj.initiallyExpanded)
      ..writeByte(5)
      ..write(obj.isHidden);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfFieldFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfFieldForm _$AfFieldFormFromJson(Map<String, dynamic> json) {
  return AfFieldForm(
    fieldValue: json['fieldValue'] == null
        ? null
        : AfFieldValue.fromJson(json['fieldValue'] as Map<String, dynamic>),
    valueProp: json['valueProp'] == null
        ? null
        : AfValueProp.fromJson(json['valueProp'] as Map<String, dynamic>),
    useExpansionTile: json['useExpansionTile'] as bool,
    autoExpandWhenNotNull: json['autoExpandWhenNotNull'] as bool,
    initiallyExpanded: json['initiallyExpanded'] as bool,
    isHidden: json['isHidden'] as bool,
  );
}

Map<String, dynamic> _$AfFieldFormToJson(AfFieldForm instance) =>
    <String, dynamic>{
      'fieldValue': instance.fieldValue,
      'valueProp': instance.valueProp,
      'useExpansionTile': instance.useExpansionTile,
      'autoExpandWhenNotNull': instance.autoExpandWhenNotNull,
      'initiallyExpanded': instance.initiallyExpanded,
      'isHidden': instance.isHidden,
    };
