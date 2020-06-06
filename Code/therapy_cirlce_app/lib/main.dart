import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/screens/gallery_screen.dart';
import 'package:therapy_cirlce_app/screens/location_screen.dart';
import 'package:therapy_cirlce_app/screens/messaging_main_screen.dart';
import 'package:therapy_cirlce_app/screens/therapy_screen.dart';
import 'package:provider/provider.dart';
import 'package:therapy_cirlce_app/models/task_info.dart';
import 'package:therapy_cirlce_app/screens/calendar.dart';
import 'package:therapy_cirlce_app/screens/home_screen.dart';
import 'package:therapy_cirlce_app/screens/login_screen.dart';
import 'package:therapy_cirlce_app/screens/messaging_screen.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen_one.dart';
import 'package:therapy_cirlce_app/screens/onboarding_screen_two.dart';
import 'package:therapy_cirlce_app/screens/registration_screen.dart';
import 'package:therapy_cirlce_app/screens/todo_screen.dart';
import 'package:therapy_cirlce_app/screens/welcome_screen.dart';
import 'package:therapy_cirlce_app/screens/add_user.dart';
import 'package:therapy_cirlce_app/screens/pactice.dart';
import 'package:therapy_cirlce_app/screens/chats.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';

void main() => runApp(TherapyCircle());

class TherapyCircle extends StatefulWidget {
  @override
  _TherapyCircleState createState() => _TherapyCircleState();
}

class _TherapyCircleState extends State<TherapyCircle> {
  bool userIsLoggedIn;

  @override
  void initState() {
      getLoggedInState();
      print(userIsLoggedIn);
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: userIsLoggedIn ? HomeScreen.id : WelcomeScreen.id,
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF5271fe),
        ),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          MessagingScreen.id: (context) => MessagingScreen(),
          OnboardingScreen1.id: (context) => OnboardingScreen1(),
          OnboardingScreen2.id: (context) => OnboardingScreen2(),
          HomeScreen.id: (context) => HomeScreen(),
          ToDoScreen.id: (context) => ToDoScreen(),
          CalendarScreen.id: (context) => CalendarScreen(),
          TherapyScreen.id: (context) => TherapyScreen(),
          TrackerScreen.id: (context) => TrackerScreen(),
          GalleryScreen.id: (context) => GalleryScreen(),
          AddUser.id: (context) => AddUser(),
          ChatRoom.id: (context) => ChatRoom(),
          Chat.id: (context) => Chat(),


        },
      ),
    );
  }
}
