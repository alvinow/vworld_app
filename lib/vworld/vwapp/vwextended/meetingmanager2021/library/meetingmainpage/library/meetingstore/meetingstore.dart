import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/documentsearchparambyfields.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/documentdocstreamstore/documentdocstreamstore.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';

class MeetingStore {
  static Meeting convertFromAfForm(AfForm afForm) {
    Meeting returnValue;

    try {
      AfFieldValueRecord afFieldValueRecord = afForm.getRecord();

      String meeting_id =
          afFieldValueRecord.getAfFieldValue('meeting_id').stringValue;

      String meeting_meetingtype_id =
          afFieldValueRecord.getAfFieldValue('meeting_meetingtype_id').stringValue;

      String meeting_meetingstatus_id =
          afFieldValueRecord.getAfFieldValue('meeting_meetingstatus_id').stringValue;

      String meeting_name =
          afFieldValueRecord.getAfFieldValue('meeting_name').stringValue;

      DateTime meeting_start_datetime =
          afFieldValueRecord.getAfFieldValue('meeting_start_datetime').dateTimeValue;

      DateTime meeting_end_datetime =
          afFieldValueRecord.getAfFieldValue('meeting_end_datetime').dateTimeValue;

      String meeting_owner_actor_id =
          afFieldValueRecord.getAfFieldValue('meeting_owner_actor_id').stringValue;

      List<Actor> comitte=<Actor>[];

      List<Actor> participants=<Actor>[];

      returnValue = Meeting(
          meeting_id: meeting_id,
          meeting_meetingtype_id: meeting_meetingtype_id,
          meeting_meetingstatus_id: meeting_meetingstatus_id,
          meeting_name: meeting_name,
          meeting_start_datetime: meeting_start_datetime,
          meeting_end_datetime: meeting_end_datetime,
          meeting_owner_actor_id: meeting_owner_actor_id,
          comitte: comitte,
          participants: participants);
    } catch (error) {}

    return returnValue;
  }

  static Future<List<Document>> getMeetingsByActor(Actor currentActor) async {
    List<Document> returnValue;

    DocumentSearchField searchField1 = DocumentSearchField(
        isActive: true,
        isHidden: true,
        displayCaption: 'Meeting Owner',
        fieldName: Document.ownerUserloginId_CCFN,
        queryValue: currentActor.actor_id,
        equalityOperator: '=');

    DocumentSearchField searchField2 = DocumentSearchField(
        isActive: true,
        isHidden: true,
        displayCaption: 'Meeting Documenttype ID',
        fieldName: Document.documenttypeId_CCFN,
        queryValue: Document.meetingDocumenttypeId,
        equalityOperator: '=');

    List<DocumentSearchField> requiredSearchFieldList = <DocumentSearchField>[];

    requiredSearchFieldList.add(searchField1);
    requiredSearchFieldList.add(searchField2);

    DocumentSearchParamByFields documentSearchParamByFields =
        DocumentSearchParamByFields(
            title: 'Meeting List',
            requiredSearchFieldList: requiredSearchFieldList);

    returnValue = await DocumentDocStreamStore.getDocumentsBySearchParamByField(
        documentSearchParamByFields);

    return returnValue;
  }
}
