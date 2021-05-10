import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'basic_page_layout.dart';

User loggedInUSer;

class TakeTestScreen extends StatefulWidget {
  static const String id = "take_test_screen";

  @override
  _TakeTestScreenState createState() => _TakeTestScreenState();
}

class _TakeTestScreenState extends State<TakeTestScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUSer = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return BasicPageLayout(auth: _auth, text: 'Test page');
  }
}
