// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 50004;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      person_id: fields[0] as String?,
      person_fullname: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.person_id)
      ..writeByte(1)
      ..write(obj.person_fullname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    person_id: json['person_id'] as String?,
    person_fullname: json['person_fullname'] as String?,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'person_id': instance.person_id,
      'person_fullname': instance.person_fullname,
    };
