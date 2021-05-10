import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Components/RoundedButton.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInScreen extends StatefulWidget {
  static String id = "SignInScreen";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool spinkit = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isEmptyEmail = false;
  bool isEmptyPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF83c5be),
      appBar: AppBar(
        backgroundColor: Color(0xff184047),
        leading: BackButton(
            onPressed: () => Navigator.pushNamed(context, WelcomeScreen.id)),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinkit,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) async {
                  email = value;
                },
                decoration: kTextFormfielddecoration.copyWith(
                  hintText: 'Enter your email',
                  errorText: isEmptyEmail == true ? 'Enter an email' : null,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) async {
                  password = value;
                },
                decoration: kTextFormfielddecoration.copyWith(
                    hintText: 'Enter your password',
                    errorText:
                        isEmptyPassword == true ? 'Enter password' : null),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Color(0xff184047),
                onpressed: () async {
                  if (email == null && password == null) {
                    setState(() {
                      isEmptyEmail = true;
                      isEmptyPassword = true;
                    });
                  } else if (email == null) {
                    setState(() {
                      isEmptyEmail = true;
                    });
                  } else if (password == null) {
                    setState(() {
                      isEmptyPassword = true;
                    });
                  } else {
                    setState(() {
                      spinkit = true;
                    });
                    await signIn(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, HomeScreen.id);
      }
      setState(() {
        spinkit = false;
      });
    } on FirebaseAuthException catch (error) {
      setState(() {
        spinkit = false;
      });
      print(error.message);
      // print(getMessageFromErrorCode(error));
      Alert(
        context: context,
        title: 'Error',
        desc: error.message,
        buttons: [
          DialogButton(
            child: Text('Try Again'),
            onPressed: () => Navigator.pop(context),
            width: 100,
          ),
          DialogButton(
            child: Text('Sign In'),
            onPressed: () => Navigator.pushNamed(context, SignInScreen.id),
            width: 100,
          ),
        ],
      ).show();
    }
  }
}
