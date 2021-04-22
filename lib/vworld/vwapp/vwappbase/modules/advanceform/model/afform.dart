import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
part 'afform.g.dart';

@HiveType(typeId: 101)
@JsonSerializable()
class AfForm {
  AfForm({@required this.fieldFormList});

  @HiveField(0)
  List<AfFieldForm> fieldFormList;

  factory AfForm.fromJson(Map<String, dynamic> json) => _$AfFormFromJson(json);

  Map<String, dynamic> toJson() => _$AfFormToJson(this);

  bool setValue(String fieldName, var value) {
    bool returnValue = false;

    for (int la = 0; la < this.fieldFormList.length; la++) {
      AfFieldForm currentFieldForm = this.fieldFormList.elementAt(la);

      if (currentFieldForm.fieldValue.fieldName == fieldName) {
        currentFieldForm.fieldValue.value = value;
        returnValue = true;
        break;
      }
    }
    return returnValue;
  }
}
