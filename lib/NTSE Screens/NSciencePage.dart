import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CirculartabIndicator.dart';
import 'package:flutter_application_1/NTSE%20Screens/Science%20Screens/Ns1.dart';
import 'package:flutter_application_1/NTSE%20Screens/Science%20Screens/Ns2.dart';

class NSciencePage extends StatefulWidget {
  NSciencePage(this.nsColor);
  Color nsColor;
  @override
  _NSciencePageState createState() => _NSciencePageState();
}

class _NSciencePageState extends State<NSciencePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 4.0,
                indicator: CircleTabIndicator(color: Colors.orange, radius: 3),
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(
                      child: Text(
                    "Science1",
                    style: TextStyle(
                      color: _tabController.index == 0
                          ? widget.nsColor
                          : Colors.grey,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Science2",
                    style: TextStyle(
                      color: _tabController.index == 1
                          ? widget.nsColor
                          : Colors.grey,
                    ),
                  )),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Ns1(),
              Ns2(),
            ],
          ),
        ));
  }
}
