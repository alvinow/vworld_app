import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcdatefield.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcjaw.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcstringfield.dart';


class PcExamForm extends StatelessWidget {
  PcExamForm(this.pcProperties, this.pcPropertiesOnChangedCallback,
      {this.pcPropertiesLoadFromBox, this.pcPropertiesSaveToBox});

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;

  final PcPropertiesLoadFromBox pcPropertiesLoadFromBox;

  final PcPropertiesSaveToBox pcPropertiesSaveToBox;

  void callbackStringField(String fieldName, String value, bool doSetState) {
    if (fieldName == PcProperties.patientNameCCFN) {
      this.pcProperties.patientName = value;
    }

    if (fieldName == PcProperties.operatorNameCCFN) {
      this.pcProperties.operatorName = value;
    }

    this.pcPropertiesOnChangedCallback(false);
  }

  void callbackDateField(String fieldName, DateTime value, bool doSetState) {
    if (fieldName == PcProperties.examDateTimeCCFN) {
      this.pcProperties.examDateTime = value;
    }

    if (fieldName == PcProperties.patientDobCCFN) {
      this.pcProperties.patientDob = value;
    }

    this.pcPropertiesOnChangedCallback(doSetState);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 900,
        height: 1450,
        padding: const EdgeInsets.fromLTRB(50, 30, 30, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 200,
              child: IconButton(
                icon: Icon(Icons.arrow_circle_up),
                onPressed: () async {
                  await this.pcPropertiesLoadFromBox('file1');
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {
                  await this.pcPropertiesSaveToBox('file1');
                },
              ),
            ),
            Row(children: [
              Text(
                'PERIODONTAL CHART',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'arial'),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
                width: 30,
              ),
              PcDateField(
                value: pcProperties.examDateTime,
                fieldName: PcProperties.examDateTimeCCFN,
                caption: 'Exam Date',
                pcCallbackDateField: this.callbackDateField,
              )
            ]),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(children: [
              PcStringField(
                fontSize: 18,
                useBorder: true,
                backgroundColorHex: "#d1ebf0",
                value: pcProperties.patientName,
                fieldName: PcProperties.patientNameCCFN,
                width: 300,
                height: 50,
                caption: 'Patient Name',
                pcCallbackStringFieldField: this.callbackStringField,
              ),
              SizedBox(
                width: 20,
                height: 5,
              ),
              PcDateField(
                value: pcProperties.patientDob,
                fieldName: PcProperties.patientDobCCFN,
                caption: 'Date of Birth',
                pcCallbackDateField: this.callbackDateField,
                height: 50,
              )
            ]),
            SizedBox(
              width: 20,
              height: 5,
            ),
            SizedBox(
              width: 20,
              height: 5,
            ),
            PcStringField(
              fontSize: 18,
              useBorder: true,
              backgroundColorHex: "#d1ebf0",
              value: pcProperties.operatorName,
              fieldName: PcProperties.operatorNameCCFN,
              width: 100,
              height: 50,
              caption: 'Clinician',
              pcCallbackStringFieldField: this.callbackStringField,
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            PcJaw(this.pcProperties, this.pcPropertiesOnChangedCallback)
          ],
        ));
  }
}
