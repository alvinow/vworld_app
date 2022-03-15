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
      fieldName: fields[0] as String?,
      stringValue: fields[1] as String?,
      integerValue: fields[2] as int?,
      doubleValue: fields[3] as double?,
      dateTimeValue: fields[4] as DateTime?,
      displayValue: fields[5] as String?,
      fieldCaption: fields[7] as String?,
      valueAfDataType: fields[8] as String?,
      created: fields[9] as String?,
      updated: fields[10] as String?,
      creatorActorId: fields[11] as String?,
      lastUpdaterActorId: fields[12] as String?,
      afRefValueFormId: fields[13] as String?,
      comboStringList: (fields[14] as List?)?.cast<AfFieldValue>(),
      valueAfDataContext: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldValue obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.displayValue)
      ..writeByte(7)
      ..write(obj.fieldCaption)
      ..writeByte(8)
      ..write(obj.valueAfDataType)
      ..writeByte(9)
      ..write(obj.created)
      ..writeByte(10)
      ..write(obj.updated)
      ..writeByte(11)
      ..write(obj.creatorActorId)
      ..writeByte(12)
      ..write(obj.lastUpdaterActorId)
      ..writeByte(13)
      ..write(obj.afRefValueFormId)
      ..writeByte(14)
      ..write(obj.comboStringList)
      ..writeByte(15)
      ..write(obj.valueAfDataContext);
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
    fieldName: json['fieldName'] as String?,
    stringValue: json['stringValue'] as String?,
    integerValue: json['integerValue'] as int?,
    doubleValue: (json['doubleValue'] as num?)?.toDouble(),
    dateTimeValue: json['dateTimeValue'] == null
        ? null
        : DateTime.parse(json['dateTimeValue'] as String),
    displayValue: json['displayValue'] as String?,
    fieldCaption: json['fieldCaption'] as String?,
    valueAfDataType: json['valueAfDataType'] as String?,
    created: json['created'] as String?,
    updated: json['updated'] as String?,
    creatorActorId: json['creatorActorId'] as String?,
    lastUpdaterActorId: json['lastUpdaterActorId'] as String?,
    afRefValueFormId: json['afRefValueFormId'] as String?,
    comboStringList: (json['comboStringList'] as List<dynamic>?)
        ?.map((e) => AfFieldValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    valueAfDataContext: json['valueAfDataContext'] as String?,
  );
}

Map<String, dynamic> _$AfFieldValueToJson(AfFieldValue instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'stringValue': instance.stringValue,
      'integerValue': instance.integerValue,
      'doubleValue': instance.doubleValue,
      'dateTimeValue': instance.dateTimeValue?.toIso8601String(),
      'displayValue': instance.displayValue,
      'fieldCaption': instance.fieldCaption,
      'valueAfDataType': instance.valueAfDataType,
      'created': instance.created,
      'updated': instance.updated,
      'creatorActorId': instance.creatorActorId,
      'lastUpdaterActorId': instance.lastUpdaterActorId,
      'afRefValueFormId': instance.afRefValueFormId,
      'comboStringList': instance.comboStringList,
      'valueAfDataContext': instance.valueAfDataContext,
    };
