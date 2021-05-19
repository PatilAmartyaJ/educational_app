import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../SearchEngine.dart';
import 'PhysicsPage.dart';
import 'ChemistryPage.dart';
import 'MathsPage.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class PCMHome extends StatelessWidget {
  List<String> l = [
    "Physics",
    "Chemistry",
    "Mathematics",
  ];
  static String id = "PCMHome";
  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
  final Color moreDark = Color.fromARGB(255, 20, 32, 50);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: l.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PCM"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          centerTitle: true,
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              tabs: [
                for (int i = 0; i < l.length; i++)
                  Tab(
                    child: Text(l[i]),
                  )
              ]),
        ),
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
              iconTheme: IconThemeData(color: Colors.white),
              activeIconTheme: IconThemeData(color: Colors.teal),
              titleStyle: TextStyle(color: Colors.white, fontSize: 10),
              activeTitleStyle:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              circleColors: [Colors.white, Colors.orange, Colors.redAccent],
              actionButtonDetails: SCActionButtonDetails(
                  color: Colors.red,
                  icon: Icon(Icons.expand_less),
                  elevation: 0.0),
              backgroundColor: moreDark,
              items: <SCBottomBarItem>[
                SCBottomBarItem(
                    icon: Icons.home, onPressed: () {}, title: "Home"),
                SCBottomBarItem(
                    icon: Icons.search,
                    onPressed: () {
                      Navigator.pushNamed(context, SearchEngine.id);
                    },
                    title: "Search"),
                SCBottomBarItem(
                    icon: Icons.assignment,
                    onPressed: () {},
                    title: "Take Test"),
                SCBottomBarItem(
                    icon: Icons.history, onPressed: () {}, title: "History")
              ],
              circleItems: <SCItem>[
                SCItem(icon: Icon(Icons.search), onPressed: () {}),
              ]),
          child: Container(
              color: Colors.grey.withAlpha(100),
              child: TabBarView(
                children: <Widget>[
                  PhysicsPage(),
                  ChemistryPage(),
                  MathsPage(),
                ],
              )),
        ),
      ),
    );
  }
}
