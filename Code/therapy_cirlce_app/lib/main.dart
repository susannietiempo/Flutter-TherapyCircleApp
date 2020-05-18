import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/screens/therapy_screen.dart';
import 'screens/calendar.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/messaging_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/welcome_screen.dart';




void main() => runApp(TherapyCircle());

class TherapyCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      theme: ThemeData.light(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MessagingScreen.id: (context) => MessagingScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ToDoScreen.id: (context) => ToDoScreen(),
        CalendarScreen.id: (context) => CalendarScreen(),
        TherapyScreen.id: (context) => TherapyScreen(),

      },
    );
  }
}
