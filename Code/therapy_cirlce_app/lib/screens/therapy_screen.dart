import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/components/reusable_icon_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/constants.dart';

class TherapyScreen extends StatefulWidget {
  static const String id = 'therapy_screen';
  final TextStyle appBarText = GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  _TherapyScreenState createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[   Icon(FontAwesomeIcons.ellipsisV),],
          title: Center(
            child: Text(
              'My Therapy Circle',
              style: kappBarText,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {});
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                          mainColor: Color(0xfffd0000),
                          secColor: Color(0xffef3a5d),
                          icon: FontAwesomeIcons.puzzlePiece,
                          text: 'Speech Therapy',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {});
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                          mainColor: Colors.orange,
                          secColor: Colors.deepOrange,
                          icon: FontAwesomeIcons.comments,
                          text: 'Occupational Therapy',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {});
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                          mainColor: Color(0xfffad02c),
                          secColor: Color(0xffffde32),
                          icon: FontAwesomeIcons.tasks,
                          text: 'ABA Therapy',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {});
                        },
                        colour: Colors.white,
                        cardChild: ReusableIconCard(
                          mainColor: Color(0xff6e9277),
                          secColor: Color(0xff3d550c),
                          icon: FontAwesomeIcons.calendarAlt,
                          text: 'Special Education',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                )
              ),
            ],
          ),
        ));
  }
}
