import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/layauth.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginrequestparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/loginpagelayauth.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/actorinfopage/actorinfopage.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/calendarpage1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingtab1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';

class MeetingMainPage extends StatefulWidget{

  MeetingMainPage({ @required this.currrentActor});


  //final String title;
  final Actor currrentActor;
  //final List<Meeting> meetingList;
  //final List<Actor> organizationMember;
  

  _MeetingMainPageState createState() => _MeetingMainPageState();
}

class _MeetingMainPageState extends State<MeetingMainPage>{

  MeetingmainpageBloc bloc;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) {
      this.bloc = MeetingmainpageBloc(this.widget.currrentActor);

      return this.bloc;
    }, child: BlocBuilder<MeetingmainpageBloc, MeetingmainpageState>(builder: (context, state) {
      Widget returnValue = InitscreenSplash(title: 'Loading ...');

      if (state is UninitializedOnMeetingainpageState) {
        this.bloc.add(OpeneventpageOnMeetingmainpageEvent(DateTime.now()));

      } else if (state is ProcessingOnMeetingmainpageState ) {
        returnValue = InitscreenSplash(title: state.title );
      } else if (state is DisplayeventpageOnMeetingmainpageState) {
        final String appRoleId =state.actor.actor_actorrole_id;


        returnValue = InitscreenSplash(mainAnimation: Icon(Icons.person,color: Colors.white, size: 60,) ,  title: "Logged in as role= $appRoleId");

        if(appRoleId=='meetingmgr_2021_admin')
        {

          String appBarTitle='Jadwal Kegiatan';

          returnValue=Scaffold(
              bottomNavigationBar:MeetingTab1(this.bloc, 0),

              appBar: AppBar(
                title: Text(appBarTitle),
              ),

              body: CalendarPage1(title: state.title,currrentUser: state.actor , meetingList: state.meetingList,organizationMember: state.organizationMember,)
          );
        }


      } else if (state is DisplayactorinfopageOnMeetingmainpageState) {
        returnValue=ActorInfoPage(this.bloc, MeetingTab1(this.bloc, 1), state.actor);

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