import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';

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

    this.currentState=AfForm.fromJson(this.widget.initialState.toJson());


  }

  @override
  Widget build(BuildContext context) {

    Widget returnValue=Container(child: Center(child: Text('<Blank Form>')));

    returnValue=AfFormPage();

    return returnValue;
  }
}