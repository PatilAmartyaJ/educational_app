import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicPageLayout extends StatelessWidget {
  BasicPageLayout({@required this.auth, @required this.text});
  final FirebaseAuth auth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF83c5be),
      appBar: AppBar(
        backgroundColor: Color(0xff184047),
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
