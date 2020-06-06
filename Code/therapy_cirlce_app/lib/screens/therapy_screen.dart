import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/components/reusable_icon_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/constants.dart';

class TherapyScreen extends StatefulWidget {
  static const String id = 'therapy_screen';
  final TextStyle appBarText =
      GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  _TherapyScreenState createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
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
                    'My Therapy',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
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
               flex: 2,
              child: ReusableCard(
                onPress: () {
                  setState(() {});
                },
                colour: Colors.white,
                cardChild: Column(
                  children: <Widget>[
                    Image.asset('images/slp.jpg', width: 150,),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text('Speech Therapy',
                              style: kSimpleTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
               flex: 2,
              child: ReusableCard(
                onPress: () {
                  setState(() {});
                },
                colour: Colors.white,
                cardChild: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/OT.png',
                      width: 100,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text('Occupational Therapy',
                              style: kSimpleTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        ),
                      ),
                    ),
                  ],
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
              flex: 2,
              child: ReusableCard(
                onPress: () {
                  setState(() {});
                },
                colour: Colors.white,
                cardChild: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/aba2.png',
                      width: 100,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text('ABA Therapy',
                              style: kSimpleTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
               flex: 2,
              child: ReusableCard(
                onPress: () {
                  setState(() {});
                },
                colour: Colors.white,
                cardChild: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/specialed.png',
                      width: 100,
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text('Special Education',
                              style: kSimpleTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
                ),
                Expanded(
                   flex: 1,
          child: Container(),
                ),
              ],
            ),
          ));
  }
}
