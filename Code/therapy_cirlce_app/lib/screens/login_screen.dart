import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
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
                  'Log in',
                  style: GoogleFonts.ptSansNarrow(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF545454),
                  ),
                ),
                SizedBox(
                  height: 48.0,
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
                      kTextFieldDecoration.copyWith(hintText: 'email address'),
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
                      hintText: 'password', fillColor: Color(0x44bae6f8)),
                ),
                SizedBox(
                  height: 48.0,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Color(0xFF46578f),
                  borderColor: Color(0xFF46578f),
                  textColor: Color(0XFF9bacfd),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, HomeScreen.id);
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
