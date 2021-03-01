// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcsingleteethproperties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PcSingleTeethPropertiesAdapter
    extends TypeAdapter<PcSingleTeethProperties> {
  @override
  final int typeId = 2;

  @override
  PcSingleTeethProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PcSingleTeethProperties(
      teethNumber: fields[0] as String,
      mobilityLevel: fields[1] as int,
      isImplant: fields[2] as int,
      buccalSide: fields[3] as PcSingleTeethSideProperties,
      lingualSide: fields[4] as PcSingleTeethSideProperties,
      note: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PcSingleTeethProperties obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.teethNumber)
      ..writeByte(1)
      ..write(obj.mobilityLevel)
      ..writeByte(2)
      ..write(obj.isImplant)
      ..writeByte(3)
      ..write(obj.buccalSide)
      ..writeByte(4)
      ..write(obj.lingualSide)
      ..writeByte(5)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PcSingleTeethPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcSingleTeethProperties _$PcSingleTeethPropertiesFromJson(
    Map<String, dynamic> json) {
  return PcSingleTeethProperties(
    teethNumber: json['teethNumber'] as String,
    mobilityLevel: json['mobilityLevel'] as int,
    isImplant: json['isImplant'] as int,
    buccalSide: json['buccalSide'] == null
        ? null
        : PcSingleTeethSideProperties.fromJson(
            json['buccalSide'] as Map<String, dynamic>),
    lingualSide: json['lingualSide'] == null
        ? null
        : PcSingleTeethSideProperties.fromJson(
            json['lingualSide'] as Map<String, dynamic>),
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$PcSingleTeethPropertiesToJson(
        PcSingleTeethProperties instance) =>
    <String, dynamic>{
      'teethNumber': instance.teethNumber,
      'mobilityLevel': instance.mobilityLevel,
      'isImplant': instance.isImplant,
      'buccalSide': instance.buccalSide,
      'lingualSide': instance.lingualSide,
      'note': instance.note,
    };
