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
      this.fontSize: 18,
      this.requestParetSetStateOnChanged:false
      });

  final DateTime value;
  final String fieldName;
  final String caption;
  final PcCallbackDateField pcCallbackDateField;
  final double width;
  final double height;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final bool requestParetSetStateOnChanged;

  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration();

    if (this.useBorder == true) {
      borderBoxDecoration = BoxDecoration(
        border: Border.all(width: this.borderWidth, color: Colors.black),
        color: Hexcolor("#d1ebf0"),
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
                    backgroundColor: Colors.white70,
                    itemStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                    doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                onConfirm: (date) {
                  myController.text=formatterDateTimeID.format(date);
              this.pcCallbackDateField(this.fieldName, date, this.requestParetSetStateOnChanged);
            }, currentTime: this.value, locale: LocaleType.en);
          },
        ));

    return lReturnValue;
  }
}
