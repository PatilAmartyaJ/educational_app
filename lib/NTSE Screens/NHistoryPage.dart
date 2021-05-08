import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CirculartabIndicator.dart';
import 'package:flutter_application_1/NTSE%20Screens/HistoryScreens/NH1.dart';
import 'package:flutter_application_1/NTSE%20Screens/HistoryScreens/NH2.dart';

class NHistoryPage extends StatefulWidget {
  NHistoryPage(this.nhColor);
  Color nhColor;
  @override
  _NHistoryPageState createState() => _NHistoryPageState();
}

class _NHistoryPageState extends State<NHistoryPage>
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
    setState(() {
      widget.nhColor;
    });
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
                    "History",
                    style: TextStyle(
                      color: _tabController.index == 0
                          ? widget.nhColor
                          : Colors.grey,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Polytical science",
                    style: TextStyle(
                      color: _tabController.index == 1
                          ? widget.nhColor
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
              NH1(),
              NH2(),
            ],
          ),
        ));
  }
}
