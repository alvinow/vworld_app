import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/util/afformdemo.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/documentdocstreamstore/documentdocstreamstore.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/cryptoutil/cryptoutil.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/library/meetingstore/meetingstore.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';
import 'dart:convert';

class MeetingmainpageBloc
    extends Bloc<MeetingmainpageEvent, MeetingmainpageState> {
  MeetingmainpageBloc(this.currentActor,this.loginResponse)
      : super(UninitializedOnMeetingainpageState());

  final Actor currentActor;
  LoginResponse loginResponse;

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

   final MeetingmainpageState currentState=this.state;

   if(event is OpenAfformPageOnMeetingmainpageEvent){




     yield DisplayAfformOnMeetingmainpageState(AfFormDemo.getNewMeetingForm());



   }

   else if(event is SavemeetingeventpageOnMeetingmainpageEvent)
     {
       String encodedJson= json.encode( event.meetingAfForm.toJson()) ;


      Document newMeetingDocument=Document(id: event.meetingAfForm.afRecordId , refId: event.meetingAfForm.afFormId , refIdMd5: CryptoUtil.getMd5(event.meetingAfForm.afFormId), created: DateTime.now().toString(), documentstatusId: "1", documenttypeId: Document.meetingDocumenttypeId, json: encodedJson, ownerUserloginId: currentActor.actor_id, jsonHashBycreator: CryptoUtil.getMd5(encodedJson), ownerGroupId: '0', lastupdate: DateTime.now().toString(), isLocalClientOnly: 0,creatorLoginsessionId: this.loginResponse.loginsessionId, );

      final int returnValue= await DocumentDocStreamStore.syncDocument(newMeetingDocument);

      yield currentState;



     }

    else if (event is OpeneventpageOnMeetingmainpageEvent) {
      final String title = 'Jadwal Kegiatan';

      List<Meeting> meetingList = <Meeting>[];

      List<Actor> comitte = <Actor>[];

      List<Actor> participants = <Actor>[];


      List<Document> meetingDocuments=await MeetingStore.getMeetingsByActor(this.currentActor);




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
          actor: currentActor,
          meetingList: meetingList,
          organizationMember: <Actor>[]);
    } else if (event is OpenactorinfopageOnMeetingmainpageEvent) {
      yield DisplayactorinfopageOnMeetingmainpageState(actor: currentActor);
    }
  }
}
