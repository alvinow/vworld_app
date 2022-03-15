import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/page/meetingpagedetail/libmeetingpagedetail.dart';

class AfFormGridRow extends StatelessWidget {
  AfFormGridRow(this.afFieldValueRecord, this.afFormGridParam);

  AfFieldValueRecord? afFieldValueRecord;
  AfFormGridParam? afFormGridParam;

  @override
  Widget build(BuildContext context) {
    String? meetingName = '';

    try {
      meetingName =
          afFieldValueRecord!.getAfFieldValue('meeting_name')!.stringValue;
    } catch (error) {}

    return InkResponse(
        onTap: () {
          print(afFieldValueRecord!.afRecordId.toString() + ' is Tapped');

          LibMeetingPageDetail.openMeetingPageDetail(
              context,
              this.afFormGridParam!.currrentActor,
              this.afFormGridParam!.loginResponse,
              this.afFieldValueRecord);
        },
        child: Container(
            height: 100,
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(meetingName!)));
  }
}
