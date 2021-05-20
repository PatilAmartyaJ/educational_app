import 'package:flutter/material.dart';

import 'package:flutter_application_1/PCB%20Screens/PhysicsPage.dart';
import 'package:flutter_application_1/PCB%20Screens/ChemistryPage.dart';
<<<<<<< HEAD

=======
import 'MathsPage.dart';
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133
import 'package:flutter_application_1/PCB%20Screens/BiologyPage.dart';
import 'package:flutter_application_1/PCMB%20Screens/MathsPage.dart';
import 'package:flutter_application_1/SearchEngine.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

<<<<<<< HEAD
class PCMBHome extends StatefulWidget {
=======
class PCMBHome extends StatelessWidget {
  List<String> l = ["Physics", "Chemistry", "Mathematics", "Biology"];
>>>>>>> ba2b98fa51a7b44b039bdc8dde172a0da0533133
  static String id = "PCMBHome";

  @override
  _PCMBHomeState createState() => _PCMBHomeState();
}

class _PCMBHomeState extends State<PCMBHome> {
  List<String> l = ["Physics", "Chemistry", "Mathematics", "Biology"];

  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

  final Color moreDark = Color.fromARGB(255, 20, 32, 50);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: l.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PCMB"),
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
                children: <Widget>[Physics(), Chemistry(), Maths(), Biology()],
              )),
        ),
      ),
    );
  }
}
