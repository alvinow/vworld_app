import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';

class AfDateField extends StatelessWidget {
  AfDateField({
    @required this.valueProp,
    @required this.fieldValue,
    this.height: 18,
    this.width: 42,
    @required this.afCallbackDateFieldField,
    this.borderWidth: 1,
    this.useBorder: false,
    this.fontSize: 18,
    this.backgroundColorHex: "#ebf1f2",
    this.isValueValid: false,
    this.isNotNull: false,
  });

  final AfValueProp valueProp;
  final AfFieldValue fieldValue;
  final String backgroundColorHex;
  //final String value;
  //final String fieldName;
  //final String caption;
  final double width;
  final double height;
  final AfCallbackDateField afCallbackDateFieldField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final bool isValueValid;
  final bool isNotNull;

  @override
  Widget build(BuildContext context) {
    String dateInitialValue = this.fieldValue.dateTimeValue == null
        ? null
        : DateUtil1.get24hDateFormat().format(this.fieldValue.dateTimeValue);

    //String dateInitialValue=this.fieldValue.value==null? null : this.fieldValue.value.toString() ;

    TextEditingController myController = TextEditingController()
      ..text = dateInitialValue;

    Widget returnValue = Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          controller: myController,
          maxLines: 1,
          readOnly: true,
          onTap: () {
            DatePicker.showDateTimePicker(context,
                showTitleActions: true,
                minTime: DateTime.now().subtract(Duration(days: 36500)),
                maxTime: DateTime.now().subtract(Duration(days: 36500)),
                onChanged: (date) {
              print('change $date');
            }, onConfirm: (date) {
              if (this.afCallbackDateFieldField != null) {
                this.afCallbackDateFieldField(
                    this.fieldValue.fieldName, date, true);
              }

              print('confirm $date');
            },
                currentTime: this.fieldValue.dateTimeValue == null
                    ? DateTime.now()
                    : this.fieldValue.dateTimeValue,
                locale: LocaleType.id);
          },
          onChanged: (value) {
            //this.afCallbackStringField(this.fieldValue.fieldName, value, true);
          },
          style: TextStyle(fontSize: this.fontSize),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: this.isValueValid? Colors.black: Colors.red),
            border: UnderlineInputBorder(),
            contentPadding: EdgeInsets.all(0),
            labelText: this.fieldValue.fieldCaption,
            focusColor: Colors.orange,
            isDense: true,
          ),
        ));

    return returnValue;
  }
}
