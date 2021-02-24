import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcdatefield.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcjaw.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcstringfield.dart';



class PcExamForm extends StatelessWidget {
  PcExamForm(this.pcProperties,this.pcPropertiesOnChangedCallback);

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;


  void callbackStringField(String fieldName, String value){
    if(fieldName==PcProperties.patientNameCCFN)
    {
      this.pcProperties.patientName=value;
    }
    this.pcPropertiesOnChangedCallback (false);

  }

  void callbackDateField(String fieldName, DateTime value){

  if(fieldName==PcProperties.examDateTimeCCFN)
    {
      this.pcProperties.examDateTime=value;
    }

  this.pcPropertiesOnChangedCallback ( true);
  }

  @override
  Widget build(BuildContext context) {



   //String examDateString=formatterDateTimeID.format(pcProperties.examDateTime);
   //print("Exam Date Initial Value = $examDateString");

    //TextEditingController myController = TextEditingController()..text = examDateString;


    return Container(
        color: Colors.white,
        width: 900,
        height: 1450,
        padding: const EdgeInsets.fromLTRB(50, 30, 30, 50),

        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          'PERIODONTAL CHART',
          style:
              TextStyle(fontSize: 40, color: Colors.black, fontFamily: 'arial'),
          textAlign: TextAlign.left,
        ),
        PcDateField(value: pcProperties.examDateTime, fieldName: PcProperties.examDateTimeCCFN, caption: 'Date',pcCallbackDateField: this.callbackDateField,), /*TextField(
              controller: myController,
              readOnly: true,

          onTap: () async {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime.now().subtract(Duration(days: 3650)),
                maxTime: DateTime.now(),
                theme: DatePickerTheme(
                    headerColor: Colors.orange,
                    backgroundColor: Colors.blue,
                    itemStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                onChanged: (date) {


              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            },

                onConfirm: (date) {

              print('confirm $date');
              this.pcProperties.examDateTime=date;
              this.pcPropertiesCallback(this.pcProperties);
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          decoration: InputDecoration(labelText: 'Date'),


        )*/
        SizedBox(width: 20,height: 5,),
        PcStringField(value: pcProperties.patientName, fieldName: PcProperties.patientNameCCFN, width: 100,height: 25, caption: 'Patient Name',pcCallbackStringFieldField: this.callbackStringField,),
        SizedBox(width: 20,height: 5,),
        PcStringField(value: pcProperties.patientDob, fieldName: PcProperties.patientDobCCFN, width: 100,height: 25, caption: 'Date of Birth',pcCallbackStringFieldField: this.callbackStringField,),

        SizedBox(width: 20,height: 5,),
        PcStringField(value: pcProperties.operatorName, fieldName: PcProperties.operatorNameCCFN, width: 100,height: 25, caption: 'Clinician',pcCallbackStringFieldField: this.callbackStringField,),

        SizedBox(width: 20,height: 20,),
        PcJaw(this.pcProperties,this.pcPropertiesOnChangedCallback)
      ],
    ));
  }
}

