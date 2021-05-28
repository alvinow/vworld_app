import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/library/meetingmainpage/bloc/bloc.dart';

class MeetingTab1 extends StatelessWidget {
  MeetingTab1(this.bloc, this.activeIndex);

  final int activeIndex;

  Bloc bloc;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: this.activeIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.blue, size: 30),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        /*BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart, color: Colors.black),
            label: 'Dashboard'),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.event, color: Colors.black),
          label: 'Kegiatan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_contact_calendar, color: Colors.black),
          label: 'Panitia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded , color: Colors.black),
          label: 'Peserta',
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Pengguna'),
      ],
      onTap: (index) {
        if (index == 0) {
          this.bloc.add(OpeneventpageOnMeetingmainpageEvent(DateTime.now()));
          //this.bloc.add(EventSpiMobile2020UserloginInfo(DateTime.now()));
        } else if (index == 1) {
          this.bloc.add(RequestDisplayPanitiaListPageOnMeetingmainpageEvent(DateTime.now()));

        }
        else if (index == 2) {
          this.bloc.add(OpenactorinfopageOnMeetingmainpageEvent(DateTime.now()));
          //this.bloc.add(EventSpiMobile2020ShowUserDashboard(DateTime.now()));
        }
        else if (index == 3) {
          this.bloc.add(OpenactorinfopageOnMeetingmainpageEvent(DateTime.now()));
          //this.bloc.add(EventSpiMobile2020ShowUserDashboard(DateTime.now()));
        }

      },
    );
  }
}
