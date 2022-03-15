// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afform.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AfFormAdapter extends TypeAdapter<AfForm> {
  @override
  final int typeId = 101;

  @override
  AfForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AfForm(
      fieldFormList: (fields[2] as List).cast<AfFieldForm>(),
      afFormId: fields[0] as String?,
      afRecordId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AfForm obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.afFormId)
      ..writeByte(1)
      ..write(obj.afRecordId)
      ..writeByte(2)
      ..write(obj.fieldFormList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AfFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfForm _$AfFormFromJson(Map<String, dynamic> json) {
  return AfForm(
    fieldFormList: (json['fieldFormList'] as List<dynamic>)
        .map((e) => AfFieldForm.fromJson(e as Map<String, dynamic>))
        .toList(),
    afFormId: json['afFormId'] as String?,
    afRecordId: json['afRecordId'] as String?,
  );
}

Map<String, dynamic> _$AfFormToJson(AfForm instance) => <String, dynamic>{
      'afFormId': instance.afFormId,
      'afRecordId': instance.afRecordId,
      'fieldFormList': instance.fieldFormList,
    };
