import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarScreen extends StatefulWidget {
  static const String id = 'calendar_screen';

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          Icon(FontAwesomeIcons.ellipsisV),
        ],
        title: Center(
          child: Text(
            'My Therapy Calendar',
            style: kappBarText,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'May',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            //THIS IS A PLACE HOLDER ONLY
            //TO DO: Implement Calendar functionality
            Expanded(child: Image.asset('images/calendar.jpg'),)
          ],
        ),
      ),
    );
  }
}
