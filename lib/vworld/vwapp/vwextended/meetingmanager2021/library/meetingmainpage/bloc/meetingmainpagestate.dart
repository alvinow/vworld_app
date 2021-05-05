import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';

abstract class MeetingmainpageState extends Equatable {
  MeetingmainpageState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class UninitializedOnMeetingainpageState extends MeetingmainpageState {
  @override
  String toString() => 'UninitializedOnMeetingainpageState';
}

class DisplayeventpageOnMeetingmainpageState extends MeetingmainpageState {
  DisplayeventpageOnMeetingmainpageState({@required this.title, @required this.actor, @required this.meetingList, @required this.organizationMember, @required this.afFormGridParam});

  final String title;
  final Actor actor;
  final List<Meeting> meetingList;
  final List<Actor> organizationMember;
  final AfFormGridParam afFormGridParam;

  @override
  String toString() => 'ShoweventpageOnMeetingmainpageState';
}

class DisplayAfformOnMeetingmainpageState extends MeetingmainpageState{
  DisplayAfformOnMeetingmainpageState(this.afForm);

  AfForm afForm;

  @override
  String toString() => 'DisplayAfformOnMeetingmainpageState';

}

class DisplayactorinfopageOnMeetingmainpageState extends MeetingmainpageState{

  DisplayactorinfopageOnMeetingmainpageState({@required this.actor});

  final Actor actor;

  @override
  String toString() => 'ShowactorinfopageOnMeetingmainpageState';

}

class ProcessingOnMeetingmainpageState extends MeetingmainpageState {
  ProcessingOnMeetingmainpageState ({@required this.title, this.description:''});

  final String title;
  final String description;

  @override
  List<Object> get props => [title, description];

  @override
  String toString() => 'LayAuthStateProcessing';
}