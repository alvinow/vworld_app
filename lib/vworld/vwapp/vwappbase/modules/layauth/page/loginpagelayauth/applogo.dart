import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/appstaticparam.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(top: 80.0),
          width: 120.0,
          height: 120.0,
          //decoration:BoxDecoration(shape: BoxShape.circle, color: Colors.green[800]),
          child: Image.asset(AppStaticParam.loginAppMainLogo)),
      SizedBox(
        height: 30,
        width: 30,
      ),
      Text(
        AppStaticParam.titleApplicationName,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      Text(
        '${AppStaticParam.getFrameworkId()}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      )
    ]);
  }
}