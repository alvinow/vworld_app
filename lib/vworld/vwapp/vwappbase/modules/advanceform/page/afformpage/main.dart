import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpagestateless.dart';
import 'dart:convert';

typedef AfPropertiesOnChangedCallback = void Function(bool);

typedef AfCallbackDateField = void Function(String, DateTime, bool);
typedef AfCallbackStringField = void Function(String, String, bool);
typedef AfCallbackIntegerField = void Function(String, int, bool);
typedef AfCallbackDoubleField = void Function(String, int, double);



class AfFormPage extends StatefulWidget{
  AfFormPage({this.initialState});

  AfForm initialState;


  _AfFormPageState createState() => _AfFormPageState();
}

class _AfFormPageState extends State<AfFormPage>{

  AfForm currentState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    String test1= json.encode(this.widget.initialState.toJson())  ;

    this.currentState=AfForm.fromJson(json.decode(test1));


    print('current state='+json.encode( this.currentState.toJson()));

  }

  @override
  Widget build(BuildContext context) {

    Widget returnValue=Container(child: Center(child: Text('<Blank Form>')));

    returnValue=AfFormPageStateless(state: this.currentState);

    return returnValue;
  }

  void implementAfPropertiesOnChangedCallback(bool doSetState) {
    if (doSetState) {
      setState(() {});
    }
  }

  void implementAfCallbackStringField(String fieldName, String value, bool doSetState)
  {
    this.currentState.setValue(fieldName, value);
    if(doSetState==true)
      {
        setState(() {

        });
      }
  }


}