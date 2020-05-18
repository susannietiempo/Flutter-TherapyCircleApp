import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = 'onboarding_screen';

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
            Image.asset(
              'images/onboarding.png',
              width: 230,
              height: 230,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'FOCUS ON \nHEALING',
              style: GoogleFonts.fredokaOne(
                letterSpacing: 6.0,
                wordSpacing: 1.5,
                fontSize: 35.5,
                color: Color(0xFF46578f),
              ),
              textAlign: TextAlign.center,
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
                title: 'Get Started',
                colour: Color(0xFFbf4dad),
                borderColor: Color(0xFFbf4dad),
                textColor: Color(0XFFFFFFFF),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
