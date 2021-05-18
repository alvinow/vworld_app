import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/model/afform.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformpage/afformpage.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/vwdialog/vwdialog.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/actorinfopage/actorinfopage.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/calendarpage1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/library/meetingtab1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/page/meetingpagedetail/libmeetingpagedetail.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'dart:convert';

class MeetingMainPage extends StatefulWidget {
  MeetingMainPage({@required this.currrentActor, @required this.loginResponse});

  final Actor currrentActor;
  final LoginResponse loginResponse;
  _MeetingMainPageState createState() => _MeetingMainPageState();
}

class _MeetingMainPageState extends State<MeetingMainPage> {
  MeetingmainpageBloc bloc;

  Future<void> implementSaveValidRecordMeetingPageDetail(
      AfForm afForm, BuildContext context) async {
    print("Simulation: Saving Record...");
    await Navigator.pop(context); //popping the afForm

    this.bloc.add(
        SavemeetingeventpageOnMeetingmainpageEvent(DateTime.now(), afForm));
  }

  Future<void> implementSaveInvalidRecordMeetingPageDetail(
      AfForm afForm, BuildContext context) async {
    VwDialog.showAlertDialog(context,
        title: 'Please fill the required field(s)');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      this.bloc = MeetingmainpageBloc(
          this.widget.currrentActor, this.widget.loginResponse);

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
                  LibMeetingPageDetail.openNewMeetingPageDetail(context,
                      this.widget.currrentActor, this.widget.loginResponse,
                      onSaveValidRecordMeetingPageDetail:
                          this.implementSaveValidRecordMeetingPageDetail,
                      onSaveInvalidRecordMeetingPageDetail:
                          this.implementSaveInvalidRecordMeetingPageDetail);
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              body: CalendarPage1(
                title: state.title,
                currrentUser: state.actor,
                meetingList: state.meetingList,
                afFormGridParam: state.afFormGridParam,
              ));
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
