import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class SearchEngine extends StatefulWidget {
  static String id = "SearchEngine";
  @override
  _SearchEngineState createState() => _SearchEngineState();
}

class _SearchEngineState extends State<SearchEngine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(
      "This one is serach Engine",
      style: TextStyle(color: Colors.white),
    ));
  }
}
