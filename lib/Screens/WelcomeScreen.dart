import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/RoundedButton.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/signupScreen.dart';
import 'dart:math' as math;

//import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            Text("Welcome"),
            RoundedButton(
                title: "Get started",
                onpressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                }),
            RoundedButton(
                title: "Sign Up",
                onpressed: () {
                  Navigator.pushNamed(context, SignInScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
