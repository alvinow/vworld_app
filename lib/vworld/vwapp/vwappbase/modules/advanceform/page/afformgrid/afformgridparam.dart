import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';

class AfFormGridParam {
  AfFormGridParam(
      {@required this.records, @required this.hasReachedMax: false});

  final List<AfFieldValueRecord> records;
  final bool hasReachedMax;
}
