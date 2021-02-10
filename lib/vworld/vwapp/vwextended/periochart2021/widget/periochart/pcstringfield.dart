import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';

class PcStringField extends StatelessWidget{

  PcStringField({
    @required this.value,
    @required this.fieldName,
    @required this.caption,
    @required this.pcCallbackStringFieldField
  });

  final String value;
  final String fieldName;
  final String caption;
  final PcCallbackStringField pcCallbackStringFieldField;


  @override
  Widget build(BuildContext context){



    TextEditingController myController = TextEditingController()..text = this.value;

    Widget lReturnValue=Card(child:TextField(
      controller: myController,
      readOnly: false,
      onChanged: (value){
        this.pcCallbackStringFieldField(this.fieldName,value);
      },


      decoration: InputDecoration(labelText: this.caption),


    ));

    return lReturnValue;

  }

}