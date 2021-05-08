import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/NTSE%20Screens/NGeographyPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NHistoryPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NMathsPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NMentalAbilityPage.dart';
import 'package:flutter_application_1/NTSE%20Screens/NSciencePage.dart';
import 'package:flutter_application_1/SearchEngine.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class NTSEHome extends StatefulWidget {
  static String id = "NTSEHome";

  @override
  _NTSEHomeState createState() => _NTSEHomeState();
}

class _NTSEHomeState extends State<NTSEHome>
    with SingleTickerProviderStateMixin {
  List<String> l = [
    "Mental Ability",
    "Mathematics",
    "Science",
    "History",
    "Geography"
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: l.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
  Color primaryColor = Color.fromARGB(255, 18, 32, 47);

  final Color moreDark = Color.fromARGB(255, 20, 32, 50);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: l.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("NTSE"),
            backgroundColor: primaryColor,
            centerTitle: true,
            bottom: TabBar(
                isScrollable: true,
                indicator: RectangularIndicator(
                  color: Colors.cyanAccent[700],
                  topRightRadius: 25,
                  topLeftRadius: 25,
                  bottomRightRadius: 25,
                  bottomLeftRadius: 25,
                  paintingStyle: PaintingStyle.fill,
                ),
                indicatorWeight: 4.0,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                tabs: [
                  for (int i = 0; i < l.length; i++)
                    Tab(
                      child: Text(l[i]),
                    )
                ]),
          ),
          drawer: Drawer(),
          body: SpinCircleBottomBarHolder(
            bottomNavigationBar: SCBottomBarDetails(
                iconTheme: IconThemeData(color: Colors.white),
                activeIconTheme: IconThemeData(color: Colors.teal),
                titleStyle: TextStyle(color: Colors.white, fontSize: 10),
                activeTitleStyle:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                circleColors: [
                  Colors.cyanAccent[400],
                  Colors.cyanAccent[400],
                  Colors.cyanAccent[400],
                ],
                actionButtonDetails: SCActionButtonDetails(
                    color: Colors.cyanAccent[700],
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
                  NMentalAbilityTab(Colors.white),
                  NMathsPage(Colors.white),
                  NSciencePage(Colors.white),
                  NHistoryPage(Colors.white),
                  NGeographyPage(Colors.white)
                ],
              ),
            ),
          ),
        ));
  }
}
