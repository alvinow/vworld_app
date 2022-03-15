import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/vwmodel/pcproperties.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/periochart2021/widget/periochart/pccustomjaw.dart';

class PcJaw extends StatelessWidget {
  PcJaw(this.pcProperties, this.pcPropertiesOnChangedCallback);

  final PcProperties? pcProperties;

  final PcPropertiesOnChangedCallback pcPropertiesOnChangedCallback;
  final List<String> teethNumberListUpperJaw = <String>[
    '18',
    '17',
    '16',
    '15',
    '14',
    '13',
    '12',
    '11',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28'
  ];

  final List<String> teethNumberListLowerJaw = <String>[
    '48',
    '47',
    '46',
    '45',
    '44',
    '43',
    '42',
    '41',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38'
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleBox1 = TextStyle(fontSize: 13);

    Widget linerBox1 = Container(
      height: 6,
      width: 36,
      decoration:
          BoxDecoration(border: Border.all(width: 3.0, color: Colors.black)),
    );

    return Column(
      children: <Widget>[
        PcCustomJaw(this.pcProperties, this.pcPropertiesOnChangedCallback,
            this.teethNumberListUpperJaw, PcCustomJaw.upperJawSideFMS),
        Container(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 80,
                ),
                linerBox1,
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black)),
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Row(
                      children: [
                        Text(
                          "Mean Probing Depth =    0 mm",
                          style: textStyleBox1,
                        ),
                        Text(
                          "      Mean Attachment Level=   0 mm",
                          style: textStyleBox1,
                        ),
                        Text(
                          "      0% Plaque",
                          style: textStyleBox1,
                        ),
                        Text(
                          "      0% Bleeding on Probing",
                          style: textStyleBox1,
                        ),
                      ],
                    )),
                linerBox1
              ],
            )),
        PcCustomJaw(this.pcProperties, this.pcPropertiesOnChangedCallback,
            this.teethNumberListLowerJaw, PcCustomJaw.lowerJawSideFMS),
      ],
    );
  }
}
