import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcexamform.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:hive/hive.dart';


typedef PcPropertiesLoadFromBox = Future<void> Function(String);
typedef PcPropertiesSaveToBox = Future<void> Function(String);
typedef PcPropertiesOnChangedCallback = void Function(bool);
typedef PcCallbackDateField = void Function(String, DateTime, bool);
typedef PcCallbackStringField = void Function(String, String, bool);
typedef PcCallbackIntegerField = void Function(String, int?, bool);

class Periochart extends StatefulWidget {
  Periochart(this.pcProperties);
  final PcProperties pcProperties;
  _PeriochartState createState() => _PeriochartState();

  static PcProperties getBlankPcPropertiesId() {
    String date = '19800101T000000';
    DateTime dateTime = DateTime.parse(date);

    List<PcSingleTeethProperties> teeths = <PcSingleTeethProperties>[];

    return PcProperties(
        id: Uuid().v4().toString(),
        patientName: "John Doe",
        patientDob: dateTime,
        operatorName: 'Dr. D',
        examDateTime: DateTime.now(),
        examTypeId: "InitialExam",
        teeths: teeths);
  }
}

class _PeriochartState extends State<Periochart> {
  PcProperties? currentState;
  String? currentLoaderPcPropertiesId;

  @override
  void initState() {
    super.initState();
    this.currentState = Periochart.getBlankPcPropertiesId();
    currentLoaderPcPropertiesId = this.widget.pcProperties.id;
    currentState = this.widget.pcProperties;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
            constrained: false,
            scaleEnabled: true,
            panEnabled: true, // Set it to false to prevent panning.

            minScale: 0.1,
            maxScale: 2,
            child: PcExamForm(
              this.currentState,
              this.implementPcPropertiesOnChangedCallback,
              pcPropertiesLoadFromBox: this.implememtPcPropertiesLoadFromBox,
              pcPropertiesSaveToBox: this.implementPcPropertiesSaveToBox,
            )));
  }

  Future<void> implememtPcPropertiesLoadFromBox(String pcPropertiesId) async {
    var box = await Hive.openBox('PcProperties');

    PcProperties? pcProperties = await box.get(pcPropertiesId);

    if (pcProperties != null) {
      this.currentState = pcProperties;

      setState(() {});
    }

    await box.close();
  }

  Future<void> implementPcPropertiesSaveToBox(String pcPropertiesId) async {
    var box = await Hive.openBox('PcProperties');

    await box.put(pcPropertiesId, this.currentState);

    this.currentLoaderPcPropertiesId = pcPropertiesId;

    await box.close();
  }

  void implementPcPropertiesOnChangedCallback(bool doSetState) {
    if (doSetState) {
      setState(() {});
    }
  }
}
