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
      id: fields[0] as String?,
      patientName: fields[2] as String?,
      patientDob: fields[3] as DateTime?,
      operatorName: fields[4] as String?,
      examDateTime: fields[5] as DateTime?,
      examTypeId: fields[6] as String?,
      teeths: (fields[8] as List).cast<PcSingleTeethProperties>(),
      documenttypeId: fields[7] as String?,
    )..patientId = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, PcProperties obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientId)
      ..writeByte(2)
      ..write(obj.patientName)
      ..writeByte(3)
      ..write(obj.patientDob)
      ..writeByte(4)
      ..write(obj.operatorName)
      ..writeByte(5)
      ..write(obj.examDateTime)
      ..writeByte(6)
      ..write(obj.examTypeId)
      ..writeByte(7)
      ..write(obj.documenttypeId)
      ..writeByte(8)
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
    id: json['id'] as String?,
    patientName: json['patientName'] as String?,
    patientDob: json['patientDob'] == null
        ? null
        : DateTime.parse(json['patientDob'] as String),
    operatorName: json['operatorName'] as String?,
    examDateTime: json['examDateTime'] == null
        ? null
        : DateTime.parse(json['examDateTime'] as String),
    examTypeId: json['examTypeId'] as String?,
    teeths: (json['teeths'] as List<dynamic>)
        .map((e) => PcSingleTeethProperties.fromJson(e as Map<String, dynamic>))
        .toList(),
    documenttypeId: json['documenttypeId'] as String?,
  )..patientId = json['patientId'] as String?;
}

Map<String, dynamic> _$PcPropertiesToJson(PcProperties instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'patientDob': instance.patientDob?.toIso8601String(),
      'operatorName': instance.operatorName,
      'examDateTime': instance.examDateTime?.toIso8601String(),
      'examTypeId': instance.examTypeId,
      'documenttypeId': instance.documenttypeId,
      'teeths': instance.teeths,
    };
