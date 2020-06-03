import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/screens/login_screen.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen_one.dart';
import 'registration_screen.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(children: <Widget>[
          Image.asset('images/welcomebg.png'),
          Padding(
            padding: EdgeInsets.only(top: 24.0, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo_circle.png', height: 90, width: 100.0),
                SizedBox(
                  height: 60.0,
                  width: double.infinity,
                ),
                Text(
              'Spend your time on things that \n matter',
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                wordSpacing: 1.5,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3b3a3a),
              ),),
                Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Image.asset('images/welcomeimg.png', height: 150, width: 250,))),
                RoundedButton(
                  title: 'SIGN UP',
                  colour: Color(0xFF3b3a3a),
                  borderColor: Color(0xFF3b3a3a),
                  textColor: Color(0xFFFFFFFF),
                  onPressed: () {
          //TO DO: Change back to registration
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'I ALREADY HAVE AN ACCOUNT',
                  colour: Color(0xFFFFFFFF),
                  borderColor: Color(0xFF3b3a3a),
                  textColor: Color(0xFF3b3a3a),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
