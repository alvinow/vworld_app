import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';
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
  MeetingmainpageBloc(this.currentActor, this.loginResponse)
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
    final MeetingmainpageState currentState = this.state;

    if (event is OpenAfformPageOnMeetingmainpageEvent) {
      yield DisplayAfformOnMeetingmainpageState(AfFormDemo.getNewMeetingForm());
    } else if (event is SavemeetingeventpageOnMeetingmainpageEvent) {
      String encodedJson = json.encode(event.meetingAfForm.toJson());

      Document newMeetingDocument = Document(
        id: event.meetingAfForm.afRecordId,
        refId: event.meetingAfForm.afFormId,
        refIdMd5: CryptoUtil.getMd5(event.meetingAfForm.afFormId),
        created: DateTime.now().toString(),
        documentstatusId: "1",
        documenttypeId: Document.meetingDocumenttypeId,
        json: encodedJson,
        ownerUserloginId: currentActor.actor_id,
        jsonHashBycreator: CryptoUtil.getMd5(encodedJson),
        ownerGroupId: '0',
        lastupdate: DateTime.now().toString(),
        isLocalClientOnly: 0,
        creatorLoginsessionId: this.loginResponse.loginsessionId,
      );

      final int returnValue =
          await DocumentDocStreamStore.syncDocument(newMeetingDocument);

      yield currentState;
    } else if (event is OpeneventpageOnMeetingmainpageEvent) {
      final String title = 'Jadwal Kegiatan';

      List<Meeting> meetingList = <Meeting>[];

      List<Actor> comitte = <Actor>[];

      List<Actor> participants = <Actor>[];

      AfFormGridParam afFormGridParam = AfFormGridParam(
          this.currentActor, this.loginResponse,
          records: <AfFieldValueRecord>[], hasReachedMax: true);

      List<Document> meetingDocuments =
          await MeetingStore.getMeetingsByActor(this.currentActor);

      for (int la = 0; la < meetingDocuments.length; la++) {
        Document currentDocument = meetingDocuments.elementAt(la);

        AfForm currentAfForm =
            AfForm.fromJson(json.decode(currentDocument.json));

        Meeting currentMeeting = MeetingStore.convertFromAfForm(currentAfForm);

        meetingList.add(currentMeeting);

        afFormGridParam.records.add(currentAfForm.getRecord());
      }

      yield DisplayeventpageOnMeetingmainpageState(
          title: title,
          actor: currentActor,
          meetingList: meetingList,
          organizationMember: <Actor>[],
          afFormGridParam: afFormGridParam);
    } else if (event is OpenactorinfopageOnMeetingmainpageEvent) {
      yield DisplayactorinfopageOnMeetingmainpageState(actor: currentActor);
    }
  }
}
