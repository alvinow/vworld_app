import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethsideproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcsingleteethgraphic.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcsingleteethproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pcsingleteethtable.dart';


class PcSingleTeeth extends StatefulWidget{
  PcSingleTeeth(this.pcSingleTeethProperties,
      this.pcPropertiesOnChangedCallback, this.pcProperties, {this.columnWidth:42});
  final PcSingleTeethProperties pcSingleTeethProperties;

  final PcProperties pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;

  final double columnWidth;

  @override
  _PcSingleTeethState createState()=> _PcSingleTeethState();
}

class _PcSingleTeethState extends State<PcSingleTeeth> {


  void implementPcPropertiesOnChangedCallback(bool isUpdate) {

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Container();

    Widget lUpperJaw = Column(
      children: <Widget>[
        PcSingleTeethTable(
            this.widget.pcSingleTeethProperties,
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS,
            this.implementPcPropertiesOnChangedCallback),
        Container(
            //color: Colors.blue,
            child: SizedBox(
              height: 150,
              width: this.widget.columnWidth,
              child: PcSingleTeethGraphic(
                  this.widget.pcSingleTeethProperties.buccalSide, this.widget.pcProperties,this.widget.pcSingleTeethProperties),
            )),
        Container(
          //color: Colors.blue,
            child: SizedBox(
              height: 111,
              width: this.widget.columnWidth,
              child: PcSingleTeethGraphic(
                  this.widget.pcSingleTeethProperties.lingualSide, this.widget.pcProperties,this.widget.pcSingleTeethProperties),
            )),
        PcSingleTeethTable(
            this.widget.pcSingleTeethProperties,
            PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS,
            this.implementPcPropertiesOnChangedCallback),
      ],
    );

    Widget lLowerJaw = Column(
      children: <Widget>[


        PcSingleTeethTable(
            this.widget.pcSingleTeethProperties,
            PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS,
            this.implementPcPropertiesOnChangedCallback),

        Container(
          //color: Colors.blue,
            child: SizedBox(
              height: 150,
              width: this.widget.columnWidth,
              child: PcSingleTeethGraphic(
                  this.widget.pcSingleTeethProperties.lingualSide, this.widget.pcProperties,this.widget.pcSingleTeethProperties),
            )),

        Container(
          //color: Colors.blue,
            child: SizedBox(
              height: 150,
              width: this.widget.columnWidth,
              child: PcSingleTeethGraphic(
                  this.widget.pcSingleTeethProperties.buccalSide, this.widget.pcProperties,this.widget.pcSingleTeethProperties),
            )),
        PcSingleTeethTable(
            this.widget.pcSingleTeethProperties,
            PcSingleTeethSideProperties.pcSingleTeethSideBuccalFMS,
            this.implementPcPropertiesOnChangedCallback),

      ],
    );

    /*
    Widget lLowerJaw = Column(
      children: <Widget>[
        Container(
            color: Colors.blue,
            child: SizedBox(
              height: 150,
              width: this.widget.columnWidth,
              child: PcSingleTeethGraphic(
                  this.widget.pcSingleTeethProperties.lingualSide, this.widget.pcProperties),
            )),
        PcSingleTeethTable(
            this.widget.pcSingleTeethProperties,
            PcSingleTeethSideProperties.pcSingleTeethSideLingualFMS,
            this.implementPcPropertiesOnChangedCallback),
      ],
    );*/

    if (this.widget.pcSingleTeethProperties.teethNumber.substring(0, 1) == '1' ||
        this.widget.pcSingleTeethProperties.teethNumber.substring(0, 1) == '2') {
      returnValue = lUpperJaw;
    } else {
      returnValue = lLowerJaw;
    }

    return returnValue;
  }
}
