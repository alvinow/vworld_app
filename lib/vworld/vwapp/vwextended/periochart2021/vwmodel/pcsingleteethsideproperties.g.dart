// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcsingleteethsideproperties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PcSingleTeethSidePropertiesAdapter
    extends TypeAdapter<PcSingleTeethSideProperties> {
  @override
  final int typeId = 3;

  @override
  PcSingleTeethSideProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PcSingleTeethSideProperties(
      teethNumber: fields[0] as String,
      teethSide: fields[1] as String,
      furcationLevelPointA: fields[2] as int,
      furcationLevelPointB: fields[3] as int,
      isBleedingOnProbingPointA: fields[4] as int,
      isBleedingOnProbingPointB: fields[5] as int,
      isBleedingOnProbingPointC: fields[6] as int,
      isPlaquePointA: fields[7] as int,
      isPlaquePointB: fields[8] as int,
      isPlaquePointC: fields[9] as int,
      gingivalMarginPointA: fields[10] as int,
      gingivalMarginPointB: fields[11] as int,
      gingivalMarginPointC: fields[12] as int,
      probingDepthPointA: fields[13] as int,
      probingDepthPointB: fields[14] as int,
      probingDepthPointC: fields[15] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PcSingleTeethSideProperties obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.teethNumber)
      ..writeByte(1)
      ..write(obj.teethSide)
      ..writeByte(2)
      ..write(obj.furcationLevelPointA)
      ..writeByte(3)
      ..write(obj.furcationLevelPointB)
      ..writeByte(4)
      ..write(obj.isBleedingOnProbingPointA)
      ..writeByte(5)
      ..write(obj.isBleedingOnProbingPointB)
      ..writeByte(6)
      ..write(obj.isBleedingOnProbingPointC)
      ..writeByte(7)
      ..write(obj.isPlaquePointA)
      ..writeByte(8)
      ..write(obj.isPlaquePointB)
      ..writeByte(9)
      ..write(obj.isPlaquePointC)
      ..writeByte(10)
      ..write(obj.gingivalMarginPointA)
      ..writeByte(11)
      ..write(obj.gingivalMarginPointB)
      ..writeByte(12)
      ..write(obj.gingivalMarginPointC)
      ..writeByte(13)
      ..write(obj.probingDepthPointA)
      ..writeByte(14)
      ..write(obj.probingDepthPointB)
      ..writeByte(15)
      ..write(obj.probingDepthPointC);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PcSingleTeethSidePropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcSingleTeethSideProperties _$PcSingleTeethSidePropertiesFromJson(
    Map<String, dynamic> json) {
  return PcSingleTeethSideProperties(
    teethNumber: json['teethNumber'] as String,
    teethSide: json['teethSide'] as String,
    furcationLevelPointA: json['furcationLevelPointA'] as int,
    furcationLevelPointB: json['furcationLevelPointB'] as int,
    isBleedingOnProbingPointA: json['isBleedingOnProbingPointA'] as int,
    isBleedingOnProbingPointB: json['isBleedingOnProbingPointB'] as int,
    isBleedingOnProbingPointC: json['isBleedingOnProbingPointC'] as int,
    isPlaquePointA: json['isPlaquePointA'] as int,
    isPlaquePointB: json['isPlaquePointB'] as int,
    isPlaquePointC: json['isPlaquePointC'] as int,
    gingivalMarginPointA: json['gingivalMarginPointA'] as int,
    gingivalMarginPointB: json['gingivalMarginPointB'] as int,
    gingivalMarginPointC: json['gingivalMarginPointC'] as int,
    probingDepthPointA: json['probingDepthPointA'] as int,
    probingDepthPointB: json['probingDepthPointB'] as int,
    probingDepthPointC: json['probingDepthPointC'] as int,
  );
}

Map<String, dynamic> _$PcSingleTeethSidePropertiesToJson(
        PcSingleTeethSideProperties instance) =>
    <String, dynamic>{
      'teethNumber': instance.teethNumber,
      'teethSide': instance.teethSide,
      'furcationLevelPointA': instance.furcationLevelPointA,
      'furcationLevelPointB': instance.furcationLevelPointB,
      'isBleedingOnProbingPointA': instance.isBleedingOnProbingPointA,
      'isBleedingOnProbingPointB': instance.isBleedingOnProbingPointB,
      'isBleedingOnProbingPointC': instance.isBleedingOnProbingPointC,
      'isPlaquePointA': instance.isPlaquePointA,
      'isPlaquePointB': instance.isPlaquePointB,
      'isPlaquePointC': instance.isPlaquePointC,
      'gingivalMarginPointA': instance.gingivalMarginPointA,
      'gingivalMarginPointB': instance.gingivalMarginPointB,
      'gingivalMarginPointC': instance.gingivalMarginPointC,
      'probingDepthPointA': instance.probingDepthPointA,
      'probingDepthPointB': instance.probingDepthPointB,
      'probingDepthPointC': instance.probingDepthPointC,
    };
