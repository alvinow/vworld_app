// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorAdapter extends TypeAdapter<Actor> {
  @override
  final int typeId = 50001;

  @override
  Actor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Actor(
      actor_id: fields[0] as String,
      actor_actorrole_id: fields[1] as String,
      actor_fullname: fields[2] as String,
      actor_username: fields[3] as String,
      actor_password: fields[4] as String,
      actor_loginrightstatus_id: fields[5] as String,
      actor_person_id: fields[6] as String,
      actor_organization_id: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Actor obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.actor_id)
      ..writeByte(1)
      ..write(obj.actor_actorrole_id)
      ..writeByte(2)
      ..write(obj.actor_fullname)
      ..writeByte(3)
      ..write(obj.actor_username)
      ..writeByte(4)
      ..write(obj.actor_password)
      ..writeByte(5)
      ..write(obj.actor_loginrightstatus_id)
      ..writeByte(6)
      ..write(obj.actor_person_id)
      ..writeByte(7)
      ..write(obj.actor_organization_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return Actor(
    actor_id: json['actor_id'] as String,
    actor_actorrole_id: json['actor_actorrole_id'] as String,
    actor_fullname: json['actor_fullname'] as String,
    actor_username: json['actor_username'] as String,
    actor_password: json['actor_password'] as String,
    actor_loginrightstatus_id: json['actor_loginrightstatus_id'] as String,
    actor_person_id: json['actor_person_id'] as String,
    actor_organization_id: json['actor_organization_id'] as String,
  );
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'actor_id': instance.actor_id,
      'actor_actorrole_id': instance.actor_actorrole_id,
      'actor_fullname': instance.actor_fullname,
      'actor_username': instance.actor_username,
      'actor_password': instance.actor_password,
      'actor_loginrightstatus_id': instance.actor_loginrightstatus_id,
      'actor_person_id': instance.actor_person_id,
      'actor_organization_id': instance.actor_organization_id,
    };
