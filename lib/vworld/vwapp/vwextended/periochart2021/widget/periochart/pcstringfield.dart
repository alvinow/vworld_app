import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcStringField extends StatelessWidget {
  PcStringField(
      {@required this.value,
      @required this.fieldName,
      @required this.caption,
        this.height:18,
        this.width:42,
      @required this.pcCallbackStringFieldField});

  final String value;
  final String fieldName;
  final String caption;
  final double width;
  final double height;
  final PcCallbackStringField pcCallbackStringFieldField;

  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration();
    TextEditingController myController = TextEditingController()
      ..text = this.value;

    Widget lReturnValue = Scaffold(
        body: TextField(
          maxLines: 1,
      controller: myController,
      readOnly: false,
      onChanged: (value) {
        this.pcCallbackStringFieldField(this.fieldName, value);
      },

          style: TextStyle(fontSize: 12),


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
        width: this.width,
        height: this.height,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: borderBoxDecoration,
        child: lReturnValue);

    return lReturnValueWithContainer;
  }
}
