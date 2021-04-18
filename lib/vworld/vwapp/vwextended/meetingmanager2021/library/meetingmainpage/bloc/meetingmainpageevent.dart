import 'package:equatable/equatable.dart';

abstract class MeetingmainpageEvent extends Equatable {
  const MeetingmainpageEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
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
