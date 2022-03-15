import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/util/afformdemo.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/page/meetingpagedetail/meetingpagedetail.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';

class LibMeetingPageDetail {
  static void openMeetingPageDetail(BuildContext context, Actor currrentActor,
      LoginResponse loginResponse, AfFieldValueRecord? fieldValueRecord,
      {OnSaveValidRecordMeetingPageDetail? onSaveValidRecordMeetingPageDetail,
      OnSaveInvalidRecordMeetingPageDetail?
          onSaveInvalidRecordMeetingPageDetail}) {
    AfForm meetingForm = AfFormDemo.getAfFormById('meeting_af_form_id');

    meetingForm.setRecord(fieldValueRecord);

    AfFormPage afFormPage = AfFormPage(
      initialState: meetingForm,
      formCollection: <AfForm>[],
      isReadOnly: true,
    );

    Widget newMeetingPage = MeetingPageDetail(
      afFormPage: afFormPage,
      onSaveInvalidRecordMeetingPageDetail:
          onSaveInvalidRecordMeetingPageDetail,
      onSaveValidRecordMeetingPageDetail: onSaveValidRecordMeetingPageDetail,
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => newMeetingPage));
  }

  static void openNewMeetingPageDetail(
      BuildContext context, Actor currrentActor, LoginResponse loginResponse,
      {OnSaveValidRecordMeetingPageDetail? onSaveValidRecordMeetingPageDetail,
      OnSaveInvalidRecordMeetingPageDetail?
          onSaveInvalidRecordMeetingPageDetail}) {
    AfForm meetingForm = AfFormDemo.getAfFormById('meeting_af_form_id');

    AfFieldValue field1 = AfFieldValue(
        fieldName: 'meeting_id',
        stringValue: Uuid().v4(),
        valueAfDataType: 'String',
        creatorActorId: currrentActor.actor_id,
        lastUpdaterActorId: currrentActor.actor_id);

    AfFieldValueRecord fieldValueRecord = AfFieldValueRecord(
        afFormId: 'meeting_af_form_id',
        afRecordId: Uuid().v4(),
        fields: <AfFieldValue>[field1]);

    meetingForm.setRecord(fieldValueRecord);

    AfFormPage afFormPage = AfFormPage(
      initialState: meetingForm,
      formCollection: <AfForm>[],
    );

    Widget newMeetingPage = MeetingPageDetail(
      afFormPage: afFormPage,
      onSaveInvalidRecordMeetingPageDetail:
          onSaveInvalidRecordMeetingPageDetail,
      onSaveValidRecordMeetingPageDetail: onSaveValidRecordMeetingPageDetail,
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => newMeetingPage));
  }
}
