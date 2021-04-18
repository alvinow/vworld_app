import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcStringField extends StatelessWidget {
  PcStringField(
      {@required this.value,
      @required this.fieldName,
      @required this.caption,
        this.height:18,
        this.width:42,
      @required this.pcCallbackStringFieldField,
        this.borderWidth:1,
        this.useBorder:false,
        this.fontSize:18,
        this.backgroundColorHex:"#ebf1f2"

      });
  final String backgroundColorHex;
  final String value;
  final String fieldName;
  final String caption;
  final double width;
  final double height;
  final PcCallbackStringField pcCallbackStringFieldField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration();
    TextEditingController myController = TextEditingController()
      ..text = this.value;

    if (this.useBorder == true) {
      borderBoxDecoration = BoxDecoration(

        border: Border.all(width: this.borderWidth, color: Colors.black),
        color:  Hexcolor(this.backgroundColorHex),


      );
    }

    Widget lReturnValue = Scaffold(
        body: TextField(

          maxLines: 1,
      controller: myController,
      readOnly: false,
      onChanged: (value) {
        this.pcCallbackStringFieldField(this.fieldName, value,true);
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

    Widget lReturnValueWithContainer = Container(
        padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
        width: this.width,
        height: this.height,
        decoration: borderBoxDecoration,
        child: lReturnValue);

    return lReturnValueWithContainer;
  }
}
