import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/components/rounded_textfield.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen_one.dart';
import 'package:therapy_cirlce_app/services/authentication.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_cirlce_app/services/database.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  AuthService authService = new AuthService();
  DatabaseMethods dbMethods = new DatabaseMethods();
  String _error;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool showSpinner = false;
  QuerySnapshot snapshotUserInfo;

  signIn() async {
    
    if (_formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailController.text.trim());
      setState(() {
        showSpinner = true;
      });

      dbMethods.getUserByEmail(emailController.text.trim()).then((val) {
        snapshotUserInfo = val;
        String fname = snapshotUserInfo.documents[0].data["firstName"];
        print(fname);
        HelperFunctions.saveFirstNameSharedPreference(fname);
        HelperFunctions.saveLastNameSharedPreference(
            snapshotUserInfo.documents[0].data["lastName"]);
      });

      authService
          .signInWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim())
          .then((val) {
        if (val != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        } else {
          setState(() {
            showSpinner = false;
            _showAuthFailedDialog();
          });
        }
      });
    }
  }

  void _showAuthFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Could not log in'),
          content: new Text('Double check your credentials and try again'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
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
                  style: kHeadingTextDark,
                ),
                SizedBox(
                  height: 48.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      RoundedTextFieldState(
                        controller: emailController,
                        hint: 'email address',
                        color: Color(0x325271fe),
                        icon: Icon(
                          Icons.email,
                          color: Color(0xFFadadad),
                        ),
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "Please enter a valid email address";
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      RoundedTextFieldState(
                        validator: (val) {
                          return val.length < 6
                              ? "Passwords needs be at least 6 characters."
                              : null;
                        },
                        controller: passwordController,
                        obsecure: true,
                        hint: 'password',
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xFFadadad),
                        ),
                        color: Color(0x60e2d5c2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Color(0xFF3b3a3a),
                  borderColor: Color(0xFF3b3a3a),
                  textColor: Color(0XFFadadad),
                  onPressed: () async {
                    print(passwordController.text);
                    signIn();
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
