import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/components/reusable_icon_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/screens/calendar.dart';
import 'package:therapy_cirlce_app/screens/gallery_screen.dart';
import 'package:therapy_cirlce_app/screens/location_screen.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            elevation: 4.0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              ExactAssetImage('images/zach.jpg', scale: 1.0),
                        ),
                    ),
                    Expanded(
                                          child: Center(
                        child: Text(
                          'My Circle',
                          style: GoogleFonts.ptSans(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.cog, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ),
            backgroundColor: Color(0xff5271fe),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    colour: Color(0xfff0dfd1),
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
                          mainColor: Color(0xff5271fe),
                          secColor: Color(0xff5271fe),
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
                          mainColor: Color(0xff545454),
                          secColor: Color(0xff545454),
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
                          mainColor: Color(0xff545454),
                          secColor: Color(0xff545454),
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
                          mainColor: Color(0xff5271fe),
                          secColor: Color(0xff5271fe),
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
                            Navigator.pushNamed(context, GalleryScreen.id);
                          });
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                            mainColor: Color(0xff5271fe),
                            secColor: Color(0xff5271fe),
                            icon: FontAwesomeIcons.camera,
                            text: 'Gallery'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            Navigator.pushNamed(context, TrackerScreen.id);
                          });
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                            mainColor: Color(0xff545454),
                            secColor: Color(0xff545454),
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
