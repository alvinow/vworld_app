import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcexamform.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

typedef PcPropertiesOnChangedCallback = void Function(bool);
typedef PcCallbackDateField = void Function(String, DateTime,bool);
typedef PcCallbackStringField = void Function(String, String,bool);
typedef PcCallbackIntegerField = void Function(String, int,bool);

class Periochart extends StatefulWidget {
  Periochart({@required this.initialState});
  final PcProperties initialState;
  _PeriochartState createState() => _PeriochartState();
}

class _PeriochartState extends State<Periochart> {
  PcProperties currentState;

  @override
  void initState() {
    super.initState();
    this.currentState = this.widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return PcExamForm(
        this.currentState, this.implementPcPropertiesOnChangedCallback);
  }

  void implementPcPropertiesOnChangedCallback(bool doSetState) {
    if (doSetState) {
      setState(() {});
    }
  }
}
