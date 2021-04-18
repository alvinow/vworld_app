// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseAdapter extends TypeAdapter<LoginResponse> {
  @override
  final int typeId = 6;

  @override
  LoginResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponse(
      success: fields[0] as bool,
      authenticated: fields[1] as bool,
      loginsessionId: fields[2] as String,
      userProfile: fields[3] as Userlogin,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.authenticated)
      ..writeByte(2)
      ..write(obj.loginsessionId)
      ..writeByte(3)
      ..write(obj.userProfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    success: json['success'] as bool,
    authenticated: json['authenticated'] as bool,
    loginsessionId: json['loginsessionId'] as String,
    userProfile: json['userProfile'] == null
        ? null
        : Userlogin.fromJson(json['userProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'authenticated': instance.authenticated,
      'loginsessionId': instance.loginsessionId,
      'userProfile': instance.userProfile,
    };
