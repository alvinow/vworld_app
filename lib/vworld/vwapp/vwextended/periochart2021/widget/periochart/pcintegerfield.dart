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
      this.width: 40,
      this.height: 20,
      this.borderWidth: 1,
      this.useBorder: false});

  final int value;
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
        border: Border.all(width: this.borderWidth, color: Colors.lightBlue),
      );
    }

    TextEditingController myController =
        TextEditingController(text: this.value.toString());

    Widget lReturnValue = Scaffold(
        body: TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      maxLines: 1,
      //maxLength: 2,
      //maxLengthEnforced: true,

      //focusNode: myFocusNode,
      style: TextStyle(fontSize: 13),

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: myController,
      //autofocus: true,
      readOnly: false,

/*
                  onTap: () {
                    myController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: myController.text.length,
                    );
                  },*/

      onChanged: (value) {
        int outputValue = 0;
        if (value == null) {
        } else {
          outputValue = int.tryParse(value);
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
