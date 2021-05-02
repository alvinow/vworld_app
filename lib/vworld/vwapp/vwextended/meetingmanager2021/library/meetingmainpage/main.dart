import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/util/afformdemo.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/vwdialog/vwdialog.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/actorinfopage/actorinfopage.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/calendarpage1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/library/meetingtab1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/page/meetingpagedetail/meetingpagedetail.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'dart:convert';

class MeetingMainPage extends StatefulWidget {
  MeetingMainPage({@required this.currrentActor});

  final Actor currrentActor;
  _MeetingMainPageState createState() => _MeetingMainPageState();
}

class _MeetingMainPageState extends State<MeetingMainPage> {
  MeetingmainpageBloc bloc;

  void implementSaveValidRecordMeetingPageDetail(AfForm afForm,BuildContext context) {
    print("Simulation: Saving Record...");
    Navigator.pop(context);

  }

  void implementSaveInvalidRecordMeetingPageDetail(AfForm afForm, BuildContext context){
    VwDialog.showAlertDialog(context, title: 'Please fill the required field(s)');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      this.bloc = MeetingmainpageBloc(this.widget.currrentActor);

      return this.bloc;
    }, child: BlocBuilder<MeetingmainpageBloc, MeetingmainpageState>(
        builder: (context, state) {
      Widget returnValue = InitscreenSplash(title: 'Loading ...');

      if (state is UninitializedOnMeetingainpageState) {
        this.bloc.add(OpeneventpageOnMeetingmainpageEvent(DateTime.now()));
      } else if (state is ProcessingOnMeetingmainpageState) {
        returnValue = InitscreenSplash(title: state.title);
      } else if (state is DisplayeventpageOnMeetingmainpageState) {
        final String appRoleId = state.actor.actor_actorrole_id;

        returnValue = InitscreenSplash(
            mainAnimation: Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
            title: "Logged in as role= $appRoleId");

        if (appRoleId == 'meetingmgr_2021_admin') {
          String appBarTitle = 'Jadwal Kegiatan';

          returnValue = Scaffold(
              bottomNavigationBar: MeetingTab1(this.bloc, 0),
              appBar: AppBar(
                title: Text(appBarTitle),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  AfForm meetingForm =
                      AfFormDemo.getAfFormById('meeting_af_form_id');

                  AfFieldValue field1 = AfFieldValue(
                      fieldName: 'meeting_id',
                      value: Uuid().v4(),
                      valueAfDataType: 'String',
                      creatorActorId: this.widget.currrentActor.actor_id,
                      lastUpdaterActorId: this.widget.currrentActor.actor_id);

                  AfFieldValueRecord fieldValueRecord = AfFieldValueRecord(
                      afFormId: 'meeting_af_form_id',
                      afRecordId: Uuid().v4(),
                      record: <AfFieldValue>[field1]);

                  meetingForm.setRecord(fieldValueRecord);

                  AfFormPage afFormPage = AfFormPage(
                    initialState: meetingForm,
                    formCollection: <AfForm>[],
                  );

                  Widget newMeetingPage = MeetingPageDetail(
                    afFormPage: afFormPage,
                    onSaveInvalidRecordMeetingPageDetail: this.implementSaveInvalidRecordMeetingPageDetail,
                    onSaveValidRecordMeetingPageDetail:
                        this.implementSaveValidRecordMeetingPageDetail,
                  );

                  /*
                  Widget newMeetingPage = Scaffold(
                      appBar: AppBar(
                        title: Text("Detail Kegiatan"),
                        actions: [
                          IconButton(
                            icon: Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // do something
                              if (afFormPage.getCurrentState().isRecordValid()) {

                                print('Record Valid');
                                Navigator.pop(context);
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                        duration: Duration(seconds: 5),
                                        content: Text('Record is not valid')));
                                print('Record Not Valid');
                              }
                            },
                          )
                        ],
                      ),

                      body: afFormPage
                  );
*/

                  /*
                  Meeting newMeeting = Meeting(
                      meeting_id: Uuid().v4(),
                      meeting_meetingtype_id: 'onlinemeeting',
                      meeting_meetingstatus_id: '2',
                      meeting_start_datetime: DateUtil1.convertDateFromString(
                          '2021-03-01 08:00:00'),
                      meeting_end_datetime: DateUtil1.convertDateFromString(
                          '2021-03-03 21:00:00'),
                      meeting_owner_actor_id: this.widget.currrentActor.actor_id,
                      comitte: <Actor>[],
                      participants: <Actor>[]);

                   */

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newMeetingPage));

                  //print(json.encode(state.actor.toJson()));
                  // Add your onPressed code here!
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              body: CalendarPage1(
                  title: state.title,
                  currrentUser: state.actor,
                  meetingList: state.meetingList));
        }
      } else if (state is DisplayactorinfopageOnMeetingmainpageState) {
        returnValue =
            ActorInfoPage(this.bloc, MeetingTab1(this.bloc, 1), state.actor);
      } else if (state is DisplayAfformOnMeetingmainpageState) {
        String appBarTitle = 'Demo AfForm';

        AfFormPage afFormPage = AfFormPage(
          initialState: state.afForm,
        );

        returnValue = returnValue = Scaffold(
            bottomNavigationBar: MeetingTab1(this.bloc, 0),
            appBar: AppBar(
              title: Text(appBarTitle),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        print('Save Button Tapped');
                        print(json
                            .encode(afFormPage.getCurrentStateLink().toJson()));
                      },
                      child: Icon(
                        Icons.save,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('Button Tapped');
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            body: afFormPage);
      }

      return returnValue;
    }));
  }
}
