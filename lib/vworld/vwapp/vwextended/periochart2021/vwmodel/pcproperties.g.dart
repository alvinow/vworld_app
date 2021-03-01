// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcproperties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PcPropertiesAdapter extends TypeAdapter<PcProperties> {
  @override
  final int typeId = 1;

  @override
  PcProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PcProperties(
      id: fields[0] as String,
      patientName: fields[1] as String,
      patientDob: fields[2] as DateTime,
      operatorName: fields[3] as String,
      examDateTime: fields[4] as DateTime,
      examTypeId: fields[5] as String,
      teeths: (fields[7] as List)?.cast<PcSingleTeethProperties>(),
      documenttypeId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PcProperties obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientName)
      ..writeByte(2)
      ..write(obj.patientDob)
      ..writeByte(3)
      ..write(obj.operatorName)
      ..writeByte(4)
      ..write(obj.examDateTime)
      ..writeByte(5)
      ..write(obj.examTypeId)
      ..writeByte(6)
      ..write(obj.documenttypeId)
      ..writeByte(7)
      ..write(obj.teeths);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PcPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcProperties _$PcPropertiesFromJson(Map<String, dynamic> json) {
  return PcProperties(
    id: json['id'] as String,
    patientName: json['patientName'] as String,
    patientDob: json['patientDob'] == null
        ? null
        : DateTime.parse(json['patientDob'] as String),
    operatorName: json['operatorName'] as String,
    examDateTime: json['examDateTime'] == null
        ? null
        : DateTime.parse(json['examDateTime'] as String),
    examTypeId: json['examTypeId'] as String,
    teeths: (json['teeths'] as List)
        ?.map((e) => e == null
            ? null
            : PcSingleTeethProperties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    documenttypeId: json['documenttypeId'] as String,
  );
}

Map<String, dynamic> _$PcPropertiesToJson(PcProperties instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientName': instance.patientName,
      'patientDob': instance.patientDob?.toIso8601String(),
      'operatorName': instance.operatorName,
      'examDateTime': instance.examDateTime?.toIso8601String(),
      'examTypeId': instance.examTypeId,
      'documenttypeId': instance.documenttypeId,
      'teeths': instance.teeths,
    };
