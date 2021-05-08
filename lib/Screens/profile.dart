import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NTSE%20Screens/NTSEHome.dart';
import 'package:flutter_application_1/PCB%20Screens/PCBHome.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';

import '../constants.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Profilepage extends StatefulWidget {
  final String id;
  final String collectionName;
  Profilepage(this.id, this.collectionName);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<Profilepage> {
  String id;
  String cName;

  @override
  Widget build(BuildContext context) {
    id = widget.id;
    print(id);
    cName = widget.collectionName;
    print(cName);
    CollectionReference _demo = FirebaseFirestore.instance.collection(cName);
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
              stream: _demo.doc(id).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error : ${snapshot.error}"),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.hasData) {
                  var docData = snapshot.data;
                  var userStandard = docData['Standard'];
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: SafeArea(
                        child: Scaffold(
                            drawer: Drawer(),
                            body: Builder(
                                builder: (context) => Container(
                                      child: Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                if (userStandard ==
                                                    "10Th NTSE") {
                                                  Navigator.pushNamed(
                                                      context, NTSEHome.id);
                                                } else if (userStandard ==
                                                    "+1,+2 IIT JEE (PCM)") {
                                                  Navigator.pushNamed(
                                                      context, NTSEHome.id);
                                                } else if (userStandard ==
                                                    "+1,+2 NEET,AIIMS (PCB)") {
                                                  Navigator.pushNamed(
                                                      context, PCBHome.id);
                                                } else if (userStandard ==
                                                    "+1,+2 PCMB") {
                                                  Navigator.pushNamed(
                                                      context, NTSEHome.id);
                                                } else {
                                                  Navigator.pushNamed(context,
                                                      WelcomeScreen.id);
                                                }
                                              },
                                              child: Text("Go to DashBoard"))
                                        ],
                                      ),
                                    )))),
                  );
                }

                return Scaffold(
                  body: Center(
                    child: spinkit,
                  ),
                );
              })
        ],
      ),
    );
  }
}
