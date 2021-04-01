import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/RoundedButton.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/signupScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RoundedButton(
                colour: Colors.blueAccent,
                title: 'Log in',
                onpressed: () {
                  Navigator.pushNamed(context, SignInScreen.id);
                },
              ),
              RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onpressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
