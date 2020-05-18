import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String firstName;
  String lastName;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: GoogleFonts.ptSansNarrow(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF545454)),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  cursorColor: Color(0xFF545454),
                  style: GoogleFonts.ptSansNarrow(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Color(0xFF545454)),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    firstName = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'First Name'),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  cursorColor: Color(0xFF545454),
                  style: GoogleFonts.ptSansNarrow(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Color(0xFF545454)),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    lastName = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Last Name',
                    fillColor: Color(0x44bae6f8),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xFF545454),
                  style: GoogleFonts.ptSansNarrow(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Color(0xFF545454)),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Email address'),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  obscureText: true,
                  cursorColor: Color(0xFF545454),
                  style: GoogleFonts.ptSansNarrow(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Color(0xFF545454)),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      fillColor: Color(0x44bae6f8)),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'By continuing, you agree to Therapy Circle\'s Terms and Conditions',
                  style: GoogleFonts.ptSansNarrow(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF3b3a3a),
                    wordSpacing: 1.5,
                  ),
                ),
                   SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  title: 'Sign Up',
                  colour: Color(0xFF46578f),
                  borderColor: Color(0xFF46578f),
                  textColor: Color(0XFF9bacfd),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, OnboardingScreen.id);
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
