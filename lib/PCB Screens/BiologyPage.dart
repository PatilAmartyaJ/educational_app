import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/chapter.dart';
import 'package:flutter_application_1/constants.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class Biology extends StatefulWidget {
  @override
  _BiologyState createState() => _BiologyState();
}

class _BiologyState extends State<Biology> {
  @override
  Widget build(BuildContext context) {
    print("Biology called");
    return Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("BChapters").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return spinkit;
        }
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot sub = snapshot.data.docs[index];
              int index2 = sub['img'].length;
              print(index2);
              bool _first = true;
              final random = Random();
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChapterView(sub.id, "BChapters", index2),
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
