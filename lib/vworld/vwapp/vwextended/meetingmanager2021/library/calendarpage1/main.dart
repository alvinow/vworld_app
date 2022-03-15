import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgrid.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/modules/advanceform/page/afformgrid/afformgridparam.dart';
import 'package:vworld_app/vworld/vwapp/vwappbase/util/dateutil.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/actor.dart';
import 'package:vworld_app/vworld/vwapp/vwextended/meetingmanager2021/vwmodel/meeting.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2021, 1, 1): ['New Year\'s Day'],
  DateTime(2021, 1, 6): ['Epiphany'],
  DateTime(2021, 2, 14): ['Valentine\'s Day'],
  DateTime(2021, 4, 21): ['Easter Sunday'],
  DateTime(2021, 4, 22): ['Easter Monday'],
};

class CalendarPage1 extends StatefulWidget {
  CalendarPage1(
      {Key? key,
      this.title,
      this.currrentUser,
      this.meetingList,
      this.afFormGridParam})
      : super(key: key);

  final String? title;
  final Actor? currrentUser;
  final List<Meeting?>? meetingList;
  final AfFormGridParam? afFormGridParam;

  @override
  _CalendarPage1State createState() => _CalendarPage1State();
}

class _CalendarPage1State extends State<CalendarPage1>
    with TickerProviderStateMixin {
  late Map<DateTime, List> _events;
  late List _selectedEvents;
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = Meeting.getCalenderList(this.widget.meetingList!);

    _selectedEvents = _events[_selectedDay] ?? [];


    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      PageController pageController) {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTableCalenderV3(),
        Expanded(child: _buildEventGrid(this.widget.afFormGridParam)),
      ],
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalenderV3(){
     return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }





  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,

      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {

                });
              },
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {
                setState(() {

                });
              },
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {

                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildEventGrid(AfFormGridParam? afFormGridParam) {
    return AfFormGrid(afFormGridParam);
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
