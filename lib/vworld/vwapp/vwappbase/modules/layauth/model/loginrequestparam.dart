import 'package:flutter/material.dart';

class LoginRequestParam {
  final String? username;
  final String? password;
  //final DeviceInfo deviceInfo;

  static const String username_fieldName = 'username';
  static const password_fieldName = 'password';
  static const deviceInfo_fieldName = 'deviceInfo';

  LoginRequestParam(
      {required this.username, required this.password});

  Map<String, dynamic> toJson() => {
    username_fieldName: this.username,
    password_fieldName: this.password

  };

  factory LoginRequestParam.fromJson(Map<String, dynamic> data) =>
      LoginRequestParam(
        username: data[LoginRequestParam.username_fieldName],
        password: data[LoginRequestParam.password_fieldName],
      );
}