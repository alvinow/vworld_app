import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';

class AfFormGridRow extends StatelessWidget {
  AfFormGridRow(this.afFieldValueRecord);

  AfFieldValueRecord afFieldValueRecord;



  @override
  Widget build(BuildContext context) {
    return Text(afFieldValueRecord.getAfFieldValue('meeting_name').stringValue);
  }
}
