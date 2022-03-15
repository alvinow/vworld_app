import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

typedef OnSaveValidRecordMeetingPageDetail = void Function(
    AfForm?, BuildContext);
typedef OnSaveInvalidRecordMeetingPageDetail = void Function(
    AfForm?, BuildContext);

class MeetingPageDetail extends StatelessWidget {
  MeetingPageDetail(
      {required this.afFormPage,
      this.onSaveInvalidRecordMeetingPageDetail,
      this.onSaveValidRecordMeetingPageDetail});

  AfFormPage afFormPage;

  OnSaveValidRecordMeetingPageDetail? onSaveValidRecordMeetingPageDetail;
  OnSaveInvalidRecordMeetingPageDetail? onSaveInvalidRecordMeetingPageDetail;

  @override
  Widget build(BuildContext context) {
    Widget saveButton=            IconButton(
      icon: Icon(
        Icons.save,
        color: Colors.white,
      ),
      onPressed: () {
        if (afFormPage.getCurrentState()!.isRecordValid()) {
          if (this.onSaveValidRecordMeetingPageDetail != null) {
            onSaveValidRecordMeetingPageDetail!(
                this.afFormPage.getCurrentState(), context);
          }
        } else {
          if (this.onSaveInvalidRecordMeetingPageDetail != null) {
            this.onSaveInvalidRecordMeetingPageDetail!(
                this.afFormPage.getCurrentState(), context);
          }
        }
      },
    );

    if(this.afFormPage.isReadOnly==true)
      {
        saveButton=Container();
      }

    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Kegiatan"),
          actions: [
            saveButton
          ],
        ),
        body: afFormPage);
  }
}
