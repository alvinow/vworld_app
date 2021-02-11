import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcIntegerField extends StatelessWidget {
  PcIntegerField(
      {@required this.value,
      @required this.fieldName,
      this.caption,
      @required this.pcCallbackIntegerField,
      this.width: 42,
      this.height: 18,
      this.borderWidth: 1,
      this.useBorder: false,
      this.minValue:0,
        this.maxValue:9
      });

  final int value;
  final int maxValue;
  final int minValue;
  final String fieldName;
  final String caption;
  final PcCallbackIntegerField pcCallbackIntegerField;
  final double width;
  final double height;
  final double borderWidth;
  final bool useBorder;

  @override
  Widget build(BuildContext context) {
    BoxDecoration borderBoxDecoration = BoxDecoration();

    if (this.useBorder == true) {
      borderBoxDecoration = BoxDecoration(
        border: Border.all(width: this.borderWidth, color: Colors.black),
      );
    }

    TextEditingController myController;
    if (this.value == null) {
      myController = TextEditingController(text: '');
    } else {
      myController = TextEditingController(text: this.value.toString());
    }

    Widget lReturnValue = Scaffold(
        body: TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      maxLines: 1,
      //maxLength: 2,
      //maxLengthEnforced: true,

      //focusNode: myFocusNode,
      style: TextStyle(fontSize: 11),

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
      controller: myController,
      //autofocus: true,
      readOnly: false,


      onTap: () {
        if (myController.text!=null && myController.text.length > 0) {
          myController.selection = TextSelection(
            baseOffset: 0,
            extentOffset: myController.text.length,
          );
        }
      },

      onChanged: (value) {
        int outputValue;
        if (value == null || value.length == 0 || value=='') {

        } else {
          outputValue = int.tryParse(value);
          if(outputValue>this.maxValue)
            {
              outputValue=this.maxValue;
            }
          else if(outputValue<this.minValue)
            {
              outputValue=this.minValue;
            }
        }

        this.pcCallbackIntegerField(this.fieldName, outputValue);
      },

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
