import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
part 'afform.g.dart';

@HiveType(typeId: 101)
@JsonSerializable()
class AfForm {
  AfForm(
      {@required this.fieldFormList,
      @required this.afFormId,
      @required this.afRecordId});

  @HiveField(0)
  final String afFormId;

  @HiveField(1)
  String afRecordId;

  @HiveField(2)
  List<AfFieldForm> fieldFormList;

  factory AfForm.fromJson(Map<String, dynamic> json) => _$AfFormFromJson(json);

  Map<String, dynamic> toJson() => _$AfFormToJson(this);

  bool isRecordValid(){
    bool returnValue=true;

    for(int la=0;la<this.fieldFormList.length;la++){
      AfFieldForm currentElement= this.fieldFormList.elementAt(la);

      if(currentElement.isValueValid()==false)
        {
          returnValue=false;
          break;
        }
    }

    return returnValue;
  }

  AfFieldValueRecord getRecord() {
    AfFieldValueRecord returnValue;

    try {
      AfFieldValueRecord newRecord = AfFieldValueRecord(
          afFormId: this.afFormId,
          afRecordId: this.afRecordId,
          record: <AfFieldValue>[]);

      for (int la = 0; la < this.fieldFormList.length; la++) {
        AfFieldForm currentFieldForm = this.fieldFormList.elementAt(la);
        AfFieldValue newFieldValue = AfFieldValue(
            fieldName: currentFieldForm.fieldValue.fieldName,
            stringValue: currentFieldForm.fieldValue.stringValue,
            integerValue: currentFieldForm.fieldValue.integerValue,
            doubleValue: currentFieldForm.fieldValue.doubleValue,
            dateTimeValue: currentFieldForm.fieldValue.dateTimeValue,
            fieldCaption: currentFieldForm.fieldValue.fieldCaption,
            valueAfDataType: currentFieldForm.fieldValue.valueAfDataType,
            created: currentFieldForm.fieldValue.created,
            updated: currentFieldForm.fieldValue.updated,
            creatorActorId: currentFieldForm.fieldValue.creatorActorId,
            lastUpdaterActorId: currentFieldForm.fieldValue.lastUpdaterActorId,
            afRefValueFormId: currentFieldForm.fieldValue.afRefValueFormId);

        newRecord.record.add(newFieldValue);
      }

      returnValue = newRecord;
    } catch (error) {
      print("error occured on AfForm.getRecord()" + error.toString());
    }

    return returnValue;
  }

  bool setRecord(AfFieldValueRecord fieldValueRecord) {
    bool returnValue = false;
    try {
      if (fieldValueRecord != null &&
          fieldValueRecord.afFormId == this.afFormId) {
        this.afRecordId = fieldValueRecord.afRecordId;

        for (int lDest = 0; lDest < this.fieldFormList.length; lDest++) {
          AfFieldValue currentDestinationFieldValue =
              this.fieldFormList.elementAt(lDest).fieldValue;

          for (int lSource = 0;
              lSource < fieldValueRecord.record.length;
              lSource++) {
            AfFieldValue currentSourceFieldValue =
                fieldValueRecord.record.elementAt(lSource);

            if (currentSourceFieldValue.fieldName ==
                currentDestinationFieldValue.fieldName) {
              if (currentDestinationFieldValue.valueAfDataType ==
                  currentSourceFieldValue.valueAfDataType) {
                currentDestinationFieldValue.stringValue =currentSourceFieldValue.stringValue;
                currentDestinationFieldValue.integerValue =currentSourceFieldValue.integerValue;
                currentDestinationFieldValue.doubleValue =currentSourceFieldValue.doubleValue;
                currentDestinationFieldValue.dateTimeValue =currentSourceFieldValue.dateTimeValue;





                currentDestinationFieldValue.creatorActorId =
                    currentSourceFieldValue.creatorActorId;
                currentDestinationFieldValue.lastUpdaterActorId =
                    currentSourceFieldValue.lastUpdaterActorId;
                currentDestinationFieldValue.created =
                    currentSourceFieldValue.created;
                currentDestinationFieldValue.updated =
                    currentSourceFieldValue.updated;
              }
              break;
            }
          }
        }

        returnValue = true;
      }
    } catch (error) {}
    return returnValue;
  }

  bool setValue(String fieldName, var value) {
    bool returnValue = false;

    for (int la = 0; la < this.fieldFormList.length; la++) {
      AfFieldForm currentFieldForm = this.fieldFormList.elementAt(la);

      if (currentFieldForm.fieldValue.fieldName == fieldName) {
        if(currentFieldForm.fieldValue.valueAfDataType=='String') {
          currentFieldForm.fieldValue.stringValue = value;
        }
        else if(currentFieldForm.fieldValue.valueAfDataType=='Integer') {
          currentFieldForm.fieldValue.integerValue = value;
        }
        else if(currentFieldForm.fieldValue.valueAfDataType=='Double') {
          currentFieldForm.fieldValue.doubleValue = value;
        }
        else if(currentFieldForm.fieldValue.valueAfDataType=='DateTime') {
          currentFieldForm.fieldValue.dateTimeValue = value;
        }

        returnValue = true;
        break;
      }
    }
    return returnValue;
  }
}
