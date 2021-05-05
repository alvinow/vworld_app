// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affieldvaluerecord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfFieldValueRecordAdapter extends TypeAdapter<AfFieldValueRecord> {
  @override
  final int typeId = 105;

  @override
  AfFieldValueRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfFieldValueRecord(
      afFormId: fields[0] as String,
      afRecordId: fields[1] as String,
      fields: (fields[2] as List)?.cast<AfFieldValue>(),
    );
  }

  @override
  void write(BinaryWriter writer, AfFieldValueRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.afFormId)
      ..writeByte(1)
      ..write(obj.afRecordId)
      ..writeByte(2)
      ..write(obj.fields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfFieldValueRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfFieldValueRecord _$AfFieldValueRecordFromJson(Map<String, dynamic> json) {
  return AfFieldValueRecord(
    afFormId: json['afFormId'] as String,
    afRecordId: json['afRecordId'] as String,
    fields: (json['fields'] as List)
        ?.map((e) =>
            e == null ? null : AfFieldValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AfFieldValueRecordToJson(AfFieldValueRecord instance) =>
    <String, dynamic>{
      'afFormId': instance.afFormId,
      'afRecordId': instance.afRecordId,
      'fields': instance.fields,
    };
