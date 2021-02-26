import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcDateField extends StatelessWidget {
  PcDateField(
      {@required this.value,
      @required this.fieldName,
      @required this.caption,
      @required this.pcCallbackDateField,
      this.width: 100,
      this.height: 40,
      this.borderWidth: 1,
      this.useBorder: true,
      this.fontSize: 18});

  final DateTime value;
  final String fieldName;
  final String caption;
  final PcCallbackDateField pcCallbackDateField;
  final double width;
  final double height;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration();

    if (this.useBorder == true) {
      borderBoxDecoration = BoxDecoration(
        border: Border.all(width: this.borderWidth, color: Colors.black),
        color: HexColor("#d1ebf0"),
      );
    }

    final DateFormat formatterDateTimeID = DateFormat('yyyy-MM-dd');

    TextEditingController myController = TextEditingController()
      ..text = formatterDateTimeID.format(this.value);

    Widget lReturnValue = Container(
        decoration: borderBoxDecoration,
        padding: EdgeInsets.all(4),
        width: this.width,
        height: this.height,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            labelText: this.caption,
            border: InputBorder.none,
            focusColor: Colors.orange,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            isDense: true,
          ),
          controller: myController,
          readOnly: true,

          onTap: () async {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime.now().subtract(Duration(days: 3650 * 10)),
                maxTime: DateTime.now(),
                theme: DatePickerTheme(
                    headerColor: Colors.lightBlue,
                    backgroundColor: Colors.grey,
                    itemStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            }, onConfirm: (date) {
              print('confirm $date');
              //this.pcProperties.examDateTime=date;
              this.pcCallbackDateField(this.fieldName, date);
            }, currentTime: this.value, locale: LocaleType.en);
          },
          //decoration: InputDecoration(labelText: this.caption, ),
        ));

    return lReturnValue;
  }
}
