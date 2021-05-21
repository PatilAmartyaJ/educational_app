import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Components/drawer.dart';

import 'package:flutter_application_1/PCB%20Screens/PhysicsPage.dart';
import 'package:flutter_application_1/PCB%20Screens/ChemistryPage.dart';
import 'package:flutter_application_1/PCB%20Screens/BiologyPage.dart';
import 'package:flutter_application_1/SearchEngine.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';


import '../constants.dart';

class PCBHome extends StatefulWidget {
  PCBHome(this.id, this.collectionName);

  final String id;
  final String collectionName;


  @override
  _PCBHomeState createState() => _PCBHomeState();
}

class _PCBHomeState extends State<PCBHome> {
  List<String> l = ["Physics", "Chemistry", "Biology"];


  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

  final Color moreDark = Color.fromARGB(255, 20, 32, 50);

  final _auth = FirebaseAuth.instance;

  String name;
  String email;
  DocumentSnapshot ds;

  getDetails() async {
    ds = await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(widget.id)
        .get();
    setState(() {
      name = ds.data()['Full Name'];
      email = ds.data()['Email'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: FutureBuilder(
          future: getDetails(),
          builder: (context, snapshot) {
            if (ds.data() != null) {
              return DefaultTabController(
                length: l.length,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("PCB"),
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
                  drawer: DrawerWidget(
                    email: email,
                    name: name,
                    auth: _auth,
                  ),
                  body: SpinCircleBottomBarHolder(
                    bottomNavigationBar: SCBottomBarDetails(
                        iconTheme: IconThemeData(color: Colors.white),
                        activeIconTheme: IconThemeData(color: Colors.teal),
                        titleStyle:
                            TextStyle(color: Colors.white, fontSize: 10),
                        activeTitleStyle: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                        circleColors: [
                          Colors.white,
                          Colors.orange,
                          Colors.redAccent
                        ],
                        actionButtonDetails: SCActionButtonDetails(
                            color: Colors.red,
                            icon: Icon(Icons.expand_less),
                            elevation: 0.0),
                        backgroundColor: moreDark,
                        items: <SCBottomBarItem>[
                          SCBottomBarItem(
                              icon: Icons.home,
                              onPressed: () {},
                              title: "Home"),
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
                              icon: Icons.history,
                              onPressed: () {},
                              title: "History")
                        ],
                        circleItems: <SCItem>[
                          SCItem(icon: Icon(Icons.search), onPressed: () {}),
                        ]),
                    child: Container(
                        color: Colors.grey.withAlpha(100),
                        child: TabBarView(
                          children: <Widget>[Physics(), Chemistry(), Biology()],
                        )),
                  ),
                ),
              );
            }
            return Scaffold(
              body: Center(
                child: spinkit,
              ),
            );
          }),
    );
  }
}
