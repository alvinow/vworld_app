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
      stringValue: fields[1] as String,
      integerValue: fields[2] as int,
      doubleValue: fields[3] as double,
      dateTimeValue: fields[4] as DateTime,
      fieldCaption: fields[5] as String,
      valueAfDataType: fields[6] as String,
      created: fields[7] as String,
      updated: fields[8] as String,
      creatorActorId: fields[9] as String,
      lastUpdaterActorId: fields[10] as String,
      afRefValueFormId: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldValue obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.fieldName)
      ..writeByte(1)
      ..write(obj.stringValue)
      ..writeByte(2)
      ..write(obj.integerValue)
      ..writeByte(3)
      ..write(obj.doubleValue)
      ..writeByte(4)
      ..write(obj.dateTimeValue)
      ..writeByte(5)
      ..write(obj.fieldCaption)
      ..writeByte(6)
      ..write(obj.valueAfDataType)
      ..writeByte(7)
      ..write(obj.created)
      ..writeByte(8)
      ..write(obj.updated)
      ..writeByte(9)
      ..write(obj.creatorActorId)
      ..writeByte(10)
      ..write(obj.lastUpdaterActorId)
      ..writeByte(11)
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
    stringValue: json['stringValue'] as String,
    integerValue: json['integerValue'] as int,
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    dateTimeValue: json['dateTimeValue'] == null
        ? null
        : DateTime.parse(json['dateTimeValue'] as String),
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
      'stringValue': instance.stringValue,
      'integerValue': instance.integerValue,
      'doubleValue': instance.doubleValue,
      'dateTimeValue': instance.dateTimeValue?.toIso8601String(),
      'fieldCaption': instance.fieldCaption,
      'valueAfDataType': instance.valueAfDataType,
      'created': instance.created,
      'updated': instance.updated,
      'creatorActorId': instance.creatorActorId,
      'lastUpdaterActorId': instance.lastUpdaterActorId,
      'afRefValueFormId': instance.afRefValueFormId,
    };
