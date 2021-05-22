import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/RoundedButton.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/signupScreen.dart';
import 'package:adobe_xd/pinned.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 450.2, middle: 0.7135),
              Pin(size: 973.8, middle: 0.7173),
              child:
                  // Adobe XD layer: 'PicsArt_05-20-11.08…' (shape)
                  Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/educational-app-183a5.appspot.com/o/StartImage.jpeg?alt=media&token=12b74ff2-4d8f-4632-9152-2926d94aa779"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 500),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: Text("Get started")),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.id);
                      },
                      child: Text("Sign in")),
                ),
              ],
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, SignInScreen.id);
            //     },
            //     child: Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
