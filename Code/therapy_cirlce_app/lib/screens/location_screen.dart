import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrackerScreen extends StatefulWidget {
  static const String id = 'location_screen';

  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: <Widget>[
          Icon(FontAwesomeIcons.ellipsisV),
        ],
        title: Center(
          child: Text(
            'Location Tracker',
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
                  'Zach\'s Location',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            //THIS IS A PLACE HOLDER ONLY
            //TO DO: Implement Calendar functionality
            Expanded(child: Image.asset('images/map.jpg'),)
          ],
        ),
      ),
    );
  }
}
