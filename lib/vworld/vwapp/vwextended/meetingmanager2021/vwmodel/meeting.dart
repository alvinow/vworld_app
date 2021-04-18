import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'meeting.g.dart';

@HiveType(typeId: 50002)
@JsonSerializable()
class Meeting {
  Meeting({@required this.meeting_id,
  @required this.meeting_meetingtype_id,
    @required this.meeting_meetingstatus_id,
    @required this.meeting_name,
    @required this.meeting_start_datetime,
    @required this.meeting_end_datetime,
    @required this.meeting_owner_actor_id
  });

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingToJson(this);


  @HiveField(0)
  final String meeting_id;
  @HiveField(1)
  final String meeting_meetingtype_id;
  @HiveField(2)
  final String meeting_meetingstatus_id;
  @HiveField(3)
  final String meeting_name;
  @HiveField(4)
  final String meeting_start_datetime;
  @HiveField(5)
  final String meeting_end_datetime;
  @HiveField(6)
  final String meeting_owner_actor_id;
}