import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcIntegerFieldAdv extends StatefulWidget {
  PcIntegerFieldAdv(
      {@required this.value,
      @required this.fieldName,
      this.caption,
      @required this.pcCallbackIntegerField,
      this.width: 40,
      this.height: 20,
      this.borderWidth: 1,

      });

  final int value;
  final String fieldName;
  final String caption;
  final PcCallbackIntegerField pcCallbackIntegerField;
  final double width;
  final double height;
  final double borderWidth;


  _PcIntegerFieldSdvState createState() => _PcIntegerFieldSdvState();
}

class _PcIntegerFieldSdvState extends State<PcIntegerFieldAdv> {
  FocusNode myFocusNode;
  TextEditingController myController;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myController = TextEditingController()..text = this.widget.value.toString();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    Widget lReturnValue = GestureDetector(
        onTap: () {
          myController.selection = new TextSelection(
            baseOffset: 0,
            extentOffset: myController.text.length,
          );
          myFocusNode.requestFocus();
        },
        child: SizedBox(
            width: this.widget.width,
            height: this.widget.height,
            child: Container(
                width: this.widget.width,
                height: this.widget.height,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: this.widget.borderWidth, color: Colors.black)),
                child: TextField(
                  maxLength: 2,
                  maxLines: 1,
                  //focusNode:myFocusNode ,
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.number,

                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: myController,
                  autofocus: true,
                  readOnly: false,



                  onTap: () {
                    myController.selection = new TextSelection(
                      baseOffset: 0,
                      extentOffset: myController.text.length,
                    );
                  },
                  onChanged: (value) {
                    this.widget.pcCallbackIntegerField(this.widget.fieldName,
                        value == null ? 0 : int.tryParse(value));
                  },

                  decoration: InputDecoration(labelText: this.widget.caption),
                ))));

    return lReturnValue;
  }
}
