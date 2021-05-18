import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';

class AfFormGridParam {
  AfFormGridParam(
      this.currrentActor,
      this.loginResponse,
      {@required this.records,

      @required this.hasReachedMax: false});

  final List<AfFieldValueRecord> records;
  final bool hasReachedMax;
  final Actor currrentActor;
  final LoginResponse loginResponse;
}
