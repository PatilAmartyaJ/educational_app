import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class BasicPageLayout extends StatelessWidget {
  BasicPageLayout({@required this.auth, @required this.text});
  final FirebaseAuth auth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(text,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: <Color>[Colors.pink, Colors.blue])),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff184047)),
              child: Row(
                children: [
                  Icon(Icons.logout),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              onPressed: () {
                auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.id);
              }),
        ],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style:
                  GoogleFonts.acme(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
