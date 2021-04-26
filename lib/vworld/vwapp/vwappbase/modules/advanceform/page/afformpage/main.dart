import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpagestateless.dart';
import 'dart:convert';

typedef AfPropertiesOnChangedCallback = void Function(bool);

typedef AfCallbackDateField = void Function(String, DateTime, bool);
typedef AfCallbackStringField = void Function(String, String, bool);
typedef AfCallbackIntegerField = void Function(String, int, bool);
typedef AfCallbackDoubleField = void Function(String, int, double);
typedef AfGetCurrentState = AfForm Function();

class AfFormPage extends StatefulWidget {
  AfFormPage({@required this.initialState, @required this.formCollection });

  final AfForm initialState;
  final List<AfForm> formCollection;
  AfGetCurrentState getCurrentStateLink;

  AfForm getCurrentState(){

    if(this.getCurrentStateLink!=null) {
      return this.getCurrentStateLink();
    }
    else{
      return null;
    }
  }

  _AfFormPageState createState() => _AfFormPageState();
}

class _AfFormPageState extends State<AfFormPage> {
  AfForm currentState;


  AfForm implementGetCurrentState(){
    return currentState;
  }


  @override
  void initState() {


    super.initState();

    this.widget.getCurrentStateLink=this.implementGetCurrentState;

    String encodedJson = json.encode(this.widget.initialState.toJson());

    this.currentState = AfForm.fromJson(json.decode(encodedJson));

  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(child: Center(child: Text('<Blank Form>')));

    returnValue = AfFormPageStateless(
      state: this.currentState,
      callbackStringField: this.implementAfCallbackStringField,
      callbackDateField: this.implementAfCallbackDateField,
      propertiesOnChangedCallback: this.implementAfPropertiesOnChangedCallback,
    );

    return returnValue;
  }

  void implementAfPropertiesOnChangedCallback(bool doSetState) {
    if (doSetState) {
      setState(() {});
    }
  }

  void implementAfCallbackStringField(
      String fieldName, String value, bool doSetState) {
    this.currentState.setValue(fieldName, value);
    if (doSetState == true) {
      setState(() {});
    }
  }
  void implementAfCallbackDateField(
      String fieldName, DateTime value, bool doSetState) {
    this.currentState.setValue(fieldName, value);
    if (doSetState == true) {
      setState(() {});
    }
  }
}
