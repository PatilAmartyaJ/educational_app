import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'basic_page_layout.dart';

User loggedInUSer;

class BooksScreen extends StatefulWidget {
  static const String id = "books_screen";

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
    return BasicPageLayout(auth: _auth, text: 'Books page');
  }
}
