import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcDateField extends StatelessWidget{

  PcDateField({
    @required this.value,
    @required this.fieldName,
    @required this.caption,
   @required this.pcCallbackDateField
});

  final DateTime value;
  final String fieldName;
  final String caption;
  final PcCallbackDateField pcCallbackDateField;


  @override
  Widget build(BuildContext context){

    final DateFormat formatterDateTimeID = DateFormat('yyyy-MM-dd');

    TextEditingController myController = TextEditingController()..text = formatterDateTimeID.format(this.value);

    Widget lReturnValue=Card(child:TextField(
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
              //this.pcProperties.examDateTime=date;
              this.pcCallbackDateField(this.fieldName,date);
            }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      decoration: InputDecoration(labelText: this.caption),


    ));

    return lReturnValue;

  }

}