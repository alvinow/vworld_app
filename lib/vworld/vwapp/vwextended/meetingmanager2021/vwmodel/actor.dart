import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'actor.g.dart';

@HiveType(typeId: 50001)
@JsonSerializable()

class Actor {
  Actor({
    @required this.actor_id,
    @required this.actor_actorrole_id,
    @required this.actor_fullname,
    @required this.actor_username,
    @required this.actor_password,
    @required this.actor_loginrightstatus_id,
    @required this.actor_person_id,
    @required this.actor_organization_id
}
  );



  @HiveField(0)
  final String actor_id;
  @HiveField(1)
  final String actor_actorrole_id;
  @HiveField(2)
  final String actor_fullname;
  @HiveField(3)
  final String actor_username;
  @HiveField(4)
  final String actor_password;
  @HiveField(5)
  final String actor_loginrightstatus_id;
  @HiveField(6)
  final String actor_person_id;
  @HiveField(7)
  final String actor_organization_id;

}