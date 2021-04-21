import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 50004)
@JsonSerializable()
class Person{
Person({@required this.person_id,@required this.person_fullname});

factory Person.fromJson(Map<String, dynamic> json) =>
    _$PersonFromJson(json);

Map<String, dynamic> toJson() => _$PersonToJson(this);

@HiveField(0)
  final String person_id;
@HiveField(1)
  final String person_fullname;
}