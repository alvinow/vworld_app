import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

typedef OnSaveValidRecordMeetingPageDetail = void Function(AfForm);
typedef OnSaveInvalidRecordMeetingPageDetail = void Function(AfForm);

class MeetingPageDetail extends StatelessWidget {
  MeetingPageDetail(
      {@required this.afFormPage,
      this.onSaveInvalidRecordMeetingPageDetail,
      this.onSaveValidRecordMeetingPageDetail});

  AfFormPage afFormPage;

  OnSaveValidRecordMeetingPageDetail onSaveValidRecordMeetingPageDetail;
  OnSaveInvalidRecordMeetingPageDetail onSaveInvalidRecordMeetingPageDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Kegiatan"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {
                if (afFormPage.getCurrentState().isRecordValid()) {
                  if (this.onSaveValidRecordMeetingPageDetail != null) {
                    onSaveValidRecordMeetingPageDetail(
                        this.afFormPage.getCurrentState());
                  }
                  print('Record Valid');
                  Navigator.pop(context);
                } else {
                  if (this.onSaveInvalidRecordMeetingPageDetail != null) {
                    this.onSaveInvalidRecordMeetingPageDetail(
                        this.afFormPage.getCurrentState());
                  } /*else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                        content: Text('Record is not valid')));
                    print('Record Not Valid');
                  }*/
                }
              },
            )
          ],
        ),
        body: afFormPage);
  }
}
