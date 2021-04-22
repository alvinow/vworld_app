import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'dart:core';
part 'meeting.g.dart';

@HiveType(typeId: 50002)
@JsonSerializable()
class Meeting {
  Meeting(
      {@required this.meeting_id,
      @required this.meeting_meetingtype_id,
      @required this.meeting_meetingstatus_id,
      @required this.meeting_name,
      @required this.meeting_start_datetime,
      @required this.meeting_end_datetime,
      @required this.meeting_owner_actor_id,
      @required this.comitte,
      @required this.participants});

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
  final DateTime meeting_start_datetime;
  @HiveField(5)
  final DateTime meeting_end_datetime;
  @HiveField(6)
  final String meeting_owner_actor_id;

  @HiveField(7)
  final List<Actor> comitte;
  @HiveField(8)
  final List<Actor> participants;

  static Map<DateTime, List<String>> getCalenderList(List<Meeting> meetings) {
    Map<DateTime, List<String>> returnValue = Map<DateTime, List<String>>();

    final DateTime oldestMeetingDate =
        Meeting.getOldestMeetingDateTime(meetings);
    final DateTime newestMeetingDate =
        Meeting.getLatestMeetingDateTime(meetings);

    int diffDaysCountMeeting = Meeting.getDiffDaysMeetingDateTime(meetings);

    DateTime dateIteratorAfter = DateTime(
        oldestMeetingDate.year, oldestMeetingDate.month, oldestMeetingDate.day);
    DateTime dateIteratorBefore = DateTime(oldestMeetingDate.year,
        oldestMeetingDate.month, oldestMeetingDate.day, 23, 59, 59);
    ;

    for (int dayCounter = 0; dayCounter < diffDaysCountMeeting; dayCounter++) {
      List<String> currentMeetingList = <String>[];
      for (int meetingCounter = 0;
          meetingCounter < meetings.length;
          meetingCounter++) {
        final currentMeeting = meetings.elementAt(meetingCounter);

        bool isAfterStart=dateIteratorBefore.isAfter(currentMeeting.meeting_start_datetime);

        bool isBeforeEnd=dateIteratorAfter.isBefore(currentMeeting.meeting_end_datetime) ;

        bool isSameMoment=currentMeeting.meeting_start_datetime
            .isAtSameMomentAs(dateIteratorAfter);



        if (isSameMoment || (isAfterStart && isBeforeEnd) ) {
          currentMeetingList.add(currentMeeting.meeting_name);
        }
      }

      returnValue[dateIteratorAfter] = currentMeetingList;

      dateIteratorAfter = dateIteratorAfter.add(Duration(days: 1));
      dateIteratorBefore = dateIteratorBefore.add(Duration(days: 1));
    }

    print('Oldest Meeting: $oldestMeetingDate');

    print('Newest Meeting: $newestMeetingDate');

    return returnValue;
  }

  static int getDiffDaysMeetingDateTime(List<Meeting> meetings) {
    DateTime oldestMeeting = Meeting.getOldestMeetingDateTime(meetings);
    DateTime newestMeeting = Meeting.getLatestMeetingDateTime(meetings);

    int returnValue = oldestMeeting.difference(newestMeeting).inDays.abs();

    return returnValue;
  }

  static DateTime getOldestMeetingDateTime(List<Meeting> meetings) {
    DateTime returnValue = DateTime.now();

    for (int la = 0; la < meetings.length; la++) {
      DateTime currentMeetingDate =
          meetings.elementAt(la).meeting_start_datetime;

      if (returnValue.difference(currentMeetingDate).inDays > 0) {
        returnValue = currentMeetingDate;
      }
    }

    return returnValue;
  }

  static DateTime getLatestMeetingDateTime(List<Meeting> meetings) {
    DateTime returnValue = DateTime.now();

    for (int la = 0; la < meetings.length; la++) {
      DateTime currentMeetingDate = meetings.elementAt(la).meeting_end_datetime;

      if (returnValue.difference(currentMeetingDate).inDays < 0) {
        returnValue = currentMeetingDate;
      }
    }
    return returnValue;
  }
}
