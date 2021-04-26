import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvalue.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/affieldvaluerecord.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/util/formdemo.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/layauth.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginrequestparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/loginpagelayauth.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/actorinfopage/actorinfopage.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/calendarpage1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingdetailform/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/library/meetingtab1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';
import 'dart:convert';

class MeetingMainPage extends StatefulWidget {
  MeetingMainPage({@required this.currrentActor});

  //final String title;
  final Actor currrentActor;
  //final List<Meeting> meetingList;
  //final List<Actor> organizationMember;

  _MeetingMainPageState createState() => _MeetingMainPageState();
}

class _MeetingMainPageState extends State<MeetingMainPage> {
  MeetingmainpageBloc bloc;

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



                  AfForm meetingForm=AfFormDemo.getAfFormById('meeting_af_form_id');


                  AfFieldValue field1=AfFieldValue(fieldName: 'meeting_id', value: Uuid().v4(),valueAfDataType: 'String',  creatorActorId: this.widget.currrentActor.actor_id, lastUpdaterActorId: this.widget.currrentActor.actor_id);

                  AfFieldValueRecord fieldValueRecord=AfFieldValueRecord(afFormId: 'meeting_af_form_id', afRecordId: Uuid().v4(), record: <AfFieldValue>[field1] );

                 meetingForm.setRecord(fieldValueRecord);

                  Widget newMeetingPage = Scaffold(
                      appBar: AppBar(
                        title: Text("Detail Kegiatan"),
                      ),
                      body: AfFormPage(initialState:  meetingForm , formCollection: <AfForm>[],)
                  );


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

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => newMeetingPage  ));

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
      } else if(state is DisplayAfformOnMeetingmainpageState){

        String appBarTitle = 'Demo AfForm';

        AfFormPage afFormPage=AfFormPage(initialState: state.afForm,);

        returnValue=returnValue = Scaffold(
            bottomNavigationBar: MeetingTab1(this.bloc, 0),
            appBar: AppBar(
              title: Text(appBarTitle),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        print('Save Button Tapped');
                       print(json.encode(afFormPage.getCurrentStateLink().toJson()));
                      },
                      child: Icon(
                        Icons.save,
                        size: 26.0,
                      ),
                    )
                ),
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

    /*
    String appBarTitle='Jadwal Kegiatan';

    return Scaffold(
        bottomNavigationBar:MeetingTab1(null, 0),

        appBar: AppBar(
        title: Text(appBarTitle),
      ),

      body: CalendarPage1(title: this.widget.title,currrentUser: this.widget.currrentUser , meetingList: this.widget.meetingList,organizationMember: this.widget.organizationMember,)
    );

     */
  }
}
