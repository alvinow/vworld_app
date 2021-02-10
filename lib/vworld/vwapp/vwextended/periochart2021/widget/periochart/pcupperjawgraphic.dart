import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';

class PcUpperJawGraphic extends StatelessWidget {
  PcUpperJawGraphic(this.pcProperties);

  final PcProperties pcProperties;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(

          child: Image.asset(
            "assets/images/jaw/jaw_upper.jpg",
            fit: BoxFit.fitWidth,
          ))
    ]);
  }
}
