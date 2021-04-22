import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfFormPageStateless extends StatelessWidget{

  AfFormPageStateless({@required this.state, this.propertiesOnChangedCallback, this.callbackStringField});

  final AfForm state;
  final AfPropertiesOnChangedCallback propertiesOnChangedCallback;
  final AfCallbackStringField callbackStringField;

  @override
  Widget build(BuildContext context) {

    Widget returnValue=Center(child:Text('<Empty Form>'));

    returnValue=this._generateForm(this.state);

    return returnValue;

  }

   Widget _generateForm(AfForm afForm){

    Widget returnValue=Container(child: Center(child: Text('<Blank Form>'),),);

    List<Widget> fieldFormList=<Widget>[];

    for(int la=0;la<afForm.fieldFormList.length;la++)
      {
        AfFieldForm currentFieldForm=afForm.fieldFormList.elementAt(la);

        Widget currentUiField=Container(

          child: TextFormField(
            onChanged: (value){
              this.callbackStringField(currentFieldForm.fieldValue.fieldName,value,true);
            },

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