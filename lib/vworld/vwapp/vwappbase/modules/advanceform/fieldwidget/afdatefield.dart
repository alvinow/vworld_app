import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';

class AfDateField extends StatelessWidget {
  AfDateField({
    required this.valueProp,
    required this.fieldValue,
    this.height: 18,
    this.width: 42,
    required this.afCallbackField,
    this.borderWidth: 1,
    this.useBorder: false,
    this.fontSize: 18,
    this.backgroundColorHex: "#ebf1f2",
    this.isValueValid: false,
    this.isNotNull: false,
    this.isReadOnly:false
  });

  final AfValueProp? valueProp;
  final AfFieldValue? fieldValue;
  final String backgroundColorHex;
  final double width;
  final double height;
  final AfCallbackField? afCallbackField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final bool isValueValid;
  final bool? isNotNull;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    String? dateTimeInitialValue = this.fieldValue!.dateTimeValue == null
        ? null
        : DateUtil1.getDate24hTimeFormat()
            .format(this.fieldValue!.dateTimeValue!);

    //String dateInitialValue=this.fieldValue.value==null? null : this.fieldValue.value.toString() ;

    TextEditingController dateTimeController = TextEditingController()
      ..text = dateTimeInitialValue.toString();

    Widget dateTimeField = TextFormField(
      controller: dateTimeController,
      maxLines: 1,
      readOnly: true,
      onTap: ()
    {
      if (!(this.isReadOnly || this.valueProp!.isGuiReadOnly!))
        {


        DatePicker.showDateTimePicker(context, showTitleActions: true,
            onChanged: (date) {
              print('change $date');
            },
            onConfirm: (date) {
              print("TimePickerRsult=" + date.toString());

              if (this.afCallbackField != null) {
                this.afCallbackField!(
                    AfFieldValue(
                        fieldName: this.fieldValue!.fieldName,
                        dateTimeValue: date),
                    true);
              }

              print('confirm $date');
            },
            currentTime: this.fieldValue!.dateTimeValue == null
                ? DateTime.now()
                : this.fieldValue!.dateTimeValue,
            locale: LocaleType.id);
    }
      },
      style: TextStyle(fontSize: this.fontSize),
      decoration: InputDecoration(
        labelStyle:
            TextStyle(color: this.isValueValid ? Colors.black : Colors.red),
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.all(0),
        labelText: this.fieldValue!.fieldCaption,
        focusColor: Colors.orange,
        isDense: true,
      ),
    );

    Widget returnValue = Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5), child: dateTimeField);

    return returnValue;
  }
}
