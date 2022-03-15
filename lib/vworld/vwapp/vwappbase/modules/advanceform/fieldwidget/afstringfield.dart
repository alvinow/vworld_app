import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfStringField extends StatelessWidget {
  AfStringField(
      {required this.valueProp,
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

    bool lIsFieldReadOnly=this.valueProp!.isGuiReadOnly!|| this.isReadOnly;
    Widget returnValue = Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          initialValue: this.fieldValue!.stringValue == null
              ? null
              : this.fieldValue!.stringValue.toString(),
          maxLines: 1,
          readOnly: lIsFieldReadOnly,
          onChanged: (value) {
            this.afCallbackField!(AfFieldValue(fieldName:this.fieldValue!.fieldName,stringValue: value ) , true);
          },
          style: TextStyle(fontSize: this.fontSize),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelStyle:
                TextStyle(color: this.isValueValid ? Colors.black : Colors.red),
            contentPadding: EdgeInsets.all(0),
            labelText: this.fieldValue!.fieldCaption,
            focusColor: Colors.orange,
            isDense: true,
          ),
        ));

    return returnValue;
  }
}
