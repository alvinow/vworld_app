import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
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

  factory Actor.fromJson(Map<String, dynamic> json) =>
      _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);

  @HiveField(0)
  @override
  String documenttypeId=Document.actorDocumenttypeId;

  @HiveField(1)
  final String actor_id;
  @HiveField(2)
  final String actor_actorrole_id;
  @HiveField(3)
  final String actor_fullname;
  @HiveField(4)
  final String actor_username;
  @HiveField(5)
  final String actor_password;
  @HiveField(6)
  final String actor_loginrightstatus_id;
  @HiveField(7)
  final String actor_person_id;
  @HiveField(8)
  final String actor_organization_id;

}