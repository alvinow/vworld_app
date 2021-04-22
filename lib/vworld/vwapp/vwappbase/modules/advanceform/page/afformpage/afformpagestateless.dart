import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';

class AfFormPageStateless extends StatelessWidget{

  AfFormPageStateless({this.state});

  final AfForm state;

  @override
  Widget build(BuildContext context) {

    Widget returnValue=Center(child:Text('<Empty Form>'));

    returnValue=AfFormPageStateless.generateForm(this.state);

    return returnValue;

  }

  static Widget generateForm(AfForm afForm){

    Widget returnValue=Container();

    List<Widget> fieldFormList=<Widget>[];

    for(int la=0;la<afForm.fieldFormList.length;la++)
      {
        AfFieldForm currentFieldForm=afForm.fieldFormList.elementAt(la);

        Widget currentUiField=Container(

          child: TextFormField(

            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: currentFieldForm.fieldValue.fieldCaption),

            initialValue: currentFieldForm.fieldValue.value,

          )
        );

       fieldFormList.add(currentUiField);

      }
    returnValue=Container(
      child: Column(
        children: fieldFormList,
      ),
    );


    return returnValue;

  }

}