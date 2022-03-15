// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlogin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserloginAdapter extends TypeAdapter<Userlogin> {
  @override
  final int typeId = 5;

  @override
  Userlogin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userlogin(
      userlogin_id: fields[0] as String?,
      userlogin_username: fields[1] as String?,
      userlogin_fullname: fields[2] as String?,
      userlogin_role_id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Userlogin obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userlogin_id)
      ..writeByte(1)
      ..write(obj.userlogin_username)
      ..writeByte(2)
      ..write(obj.userlogin_fullname)
      ..writeByte(3)
      ..write(obj.userlogin_role_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserloginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userlogin _$UserloginFromJson(Map<String, dynamic> json) {
  return Userlogin(
    userlogin_id: json['userlogin_id'] as String?,
    userlogin_username: json['userlogin_username'] as String?,
    userlogin_fullname: json['userlogin_fullname'] as String?,
    userlogin_role_id: json['userlogin_role_id'] as String?,
  );
}

Map<String, dynamic> _$UserloginToJson(Userlogin instance) => <String, dynamic>{
      'userlogin_id': instance.userlogin_id,
      'userlogin_username': instance.userlogin_username,
      'userlogin_fullname': instance.userlogin_fullname,
      'userlogin_role_id': instance.userlogin_role_id,
    };
