import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpagestateless.dart';
import 'dart:convert';

typedef AfPropertiesOnChangedCallback = void Function(bool);

typedef AfCallbackField = void Function(AfFieldValue, bool);
typedef AfGetCurrentState = AfForm Function();

class AfFormPage extends StatefulWidget {
  AfFormPage(
      {@required this.initialState,
      @required this.formCollection,
      this.isReadOnly: false,
      this.title}){
    if(this.title==null){
      this.title='Record of '+this.initialState.afFormId;
    }
  }

  final AfForm initialState;
  final List<AfForm> formCollection;
  AfGetCurrentState getCurrentStateLink;
  bool isReadOnly;
  String title;

  AfForm getCurrentState() {
    if (this.getCurrentStateLink != null) {
      return this.getCurrentStateLink();
    } else {
      return null;
    }
  }

  _AfFormPageState createState() => _AfFormPageState();
}

class _AfFormPageState extends State<AfFormPage> {
  AfForm currentState;

  AfForm implementGetCurrentState() {
    return currentState;
  }

  @override
  void initState() {
    super.initState();

    this.widget.getCurrentStateLink = this.implementGetCurrentState;

    String encodedJson = json.encode(this.widget.initialState.toJson());

    this.currentState = AfForm.fromJson(json.decode(encodedJson));
  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container(child: Center(child: Text('<Blank Form>')));

    returnValue = AfFormPageStateless(
      state: this.currentState,
      callbackField: this.implementAfCallbackField,
      propertiesOnChangedCallback: this.implementAfPropertiesOnChangedCallback,
      isReadOnly: this.widget.isReadOnly,
    );

    return returnValue;
  }

  void implementAfPropertiesOnChangedCallback(bool doSetState) {
    if (doSetState) {
      setState(() {});
    }
  }

  void implementAfCallbackField(AfFieldValue afFieldValue, bool doSetState) {
    this.currentState.setValue(afFieldValue);
    if (doSetState == true) {
      setState(() {});
    }
  }
}
