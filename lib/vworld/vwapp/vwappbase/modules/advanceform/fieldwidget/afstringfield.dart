import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfStringField extends StatelessWidget {
  AfStringField(
      {@required this.valueProp,
      @required this.fieldValue,
      this.height: 18,
      this.width: 42,
      @required this.afCallbackStringField,
      this.borderWidth: 1,
      this.useBorder: false,
      this.fontSize: 18,
      this.backgroundColorHex: "#ebf1f2",
        this.isValueValid: false,
        this.isNotNull: false
      });

  final AfValueProp valueProp;
  final AfFieldValue fieldValue;
  final String backgroundColorHex;
  //final String value;
  //final String fieldName;
  //final String caption;
  final double width;
  final double height;
  final AfCallbackStringField afCallbackStringField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final bool isValueValid;
  final bool isNotNull;

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          initialValue: this.fieldValue.value==null? null : this.fieldValue.value.toString(),
      maxLines: 1,
      readOnly: this.valueProp.isReadOnly,
      onChanged: (value) {
        this.afCallbackStringField(this.fieldValue.fieldName, value, true);
      },
      style: TextStyle(fontSize: this.fontSize),
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
        labelStyle: TextStyle(color: this.isValueValid? Colors.black: Colors.red),
        contentPadding: EdgeInsets.all(0),
        labelText: this.fieldValue.fieldCaption,
        focusColor: Colors.orange,
        isDense: true,
      ),
    ));

    return returnValue;
  }
}
