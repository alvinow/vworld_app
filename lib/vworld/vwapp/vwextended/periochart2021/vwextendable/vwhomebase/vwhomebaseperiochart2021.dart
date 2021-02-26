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

    String date = '19800101T170555';
    //String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime dateTime = DateTime.parse(date);

    PcProperties pcProperties = PcProperties(
        id: Uuid().v4().toString(),
        patientName: "John Doe",
        patientDob: dateTime,
        operatorName: 'Dr. D',
        examDateTime: DateTime.now(),
        examTypeId: "InitialExam",
        teeths: teeths);

    return MaterialApp(
      color: Colors.grey,

      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(

          child: InteractiveViewer(

            boundaryMargin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
            constrained: false,
            scaleEnabled: true,

            panEnabled: true, // Set it to false to prevent panning.

            minScale: 0.1,
            maxScale: 2,

            child: Periochart(
              initialState: pcProperties,
            ),
          ),
        ),
      ),
    );
  }
}
