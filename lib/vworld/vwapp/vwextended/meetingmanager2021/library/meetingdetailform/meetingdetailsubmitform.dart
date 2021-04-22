import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';

// Create a Form widget.
class MeetingDetailSubmitForm extends StatefulWidget {
  MeetingDetailSubmitForm(this.initialState);


  final Meeting initialState;

  @override
  _MeetingDetailSubmitFormState createState() {
    return _MeetingDetailSubmitFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class _MeetingDetailSubmitFormState extends State<MeetingDetailSubmitForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    var txtCtrlMeetingDatetime = TextEditingController();

    return Form(
      
      key: _formKey,
      child: Padding(padding: EdgeInsets.all(20),  child:Column(
        
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: this.widget.initialState.meeting_name,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Nama Kegiatan'),

            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama kegiatan belum dientri';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Tempat Kegiatan'),

            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tempat kegiatan belum dientri';
              }
              return null;
            },
          ),
          TextFormField(
            controller: txtCtrlMeetingDatetime,
            readOnly: true,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Tanggal Kegiatan'),
            onTap: () {
              final DateFormat formatterDateTimeID = DateFormat('yyyy-MM-dd');

              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now().subtract(Duration(days: 3650 * 10)),
                  maxTime: DateTime.now(),
                  theme: DatePickerTheme(
                      headerColor: Colors.lightBlue,
                      backgroundColor: Colors.white70,
                      itemStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                      doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                  onConfirm: (date) {
                txtCtrlMeetingDatetime.text = formatterDateTimeID.format(date);
                //myController.text=formatterDateTimeID.format(date);
                //this.pcCallbackDateField(this.fieldName, date, this.requestParetSetStateOnChanged);
              },
                  currentTime: txtCtrlMeetingDatetime.text.length > 0
                      ? DateUtil1.convertDateFromString(
                          txtCtrlMeetingDatetime.text)
                      : null,
                  locale: LocaleType.en);
            },

            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tanggal kegiatan belum dientri';
              }
              return null;
            },
          ),
          Row(
            children: [
              SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Daftar Panitia'),

                    // The validator receives the text that the user has entered.

                  )),
              SizedBox(
                  width: 80,
                  child: FlatButton.icon(
                    color: Colors.blue,
                    textColor: Colors.white,
                    icon: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    label: Text('...'),
                    onPressed: () {},
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Daftar Peserta'),

                    // The validator receives the text that the user has entered.

                  )),
              SizedBox(
                  width: 80,
                  child: FlatButton.icon(
                    color: Colors.blue,
                    textColor: Colors.white,
                    icon: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    label: Text('...'),
                    onPressed: () {},
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
                child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState.validate() == false) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text('Menyimpan Data...')));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Simpan'),
                    ))),
          ),
        ],
      )),
    );
  }
}
