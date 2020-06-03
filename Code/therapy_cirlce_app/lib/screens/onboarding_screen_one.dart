import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'onboarding_screen_two.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String id = 'onboarding_screen1';

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
              'FOCUS ON HEALING',
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
              'images/onboardingfemale.png',
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
              'Let us do \n everything else...',
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
                title: 'Next',
                colour: Color(0xFF3b3a3a),
                borderColor: Color(0xFF3b3a3a),
                textColor: Color(0XFFFFFFFF),
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen2.id);
                },
              ),
            ),
             Image.asset(
              'images/dots1.png',

            ),
          ],
        ),
      )),
    );
  }
}
