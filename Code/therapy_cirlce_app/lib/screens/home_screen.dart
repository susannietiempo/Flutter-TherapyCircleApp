import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/components/reusable_icon_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/screens/calendar.dart';
import 'package:therapy_cirlce_app/screens/messaging_screen.dart';
import 'package:therapy_cirlce_app/screens/therapy_screen.dart';
import 'package:therapy_cirlce_app/screens/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            ExactAssetImage('images/zach.jpg', scale: 1.0),
                      ),
                      Text(
                        'My Circle',
                        style: GoogleFonts.ptSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(FontAwesomeIcons.ellipsisV),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                gradient: kGradient,
                onPress: () {
                  setState(() {});
                },
                colour: Colors.white,
                cardChild: Image.asset('images/homeimage.png')),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, TherapyScreen.id);
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                      mainColor: Color(0xfffd0000),
                      secColor: Color(0xffef3a5d),
                      icon: FontAwesomeIcons.puzzlePiece,
                      text: 'Therapy',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, MessagingScreen.id);
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                      mainColor: Colors.orange,
                      secColor: Colors.deepOrange,
                      icon: FontAwesomeIcons.comments,
                      text: 'Messages',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, ToDoScreen.id);
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                      mainColor: Color(0xfffad02c),
                      secColor: Color(0xffffde32),
                      icon: FontAwesomeIcons.tasks,
                      text: 'To Do\'s',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, CalendarScreen.id);
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                      mainColor: Color(0xff6e9277),
                      secColor: Color(0xff3d550c),
                      icon: FontAwesomeIcons.calendarAlt,
                      text: 'Calendar',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        //TO DO: Add gallery
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                        mainColor: Colors.indigo,
                        secColor: Colors.indigoAccent,
                        icon: FontAwesomeIcons.camera,
                        text: 'Gallery'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        //TO DO: Add gallery
                      });
                    },
                    colour: Colors.white,
                    cardChild: ReusableIconCard(
                        mainColor: Colors.purple,
                        secColor: Colors.deepPurple,
                        icon: FontAwesomeIcons.mapMarkerAlt,
                        text: 'Tracker'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
