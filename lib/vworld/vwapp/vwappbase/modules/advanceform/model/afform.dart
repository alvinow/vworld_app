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

  factory AfForm.fromJson(Map<String, dynamic> json) =>
      _$AfFormFromJson(json);

  Map<String, dynamic> toJson() => _$AfFormToJson(this);
}
