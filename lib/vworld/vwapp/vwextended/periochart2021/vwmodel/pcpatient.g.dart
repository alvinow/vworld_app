// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcpatient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PcPatientAdapter extends TypeAdapter<PcPatient> {
  @override
  final int typeId = 4;

  @override
  PcPatient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PcPatient(
      id: fields[0] as String,
      fullName: fields[1] as String,
      gender: fields[2] as String,
      birthOfDate: fields[3] as DateTime,
      allergy: fields[4] as String,
      medicalHistory: fields[5] as String,
      address: fields[6] as String,
      city: fields[7] as String,
      phone: fields[8] as String,
      occupation: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PcPatient obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.birthOfDate)
      ..writeByte(4)
      ..write(obj.allergy)
      ..writeByte(5)
      ..write(obj.medicalHistory)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.occupation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PcPatientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcPatient _$PcPatientFromJson(Map<String, dynamic> json) {
  return PcPatient(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    gender: json['gender'] as String,
    birthOfDate: json['birthOfDate'] == null
        ? null
        : DateTime.parse(json['birthOfDate'] as String),
    allergy: json['allergy'] as String,
    medicalHistory: json['medicalHistory'] as String,
    address: json['address'] as String,
    city: json['city'] as String,
    phone: json['phone'] as String,
    occupation: json['occupation'] as String,
  );
}

Map<String, dynamic> _$PcPatientToJson(PcPatient instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'birthOfDate': instance.birthOfDate?.toIso8601String(),
      'allergy': instance.allergy,
      'medicalHistory': instance.medicalHistory,
      'address': instance.address,
      'city': instance.city,
      'phone': instance.phone,
      'occupation': instance.occupation,
    };
