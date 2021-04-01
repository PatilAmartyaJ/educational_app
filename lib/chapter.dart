import 'package:flutter/material.dart';

class Chapter extends StatelessWidget {
  static String id = "chapter";
  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlue,
      child: Center(
        child: Text(
          "This is Chapter Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
