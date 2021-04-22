// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affieldvalue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfFieldValueAdapter extends TypeAdapter<AfFieldValue> {
  @override
  final int typeId = 104;

  @override
  AfFieldValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfFieldValue(
      fieldName: fields[0] as String,
      value: fields[1] as dynamic,
      fieldCaption: fields[2] as String,
      valueAfDataType: fields[3] as String,
      createdDate: fields[4] as String,
      lastUpdate: fields[5] as String,
      lastUpdaterActorId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldValue obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fieldName)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.fieldCaption)
      ..writeByte(3)
      ..write(obj.valueAfDataType)
      ..writeByte(4)
      ..write(obj.createdDate)
      ..writeByte(5)
      ..write(obj.lastUpdate)
      ..writeByte(6)
      ..write(obj.lastUpdaterActorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfFieldValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfFieldValue _$AfFieldValueFromJson(Map<String, dynamic> json) {
  return AfFieldValue(
    fieldName: json['fieldName'] as String,
    value: json['value'],
    fieldCaption: json['fieldCaption'] as String,
    valueAfDataType: json['valueAfDataType'] as String,
    createdDate: json['createdDate'] as String,
    lastUpdate: json['lastUpdate'] as String,
    lastUpdaterActorId: json['lastUpdaterActorId'] as String,
  );
}

Map<String, dynamic> _$AfFieldValueToJson(AfFieldValue instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'value': instance.value,
      'fieldCaption': instance.fieldCaption,
      'valueAfDataType': instance.valueAfDataType,
      'createdDate': instance.createdDate,
      'lastUpdate': instance.lastUpdate,
      'lastUpdaterActorId': instance.lastUpdaterActorId,
    };
