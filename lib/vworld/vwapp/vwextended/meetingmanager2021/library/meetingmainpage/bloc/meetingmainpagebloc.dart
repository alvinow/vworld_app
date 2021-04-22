import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';

class MeetingmainpageBloc
    extends Bloc<MeetingmainpageEvent, MeetingmainpageState> {
  MeetingmainpageBloc(this.currrentActor)
      : super(UninitializedOnMeetingainpageState());

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
    if (event is OpeneventpageOnMeetingmainpageEvent) {
      final String title = 'Jadwal Kegiatan';

      List<Meeting> meetingList = <Meeting>[];

      List<Actor> comitte = <Actor>[];

      List<Actor> participants = <Actor>[];

      Meeting meeting1 = Meeting(
          meeting_id: '521516c6-a25e-11eb-90a3-60f81dc538c2',
          meeting_meetingtype_id: 'onlinemeeting',
          meeting_meetingstatus_id: '2',
          meeting_name:
              'Penyusunan Laporan Keuangan Tahun Anggaran 2021 Triwulan I',
          meeting_start_datetime: DateUtil1.convertDateFromString('2021-03-01 08:00:00'),
          meeting_end_datetime: DateUtil1.convertDateFromString('2021-03-03 21:00:00'),
          meeting_owner_actor_id: 'zuser1',
          comitte: comitte,
          participants: participants);

      Meeting meeting2 = Meeting(
          meeting_id: '0214e89e-a25f-11eb-90a3-60f81dc538c2',
          meeting_meetingtype_id: 'onlinemeeting',
          meeting_meetingstatus_id: '2',
          meeting_name:
              'Bimtek Operator SAS Satker LPMP dan BP PAUD Tahun Anggran 2021 Triwulan I',
          meeting_start_datetime: DateUtil1.convertDateFromString('2021-04-01 08:00:00'),
          meeting_end_datetime: DateUtil1.convertDateFromString('2021-04-03 21:00:00'),
          meeting_owner_actor_id: 'zuser1',
          comitte: comitte,
          participants: participants);

      meetingList.add(meeting1);
      meetingList.add(meeting2);

      yield DisplayeventpageOnMeetingmainpageState(
          title: title,
          actor: currrentActor,
          meetingList: meetingList,
          organizationMember: <Actor>[]);
    } else if (event is OpenactorinfopageOnMeetingmainpageEvent) {
      yield DisplayactorinfopageOnMeetingmainpageState(actor: currrentActor);
    }
  }
}
