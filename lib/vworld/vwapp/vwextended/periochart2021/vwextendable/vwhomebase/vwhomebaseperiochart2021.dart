import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwextendable/vwhomebase/vwhomebase.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwaccounting/vwaccounting.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/vwaaa/vwauthentication/vwauthentication.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwcore/vwauthorization/vwauthorization.dart';

class VwHomeBasePeriochart2021 extends VwHomeBase {
  VwHomeBasePeriochart2021(VwAuthentication vwAuthentication,
      VwAuthorization vwAuthorization, VwAccounting vwAccounting)
      : super(vwAuthentication, vwAuthorization, vwAccounting);

  @override
  Widget build(BuildContext context) {
    List<PcSingleTeethProperties> teeths = List<PcSingleTeethProperties>();

    PcProperties pcProperties = PcProperties(
        id: Uuid().v4().toString(),
        patientName: "John Doe",
        patientDob: '1980-01-01',
        operatorName: 'Dr. D',
        examDateTime: DateTime.now(),
        examTypeId: "InitialExam",
        teeths: teeths);

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Periochart(
            initialState: pcProperties,
          ),
        ),
      ),
    );
  }
}
