import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:educational_app/ChapterView.dart';
import 'package:educational_app/constants.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MathsPage extends StatefulWidget {
  @override
  _MathsPageState createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  @override
  Widget build(BuildContext context) {
    print("Maths called");
    return Container(
        child: StreamBuilder<QuerySnapshot>(
          stream:
          FirebaseFirestore.instance.collection("MChapters").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return spinkit;
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot sub = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChapterView(sub.id, "MChapters"),
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
