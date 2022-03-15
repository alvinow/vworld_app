import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/fieldwidget/afcombostringfield.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/fieldwidget/afdatefield.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/fieldwidget/afstringfield.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';

class AfFormPageStateless extends StatelessWidget {
  AfFormPageStateless(
      {required this.state,
      this.propertiesOnChangedCallback,
      this.callbackField,
      this.isReadOnly:false
      });

  final AfForm? state;
  final AfPropertiesOnChangedCallback? propertiesOnChangedCallback;
  final AfCallbackField? callbackField;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    Widget returnValue = Center(child: Text('<Empty Form>'));

    returnValue = SingleChildScrollView(child: this._generateForm(this.state!));

    return returnValue;
  }

  Widget _generateForm(AfForm afForm) {
    Widget returnValue = Container(
      child: Center(
        child: Text('<Blank Form>'),
      ),
    );

    List<Widget> fieldFormList = <Widget>[];

    for (int la = 0; la < afForm.fieldFormList.length; la++) {
      AfFieldForm currentFieldForm = afForm.fieldFormList.elementAt(la);

      Widget currentUiField = Container();

      if (currentFieldForm.isHidden == false)
        {
        if (currentFieldForm.fieldValue!.valueAfDataType == 'String') {
          currentUiField = AfStringField(
            fieldValue: currentFieldForm.fieldValue,
            isValueValid: currentFieldForm.isValueValid(),
            isNotNull: currentFieldForm.valueProp!.isNotNull,
            valueProp: currentFieldForm.valueProp,
            afCallbackField: this.callbackField,
            isReadOnly: this.isReadOnly,
          );
          fieldFormList.add(currentUiField);
        } else if (currentFieldForm.fieldValue!.valueAfDataType == 'DateTime') {
          currentUiField = AfDateField(
              fieldValue: currentFieldForm.fieldValue,
              isValueValid: currentFieldForm.isValueValid(),
              isNotNull: currentFieldForm.valueProp!.isNotNull,
              valueProp: currentFieldForm.valueProp,
              afCallbackField: this.callbackField,
            isReadOnly: this.isReadOnly,
          );
          fieldFormList.add(currentUiField);
        } else
        if (currentFieldForm.fieldValue!.valueAfDataType == 'ComboString') {
          currentUiField = AfComboStringField(
              comboListFieldValue: currentFieldForm.fieldValue!.comboStringList,
              fieldValue: currentFieldForm.fieldValue,
              isValueValid: currentFieldForm.isValueValid(),
              isNotNull: currentFieldForm.valueProp!.isNotNull,
              valueProp: currentFieldForm.valueProp,
              afCallbackField: this.callbackField,
            isReadOnly: this.isReadOnly,);
          fieldFormList.add(currentUiField);
        }
    }
    }
    returnValue = Container(
      child: Column(
        children: fieldFormList,
      ),
    );

    return returnValue;
  }
}
