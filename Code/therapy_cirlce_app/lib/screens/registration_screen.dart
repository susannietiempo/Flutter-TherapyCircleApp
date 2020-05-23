import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen.dart';
import 'package:therapy_cirlce_app/components/rounded_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _authentication = FirebaseAuth.instance;
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
                  style: kHeadingText,
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedTextFieldState(
                  hint: 'first name',
                  color: Color(0x325271fe),
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFFadadad),
                  ),
                  onSaved: (value) {
                    firstName = value;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                RoundedTextFieldState(
                  hint: 'last name',
                  color: Color(0x60e2d5c2),
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFFe2d5c2),
                  ),
                  onSaved: (value) {
                    lastName = value;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                RoundedTextFieldState(
                  hint: 'email address',
                  color: Color(0x325271fe),
                  icon: Icon(
                    Icons.email,
                    color: Color(0xFFadadad),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                RoundedTextFieldState(
                  obsecure: true,
                  hint: 'password',
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xFFadadad),
                  ),
                  color: Color(0x60e2d5c2),
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
                  colour: Color(0xFF3b3a3a),
                  borderColor: Color(0xFF3b3a3a),
                  textColor: Color(0XFFadadad),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
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
