import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'basic_page_layout.dart';

User loggedInUSer;

class AdvancedChallengesScreen extends StatefulWidget {
  static const String id = "advanced_challenges_screen";

  @override
  _AdvancedChallengesScreenState createState() =>
      _AdvancedChallengesScreenState();
}

class _AdvancedChallengesScreenState extends State<AdvancedChallengesScreen> {
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
    return BasicPageLayout(auth: _auth, text: 'Advanced Challenges page');
  }
}
