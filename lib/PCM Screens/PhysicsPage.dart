import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_application_1/chapter.dart';
import 'package:flutter_application_1/constants.dart';
=======

import '../chapter.dart';
import '../constants.dart';
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class PhysicsPage extends StatefulWidget {
  @override
  _PhysicsPageState createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  @override
  Widget build(BuildContext context) {
    print("Physics called");
    return Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("PChapters").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return spinkit;
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot sub = snapshot.data.docs[index];
<<<<<<< HEAD
              int index2 = sub['img'].length;
              print(index2);
              bool _first = true;
              final random = Random();
=======
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
<<<<<<< HEAD
                    setState(() {});
                  },
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChapterView(sub.id, "PChapters", index2),
=======
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapterView(sub.id, "PChapters"),
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133
                      ),
                    );
                  },
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      height: 430,
                      width: 450,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(sub['name'],
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
<<<<<<< HEAD
                            ),
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: AnimatedCrossFade(
                                      duration: Duration(seconds: 6),
                                      reverseDuration: Duration(seconds: 6),
                                      firstChild: Image.network(
                                          sub['img'][random.nextInt(index2)]),
                                      crossFadeState: _first
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      secondChild: Image.network(
                                          sub['img'][random.nextInt(index2)]),
                                    ))),

=======
                            ),

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.network(sub['img']),
                            ),
                            FAProgressBar(
                              currentValue: sub['percentage'],
                              maxValue: 100,
                              direction: Axis.horizontal,
                              backgroundColor: Colors.white,
                              progressColor: Colors.teal,
                              size: 10.0,
                            )
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133
                            // textAlign: TextAlign.center,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    ));
  }
}
