import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/document.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/primary/documentsearchparambyfields.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/documentdocstreamstore/documentdocstreamstore.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';

class MeetingStore {
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

    returnValue= await DocumentDocStreamStore.getDocumentsBySearchParamByField(
        documentSearchParamByFields);

    return returnValue;
  }
}
