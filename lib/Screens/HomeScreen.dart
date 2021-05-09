import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/profile.dart';
import 'package:flutter_application_1/constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Container(
                child: Center(
                  child: Text(" Error : ${snapshot.error}"),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.hasData) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamsnapshot) {
                if (streamsnapshot.hasError) {
                  return Scaffold(
                    body: Container(
                      child: Center(
                        child: Text(" Error : ${streamsnapshot.error}"),
                      ),
                    ),
                  );
                }
                if (streamsnapshot.connectionState == ConnectionState.active) {
                  User _user = streamsnapshot.data;
                  final User _user2 = auth.currentUser;
                  if (_user == null) {
                    return SignInScreen();
                  } else {
                    var id = _user2.uid;
                    print(id);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profilepage(id, 'users'),
                        ),
                      );
                    });
                  }
                }
                return Scaffold(
                  body: Center(
                    child: spinkit,
                  ),
                );
              },
            );
          }
          return Scaffold(
            body: Center(
              child: spinkit,
            ),
          );
        });
  }
}
