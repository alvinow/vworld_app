import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';

class MeetingmainpageBloc
    extends Bloc<MeetingmainpageEvent, MeetingmainpageState> {
  MeetingmainpageBloc(this.currrentActor) : super(UninitializedOnMeetingainpageState());

  final Actor currrentActor;

  @override
  Stream<Transition<MeetingmainpageEvent, MeetingmainpageState>>
      transformEvents(
    Stream<MeetingmainpageEvent> events,
    TransitionFunction<MeetingmainpageEvent, MeetingmainpageState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<MeetingmainpageState> mapEventToState(
      MeetingmainpageEvent event) async* {

    if(event is OpeneventpageOnMeetingmainpageEvent) {

      final String title='Jadwal Kegiatan';
      //final String actor_fullname = this.currrentActor.actor_fullname;
      //final String actor_username=this.currrentActor.actor_username;
      //final Organization currentOrganization =Organization(organization_id: 'satker1', organization_name: 'Satker 1');


     yield DisplayeventpageOnMeetingmainpageState(title: title, actor: currrentActor, meetingList: <Meeting>[], organizationMember: <Actor>[]);
    }
    else  if(event is OpenactorinfopageOnMeetingmainpageEvent){


      yield DisplayactorinfopageOnMeetingmainpageState(actor: currrentActor);
    }

  }
}
