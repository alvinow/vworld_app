import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';
part 'affieldform.g.dart';

@HiveType(typeId: 102)
@JsonSerializable()
class AfFieldForm {
  AfFieldForm(
      {@required this.fieldValue,
       @required this.valueProp,
      this.useExpansionTile: true,
      this.autoExpandWhenNotNull: true,
      this.initiallyExpanded: true,
      });

  @HiveField(0)
  final AfFieldValue fieldValue;
  @HiveField(1)
  final AfValueProp valueProp;
  @HiveField(2)
  bool useExpansionTile;
  @HiveField(3)
  bool autoExpandWhenNotNull;
  @HiveField(4)
  bool initiallyExpanded;

  bool isValueValid(){

    if((this.fieldValue.value==null || this.fieldValue.value.toString()=='') && this.valueProp.isNotNull==true)
      {
        return false;
      }
    else{
      return true;
    }
  }


  factory AfFieldForm.fromJson(Map<String, dynamic> json) =>
      _$AfFieldFormFromJson(json);

  Map<String, dynamic> toJson() => _$AfFieldFormToJson(this);
}
