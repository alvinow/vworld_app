import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/genlib/genlib.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/layauth.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginpageappparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/model/loginrequestparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/layauth/page/loginpagelayauth/loginpagelayauth.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/calendarpage1/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/main.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/organization.dart';

import 'bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayAuth extends StatefulWidget {
  //LayAuthBloc layAuthBloc;

  _LayAuthState createState() => _LayAuthState();
}

class _LayAuthState extends State<LayAuth> {
  LayAuthBloc layAuthBloc;

  void doLoginApp(String username, String password) {
    this.layAuthBloc.add(LayAuthEventLogin(
        loginPageAppParam: LoginPageAppParam(
            loginRequestParam:
                LoginRequestParam(username: username, password: password)),
        timestamp: DateTime.now()));
  }

  void logoutApp(String userloginId) {
    this.layAuthBloc.add(LayAuthEventLogout(
        timestamp: DateTime.now(), userloginId: userloginId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      this.layAuthBloc = LayAuthBloc();

      return this.layAuthBloc;
    }, child: BlocBuilder<LayAuthBloc, LayAuthState>(builder: (context, state) {
      Widget returnValue = InitscreenSplash(title: 'Loading ...');

      if (state is LayAuthStateUninitialized) {
        this
            .layAuthBloc
            .add(LayAuthEventCheckLocalLoginResponse(DateTime.now()));
      } else if (state is LayAuthStateProcessing) {
        returnValue = InitscreenSplash(title: state.title);
      } else if (state is LayAuthStateLoggedIn) {
        final String appRoleId = state.loginResponse.userProfile.userlogin_role_id;


        returnValue = InitscreenSplash(mainAnimation: Icon(Icons.person,color: Colors.white, size: 60,) ,  title: "Logged in as role= $appRoleId");

        if(appRoleId=='meetingmgr_2021_admin')
          {
            final String actor_fullname = state.loginResponse.userProfile.userlogin_fullname;
            final String actor_username=state.loginResponse.userProfile.userlogin_username;
            final Organization currentOrganization =Organization(organization_id: 'satker1', organization_name: 'Satker 1');



            Actor currentActor=Actor(actor_id: state.loginResponse.userProfile.userlogin_id, actor_actorrole_id: appRoleId, actor_fullname: actor_fullname, actor_username: actor_username, actor_password: '****', actor_loginrightstatus_id: '1', actor_person_id: '<invalid_person_id>', actor_organization_id: currentOrganization.organization_id);


            returnValue=MeetingMainPage(currrentActor: currentActor,);
          }


      } else if (state is LayAuthStateLoggedOut) {
        returnValue = LoginPageLayAuth( this.doLoginApp);

      }

      return returnValue;
    }));
  }
}
