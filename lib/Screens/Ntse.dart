import 'package:flutter/material.dart';
import 'package:flutter_application_1/NTSE%20Screens/NGeographyPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NHistoryPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NMathsPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NMentalAbilityPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NSciencePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

class NtsePage extends StatefulWidget {
  @override
  _NtsePageState createState() => _NtsePageState();
}

class _NtsePageState extends State<NtsePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        drawer: ListView(
          children: <Widget>[],
        ),
        body: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Mental Ability"),
                      Tab(text: "Maths"),
                      Tab(text: "Science"),
                      Tab(text: "History"),
                      Tab(text: "Geography")
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                NMentalAbility(),
                NMathsPage(),
                NSciencePage(),
                NHistoryPage(),
                NGeographyPage(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<List<String>> GetSubjects() async {
    print("GetSubjects called");
    List<String> st = [];
    var s = await _db
        .collection('10Th NTSE')
        .doc('Subjects')
        .get()
        .then((DocumentSnapshot ds) {
      return ds.data;
    }).catchError((e) {
      print(e);
    });
    print(s().toString());
    s().forEach((k, v) => st.add((v)));
    print(st);

    return st;
  }
}
