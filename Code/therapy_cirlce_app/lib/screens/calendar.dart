import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  static const String id = 'calendar_screen';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController calendarController;
  Map<DateTime, List<dynamic>> events;
  List<dynamic> selectedEvents;
  TextEditingController eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    eventController = TextEditingController();
    events = {};
    selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 15,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 10, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: ExactAssetImage(
                        'images/logo_circle_yellow.png',
                        scale: 1.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'My Calendar',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                canEventMarkersOverflow: true,
                todayColor: Theme.of(context).primaryColor,
                selectedColor: Color(0XFFff4f55),
                todayStyle: GoogleFonts.ptSans(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Color(0XFFcf5e74),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                formatButtonTextStyle: GoogleFonts.ptSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                setState(() {
                  selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0XFFcf5e74),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(
                      date.day.toString(),
                      style: GoogleFonts.ptSans(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: calendarController,
            ),
            ...selectedEvents.map(
              (event) => (Container(
                padding: EdgeInsets.symmetric(horizontal:10, vertical:10),
                width: double.infinity,
                child: Text(event, style:GoogleFonts.ptSans(
                        fontSize: 18,
                        color: Colors.black,
                      ), ),
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.lightBlue[100]),
                  
                ),
              )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addEvents,
      ),
    );
  }

  addEvents() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Enter Event',
                        style: GoogleFonts.ptSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF545454),
                        ),
                      ),
                    ),
                    TextField(
                      controller: eventController,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFFff4f55),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Save",
                      style: GoogleFonts.ptSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (eventController.text.isEmpty) {
                      Navigator.pop(context);
                    }
                    if (events[calendarController.selectedDay] != null) {
                      events[calendarController.selectedDay]
                          .add(eventController.text);
                    } else {
                      events[calendarController.selectedDay] = [
                        eventController.text
                      ];
                    }
                    prefs.setString("events", json.encode(encodeMap(events)));
                    eventController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      selectedEvents = events[calendarController.selectedDay];
    });
  }
}
