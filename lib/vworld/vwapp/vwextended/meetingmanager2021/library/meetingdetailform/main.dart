import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingdetailform/meetingdetailform.dart';


class MeetingDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Kegiatan"),
      ),
      body: MeetingDetailSubmitForm()
    );
  }
}