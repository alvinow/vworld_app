import 'package:equatable/equatable.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';

abstract class MeetingmainpageEvent extends Equatable {
  const MeetingmainpageEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}



class OpenAfformPageOnMeetingmainpageEvent extends MeetingmainpageEvent {
  OpenAfformPageOnMeetingmainpageEvent(this.timestamp);

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp];

  @override
  String toString() =>
      'OpenAfformPageOnMeetingmainpageEvent{${this.timestamp.toString()}}';
}

class SavemeetingeventpageOnMeetingmainpageEvent extends MeetingmainpageEvent{
  SavemeetingeventpageOnMeetingmainpageEvent(this.timestamp, this.meetingAfForm);

  final DateTime timestamp;
  final AfForm meetingAfForm;

  @override
  List<Object> get props => [timestamp,meetingAfForm];

  @override
  String toString() =>
      'SavemeetingeventpageOnMeetingmainpageEvent{${this.timestamp.toString()}}';




}

class OpeneventpageOnMeetingmainpageEvent extends MeetingmainpageEvent {
  OpeneventpageOnMeetingmainpageEvent(this.timestamp);

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp];

  @override
  String toString() =>
      'OpeneventpageOnMeetingmainpageEvent{${this.timestamp.toString()}}';
}

class OpenactorinfopageOnMeetingmainpageEvent extends MeetingmainpageEvent {
  OpenactorinfopageOnMeetingmainpageEvent(this.timestamp);

  final DateTime timestamp;

  @override
  List<Object> get props => [timestamp];

  @override
  String toString() =>
      'OpenactorinfopageOnMeetingmainpageEvent{${this.timestamp.toString()}}';
}
