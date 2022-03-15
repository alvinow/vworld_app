import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/library/editorform/editorform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/library/editorform/style1/recordpagedetailstyle1.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/util/afformdemo.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';

class LibEditorFormStyle1 {


  static void createNewRecord(String formId, BuildContext context,
      Actor currrentActor, LoginResponse loginResponse,
      {OnSaveValidRecordEditorForm? onSaveValidRecordEditorForm,
      OnSaveInvalidRecordEditorForm? onSaveInvalidRecordEditorForm}) {
    try {
      AfForm meetingForm = AfFormDemo.getAfFormById(formId);

      final String recordId = Uuid().v4();

      AfFieldValue field1 = AfFieldValue(
          fieldName: 'record_id',
          stringValue: recordId,
          valueAfDataType: 'String',
          creatorActorId: currrentActor.actor_id,
          lastUpdaterActorId: currrentActor.actor_id);

      AfFieldValueRecord fieldValueRecord = AfFieldValueRecord(
          afFormId: formId,
          afRecordId: recordId,
          fields: <AfFieldValue>[field1]);

      meetingForm.setRecord(fieldValueRecord);

      AfFormPage afFormPage = AfFormPage(
        initialState: meetingForm,
        formCollection: <AfForm>[],
      );

      Widget recordPage = RecordPageDetailStyle1(
        afFormPage: afFormPage,
        onSaveValidRecordEditorForm: onSaveValidRecordEditorForm,
        onSaveInvalidRecordEditorForm: onSaveInvalidRecordEditorForm,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => recordPage));
    } catch (error) {
      print(
          "Error On LibEditorFormStyle1.createNewRecord: " + error.toString());
    }
  }

  static void editRecord() {}
}
