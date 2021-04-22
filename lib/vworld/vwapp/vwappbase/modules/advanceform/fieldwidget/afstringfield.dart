import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfStringField extends StatelessWidget {
  AfStringField(
      {@required this.value,
        @required this.fieldName,
        @required this.caption,
        this.height:18,
        this.width:42,
        @required this.afCallbackStringField,
        this.borderWidth:1,
        this.useBorder:false,
        this.fontSize:18,
        this.backgroundColorHex:"#ebf1f2",
        this.afValueProp

      });
  final String backgroundColorHex;
  final String value;
  final String fieldName;
  final String caption;
  final double width;
  final double height;
  final AfCallbackStringField afCallbackStringField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final AfValueProp afValueProp;


  @override
  Widget build(BuildContext context) {
    Widget returnValue=Scaffold(
        body: TextField(

          maxLines: 1,

          readOnly: false,
          onChanged: (value) {
            this.afCallbackStringField(this.fieldName, value,true);
          },

          style: TextStyle(fontSize: this.fontSize),


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
        ));

    return returnValue;
  }
}