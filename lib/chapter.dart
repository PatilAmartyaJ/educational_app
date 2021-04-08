import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ChapterView extends StatefulWidget {
  final String id;
  final String collectionName;
  ChapterView(this.id, this.collectionName);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
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
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: SafeArea(
                        child: Scaffold(
                      drawer: Drawer(),
                      body: CustomScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        slivers: <Widget>[
                          SliverAppBar(
                            iconTheme: IconThemeData(
                              color: Colors.white,
                            ),
                            backgroundColor: darkBlue,
                            expandedHeight: 350,
                            flexibleSpace: FlexibleSpaceBar(
                                background: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Image.network(
                                      "${docData['img']}",
                                      fit: BoxFit.cover,
                                    ),
                                    const DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.0, 0.5),
                                          end: Alignment(0.0, 0.0),
                                          colors: <Color>[
                                            Color(0x60000000),
                                            Color(0x00000000),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                centerTitle: true,
                                title: Text("${docData['name']}"),
                                stretchModes: <StretchMode>[
                                  StretchMode.zoomBackground,
                                  StretchMode.blurBackground,
                                  StretchMode.fadeTitle
                                ]),
                          ),
                          SliverList(
                              delegate: SliverChildListDelegate(<Widget>[
                            Card(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                height: 450,
                                width: 450,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Center(
                                      child: Text("${docData['desc']}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: darkBlue,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]))
                        ],
                      ),
                    )),
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
