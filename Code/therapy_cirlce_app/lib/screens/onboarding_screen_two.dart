import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'home_screen.dart';

class OnboardingScreen2 extends StatelessWidget {
  static const String id = 'onboarding_screen2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'GET THINGS DONE',
              style: GoogleFonts.fredokaOne(
                letterSpacing: 6.0,
                wordSpacing: 1.5,
                fontSize: 25.5,
                color: Color(0xFF040305),
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'images/onboardingmale.png',
              width: 230,
              height: 230,
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'We make a space for YOU \n to do everything...',
              style: GoogleFonts.ptSans(
                letterSpacing: 2.0,
                wordSpacing: 1.5,
                fontSize: 20,
                color: Color(0xFF545454),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: RoundedButton(
                title: 'Get Started',
                colour: Color(0xFF3b3a3a),
                borderColor: Color(0xFF3b3a3a),
                textColor: Color(0XFFFFFFFF),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
              ),
            ),
             Image.asset(
              'images/dots2.png',

            ),
          ],
        ),
      )),
    );
  }
}
