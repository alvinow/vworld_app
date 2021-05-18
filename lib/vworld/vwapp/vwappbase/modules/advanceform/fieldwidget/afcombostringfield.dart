import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfComboStringField extends StatelessWidget {
  AfComboStringField(
      {this.valueProp,
      this.fieldValue,
      this.backgroundColorHex,
      this.comboListFieldValue,
      this.width,
      this.height,
      this.afCallbackField,
      this.borderWidth,
      this.useBorder,
      this.fontSize,
      this.isValueValid,
      this.isNotNull,
      this.isReadOnly:false
      });

  final AfValueProp valueProp;
  final AfFieldValue fieldValue;
  final String backgroundColorHex;
  final List<AfFieldValue> comboListFieldValue;
  final double width;
  final double height;
  final AfCallbackField afCallbackField;
  final double borderWidth;
  final bool useBorder;
  final double fontSize;
  final bool isValueValid;
  final bool isNotNull;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    List<Widget> comboFieldList = <Widget>[];

    for (int la = 0; la < this.comboListFieldValue.length; la++) {
      AfFieldValue currentElement = this.comboListFieldValue.elementAt(la);

      comboFieldList.add(Text(currentElement.displayValue.toString()));
    }

    TextEditingController textController = TextEditingController();

    if (fieldValue.stringValue != null) {
      textController..text = fieldValue.displayValue;
    }

    Widget returnValue = Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: TextFormField(
          controller: textController,
          onTap: () async {
            if (!(this.valueProp.isGuiReadOnly || this.isReadOnly)  ) {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return ComboListPage(
                        valueProp: this.valueProp,
                        fieldValue: this.fieldValue,
                        comboListFieldValue: this.comboListFieldValue,
                        bc: bc,
                        afCallbackField: this.afCallbackField);
                  });
            }
          },
          maxLines: 1,
          readOnly: true,
          style: TextStyle(fontSize: this.fontSize),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelStyle:
                TextStyle(color: this.isValueValid ? Colors.black : Colors.red),
            contentPadding: EdgeInsets.all(0),
            labelText: this.fieldValue.fieldCaption,
            focusColor: Colors.orange,
            isDense: true,
          ),
        ));

    return returnValue;
  }
}

class ComboListPage extends StatefulWidget {
  ComboListPage(
      {@required this.valueProp,
      @required this.fieldValue,
      @required this.comboListFieldValue,
      @required this.bc,
      this.afCallbackField});

  AfValueProp valueProp;
  AfFieldValue fieldValue;
  BuildContext bc;
  final List<AfFieldValue> comboListFieldValue;
  final AfCallbackField afCallbackField;

  _ComboListPageState createState() => _ComboListPageState();
}

class _ComboListPageState extends State<ComboListPage> {
  int selectedIndex;

  @override
  void initState() {
    super.initState();

    this.selectedIndex = 0;

    if (this.widget.fieldValue.stringValue != null) {
      for (int la = 0; la < this.widget.comboListFieldValue.length; la++) {
        AfFieldValue currentElement =
            this.widget.comboListFieldValue.elementAt(la);

        if (currentElement.stringValue == this.widget.fieldValue.stringValue) {
          this.selectedIndex = la;
          break;
        }
      }
    }
  }

  AfFieldValue getAfFieldValue(int index, List<AfFieldValue> afFieldValueList) {
    AfFieldValue returnValue;

    for (int la = 0; la < afFieldValueList.length; la++) {
      AfFieldValue currentElement = afFieldValueList.elementAt(la);

      if (la == index) {
        returnValue = currentElement;
      }
    }

    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> comboFieldList = <Widget>[];

    for (int la = 0; la < this.widget.comboListFieldValue.length; la++) {
      AfFieldValue currentElement =
          this.widget.comboListFieldValue.elementAt(la);

      comboFieldList.add(Text(currentElement.displayValue));
    }

    Widget returnValue = Container(
        height: 250,
        child: Column(children: <Widget>[
          Container(
              height: 200,
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: selectedIndex),
                magnification: 1.5,
                backgroundColor: Colors.white,
                children: comboFieldList,
                itemExtent: 25,
                squeeze: 0.8,
                looping: false,
                onSelectedItemChanged: (int index) async {
                  this.selectedIndex = index;
                },
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
            SizedBox(
                width: 70,
                height: 50,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(this.widget.bc);
                    },
                    child: Icon(Icons.undo))),
            SizedBox(
                width: 70,
                height: 50,
                child: RaisedButton(
                    onPressed: () async {
                      Navigator.pop(this.widget.bc);

                      AfFieldValue currentFieldValue = this.getAfFieldValue(
                          this.selectedIndex, this.widget.comboListFieldValue);

                      if (currentFieldValue != null) {
                        this.widget.afCallbackField(
                            AfFieldValue(
                                fieldName: this.widget.fieldValue.fieldName,
                                stringValue: currentFieldValue.stringValue,
                                displayValue: currentFieldValue.displayValue),
                            true);
                      }
                      print('selected Index=' + this.selectedIndex.toString());
                    },
                    child: Icon(Icons.check))),
          ])
        ]));

    return returnValue;
  }
}
