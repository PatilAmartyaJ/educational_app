import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NTSE%20Screens/NTSEHome.dart';
import 'package:flutter_application_1/PCB%20Screens/PCBHome.dart';
import 'package:flutter_application_1/PCM%20Screens/PCMHome.dart';
import 'package:flutter_application_1/PCMB%20Screens/PCMBHome.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:flutter_application_1/SearchEngine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Components/drawer.dart';
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
  final _auth = FirebaseAuth.instance;
  String id;
  String cName;
  bool spinkit2 = false;
  int ca = 0;
  @override
  Widget build(BuildContext context) {
    id = widget.id;
    print(id);
    cName = widget.collectionName;
    print(cName);
    CollectionReference _demo = FirebaseFirestore.instance.collection('users');
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
                } else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.hasData) {
                  var docData = snapshot.data;

                  return SafeArea(
                      child: Scaffold(
                          drawer: DrawerWidget(
                            email: docData['Email'],
                            name: docData['Full Name'],
                            auth: _auth,
                          ),
                          body: Builder(
                              builder: (context) => Container(
                                    child: Column(
                                      children: <Widget>[
                                        ElevatedButton(
                                            onPressed: () async {
                                              if (docData['Standard'] ==
                                                  "10Th NTSE") {
                                                setState(() {
                                                  ca = 1;
                                                });
                                              } else if (docData['Standard'] ==
                                                  "+1,+2 IIT JEE (PCM)") {
                                                setState(() {
                                                  ca = 2;
                                                });
                                              } else if (docData['Standard'] ==
                                                  "+1,+2 NEET,AIIMS (PCB)") {
                                                setState(() {
                                                  ca = 3;
                                                });
                                              } else if (docData['Standard'] ==
                                                  "+1,+2 PCMB") {
                                                setState(() {
                                                  ca = 4;
                                                });
                                              } else {
                                                setState(() {
                                                  spinkit2 = true;
                                                });
                                              }
                                              print(ca);
                                              await returnsStandard(
                                                  context, ca);
                                            },
                                            child: Text("Go to dashboard")),
                                      ],
                                    ),
                                  ))));
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

  Future returnsStandard(BuildContext context, int st) async {
    try {
      if (st == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NTSEHome(id, "users"),
          ),
        );
      } else if (st == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PCMHome(id, 'users'),
          ),
        );
      } else if (st == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PCBHome(id, 'users'),
          ),
        );
      } else if (st == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PCMBHome(id, 'users'),
          ),
        );
      }
    } catch (error) {
      setState(() {
        spinkit2 = false;
      });
      print(error.message);
      // print(getMessageFromErrorCode(error));
      Alert(
        context: context,
        title: 'Error',
        desc: error.message,
        buttons: [
          DialogButton(
            child: Text('Try Again'),
            onPressed: () => Navigator.pop(context),
            width: 100,
          ),
        ],
      ).show();
    }
  }
}
