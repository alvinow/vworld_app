import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';

class AfFormGridRow extends StatelessWidget {
  AfFormGridRow(this.afFieldValueRecord);

  AfFieldValueRecord afFieldValueRecord;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: () {
          print(afFieldValueRecord.afRecordId.toString() + ' is Tapped');
        },
        child: Container(
          height: 100,
            padding: EdgeInsets.all(12.0),
            margin:   EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(afFieldValueRecord
                .getAfFieldValue('meeting_name')
                .stringValue)));
  }
}
