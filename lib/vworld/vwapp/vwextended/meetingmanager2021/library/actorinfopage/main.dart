import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/model/loginresponse.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';

class ActorInfoPage extends StatefulWidget {
  ActorInfoPage(this.bloc, this.navigationBar, this.actor);

  final Bloc bloc;

  final Actor actor;

  final Widget navigationBar;

  _ActorInfoPage createState() => _ActorInfoPage();
}

class _ActorInfoPage extends State<ActorInfoPage> {
  @override
  Widget build(BuildContext context) {
    Widget iconUser = Icon(
      Icons.person_pin,
      size: 150,
    );

    Widget bodyWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconUser,
        Text(
          this.widget.actor.actor_username,
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Text(
          this.widget.actor.actor_fullname,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 6,
          width: 6,
        ),
        Text(
          "Organization: " + this.widget.actor.actor_organization_id.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
      ],
    );

    Widget returnValue = Scaffold(
      appBar: AppBar(
        title: Text('Pengguna'),
      ),
      //drawer: UserDrawer(this.widget.bloc, this.widget.logoutApp,this.widget.bloc.loginResponse),
      body: SingleChildScrollView(
        child: Center(child: bodyWidget),
      ),
      bottomNavigationBar: this.widget.navigationBar,
    );

    return returnValue;
  }
}
