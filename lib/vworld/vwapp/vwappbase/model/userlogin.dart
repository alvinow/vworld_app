import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'userlogin.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class Userlogin {
  Userlogin(
      {@required this.userlogin_id,
      this.userlogin_username,
      this.userlogin_fullname,
      this.userlogin_role_id});

  factory Userlogin.fromJson(Map<String, dynamic> json) =>
      _$UserloginFromJson(json);

  Map<String, dynamic> toJson() => _$UserloginToJson(this);

  @HiveField(0)
  final String userlogin_id;

  @HiveField(1)
  final String userlogin_username;

  @HiveField(2)
  String userlogin_fullname;

  @HiveField(3)
  String userlogin_role_id; //doctor, admin
}
