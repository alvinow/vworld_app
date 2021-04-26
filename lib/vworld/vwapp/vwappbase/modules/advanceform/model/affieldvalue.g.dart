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
      created: fields[4] as String,
      updated: fields[5] as String,
      creatorActorId: fields[6] as String,
      lastUpdaterActorId: fields[7] as String,
      afRefValueFormId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldValue obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.fieldName)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.fieldCaption)
      ..writeByte(3)
      ..write(obj.valueAfDataType)
      ..writeByte(4)
      ..write(obj.created)
      ..writeByte(5)
      ..write(obj.updated)
      ..writeByte(6)
      ..write(obj.creatorActorId)
      ..writeByte(7)
      ..write(obj.lastUpdaterActorId)
      ..writeByte(8)
      ..write(obj.afRefValueFormId);
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
    created: json['created'] as String,
    updated: json['updated'] as String,
    creatorActorId: json['creatorActorId'] as String,
    lastUpdaterActorId: json['lastUpdaterActorId'] as String,
    afRefValueFormId: json['afRefValueFormId'] as String,
  );
}

Map<String, dynamic> _$AfFieldValueToJson(AfFieldValue instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'value': instance.value,
      'fieldCaption': instance.fieldCaption,
      'valueAfDataType': instance.valueAfDataType,
      'created': instance.created,
      'updated': instance.updated,
      'creatorActorId': instance.creatorActorId,
      'lastUpdaterActorId': instance.lastUpdaterActorId,
      'afRefValueFormId': instance.afRefValueFormId,
    };
