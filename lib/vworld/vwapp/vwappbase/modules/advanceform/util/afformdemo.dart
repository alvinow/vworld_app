import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afvalueprop.dart';

class AfFormDemo {
  static AfForm getAfFormById(String afFormId) {
    if (afFormId == 'meeting_af_form_id') {
      return AfFormDemo.getMeetingForm();
    }
  }

  static AfForm getMeetingForm() {
    /*

  final String meeting_id;
  final String meeting_meetingtype_id;
  final String meeting_meetingstatus_id;
  final String meeting_name;
  final DateTime meeting_start_datetime;
  final DateTime meeting_end_datetime;
  final String meeting_owner_actor_id;
  final List<Actor> comitte;
  final List<Actor> participants;
     */

    AfForm returnValue =
        AfForm(fieldFormList: <AfFieldForm>[], afFormId: 'meeting_af_form_id');

    AfFieldForm field0 = AfFieldForm(
        valueProp: AfValueProp(isGuiReadOnly: true, isNotNull: true),
        isHidden: true,
        fieldValue: AfFieldValue(
            fieldName: 'record_id',
            fieldCaption: 'Record ID',
            valueAfDataType: 'String',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field1 = AfFieldForm(
        valueProp: AfValueProp(isGuiReadOnly: true, isNotNull: true),
        isHidden: true,
        fieldValue: AfFieldValue(
            fieldName: 'meeting_id',
            fieldCaption: 'Meeting ID',
            valueAfDataType: 'String',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field2 = AfFieldForm(
        valueProp: AfValueProp(),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_meetingtype_id',
            fieldCaption: 'Meeting Type ID',
            valueAfDataType: 'ComboString',
            comboStringList: <AfFieldValue>[
              AfFieldValue(
                  displayValue: 'Online Meeting', stringValue: 'onlinemeeting'),
              AfFieldValue(displayValue: 'Kegiatan', stringValue: 'kegiatan')
            ],
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field3 = AfFieldForm(
        valueProp: AfValueProp(isNotNull: true),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_meetingstatus_id',
            fieldCaption: 'Meeting Status ID',
            comboStringList: <AfFieldValue>[
              AfFieldValue(displayValue: 'draft', stringValue: '0'),
              AfFieldValue(displayValue: 'waitingforapproval', stringValue: '1'),
              AfFieldValue(displayValue: 'planned', stringValue: '2'),
              AfFieldValue(displayValue: 'cancel', stringValue: '3'),
            ],
            valueAfDataType: 'ComboString',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field4 = AfFieldForm(
        valueProp: AfValueProp(isNotNull: true),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_name',
            fieldCaption: 'Meeting Name',
            valueAfDataType: 'String',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field5 = AfFieldForm(
        valueProp: AfValueProp(isNotNull: true),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_start_datetime',
            fieldCaption: 'Meeting Start',
            valueAfDataType: 'DateTime',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field6 = AfFieldForm(
        valueProp: AfValueProp(isNotNull: true),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_end_datetime',
            fieldCaption: 'Meeting End',
            valueAfDataType: 'DateTime',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field7 = AfFieldForm(
        valueProp: AfValueProp(),
        fieldValue: AfFieldValue(
            fieldName: 'meeting_owner_actor_id',
            fieldCaption: 'Meeting Owner',
            valueAfDataType: 'String',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field8 = AfFieldForm(
        valueProp: AfValueProp(),
        fieldValue: AfFieldValue(
            fieldName: 'comitte',
            fieldCaption: 'Comittee',
            valueAfDataType: 'AfFormRecordList',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    AfFieldForm field9 = AfFieldForm(
        valueProp: AfValueProp(),
        fieldValue: AfFieldValue(
            fieldName: 'participants',
            fieldCaption: 'Participants',
            valueAfDataType: 'AfFormRecordList',
            created: null,
            updated: null,
            lastUpdaterActorId: null));

    returnValue.fieldFormList.add(field0);
    returnValue.fieldFormList.add(field4);
    returnValue.fieldFormList.add(field1);
    returnValue.fieldFormList.add(field2);
    returnValue.fieldFormList.add(field3);
    returnValue.fieldFormList.add(field5);
    returnValue.fieldFormList.add(field6);
    returnValue.fieldFormList.add(field7);
    returnValue.fieldFormList.add(field8);
    returnValue.fieldFormList.add(field9);

    return returnValue;
  }
}
