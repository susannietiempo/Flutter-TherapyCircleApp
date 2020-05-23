import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/components/rounded_textfield.dart';

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
                  style: kHeadingText,
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedTextFieldState(
                hint: 'email address',
                color: Color(0x325271fe),
                icon: Icon(Icons.email, color: Color(0xFFadadad),),
                ),
                SizedBox(
                  height: 25.0,
                ),
               RoundedTextFieldState(
                obsecure: true,
                hint: 'password',
                icon: Icon(Icons.lock, color: Color(0xFFadadad),),
                color: Color(0x60e2d5c2),
               ),
                SizedBox(
                  height: 48.0,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Color(0xFF3b3a3a),
                  borderColor: Color(0xFF3b3a3a),
                  textColor: Color(0XFFadadad),
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
