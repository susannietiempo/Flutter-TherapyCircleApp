import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/components/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen_one.dart';
import 'package:therapy_cirlce_app/components/rounded_textfield.dart';
import 'package:therapy_cirlce_app/services/authentication.dart';
import 'package:therapy_cirlce_app/services/database.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  DatabaseMethods dbMethods = new DatabaseMethods();

  AuthService authService = new AuthService();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  registerNewUser() {
    if (_formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "email": emailController.text.trim(),
      };

      setState(() {
        showSpinner = true;
      });

      try {
        authService
            .signUpWithEmailAndPassword(
                emailController.text, passwordController.text)
            .then((val) {
          dbMethods.uploadUserInfo(userInfoMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveFirstNameSharedPreference(firstNameController.text.trim());
          HelperFunctions.saveLastNameSharedPreference(lastNameController.text.trim());
          HelperFunctions.saveUserEmailSharedPreference(emailController.text.trim());

          Navigator.pushReplacementNamed(context, OnboardingScreen1.id);
        });

        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e);
      }
    }
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
                  'Sign Up',
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
                        validator: (val) {
                          return val.isEmpty
                              ? "First name cannot be empty"
                              : null;
                        },
                        controller: firstNameController,
                        hint: 'first name',
                        color: Color(0x325271fe),
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFFadadad),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      RoundedTextFieldState(
                        controller: lastNameController,
                        hint: 'last name',
                        color: Color(0x60e2d5c2),
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFFe2d5c2),
                        ),
                        validator: (val) {
                          return val.isEmpty
                              ? "Last name cannot be empty"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
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
                        controller: passwordController,
                        obsecure: true,
                        hint: 'password',
                        icon: Icon(
                          Icons.lock,
                          color: Color(0xFFadadad),
                        ),
                        color: Color(0x60e2d5c2),
                        validator: (val) {
                          return val.length < 6
                              ? "Passwords needs be at least 6 characters."
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
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
                      registerNewUser();
                    });

                    // Navigator.pushNamed(context, OnboardingScreen1.id);
                    // setState(() {
                    //   showSpinner = true;
                    // });
                    // try {
                    //   final newUser =
                    //       await _authentication.createUserWithEmailAndPassword(
                    //           email: email, password: password);
                    //   if (newUser != null) {
                    //     Navigator.pushNamed(context, OnboardingScreen1.id);
                    //   }

                    //   setState(() {
                    //     showSpinner = false;
                    //   });
                    // } catch (e) {
                    //   print(e);
                    // }
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
