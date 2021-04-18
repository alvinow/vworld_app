import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'organization.g.dart';


@HiveType(typeId: 50003)
@JsonSerializable()
class Organization {
  Organization({
    @required this.organization_id,
    @required this.organization_name
});

  @HiveField(0)
  final String organization_id;
  @HiveField(1)
  final String organization_name;

}