import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pclowerjaw.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcupperjaw.dart';

class PcJaw extends StatelessWidget {
  PcJaw(this.pcProperties,this.pcPropertiesOnChangedCallback);

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PcUpperJaw(this.pcProperties,this.pcPropertiesOnChangedCallback),
        PcLowerJaw(this.pcProperties,this.pcPropertiesOnChangedCallback)
      ],
    );
  }
}
