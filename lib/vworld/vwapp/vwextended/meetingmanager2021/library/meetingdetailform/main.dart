import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingdetailform/meetingdetailform.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';


class MeetingDetailForm extends StatelessWidget {

  MeetingDetailForm(this.initialState);

  final Meeting initialState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Kegiatan"),
      ),
      body: MeetingDetailSubmitForm(this.initialState)
    );
  }
}