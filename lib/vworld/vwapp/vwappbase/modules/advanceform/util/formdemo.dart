import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';

class FormDemo {

  static AfForm getNewMeetingForm(){

    AfForm returnValue=AfForm(fieldFormList: <AfFieldForm>[]);

    AfFieldForm field_meeting_id=AfFieldForm(valueProp: AfValueProp(),  fieldValue: AfFieldValue (fieldName: 'meeting_id',  value: 'meeting1', fieldCaption: 'Meeting ID', valueAfDataType: 'String', createdDate: null, lastUpdate: null, lastUpdaterActorId: null) );

    AfFieldForm field_meeting_name=AfFieldForm(valueProp: AfValueProp(),fieldValue: AfFieldValue (fieldName: 'meeting_name', value: 'First Meeting', fieldCaption: 'Meeting Name', valueAfDataType: 'String', createdDate: null, lastUpdate: null, lastUpdaterActorId: null) );


    returnValue.fieldFormList.add(field_meeting_id);
    returnValue.fieldFormList.add(field_meeting_name);


    return returnValue;
  }


}