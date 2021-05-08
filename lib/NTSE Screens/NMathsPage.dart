import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CirculartabIndicator.dart';
import 'package:flutter_application_1/NTSE%20Screens/MathsScreens/Nma1.dart';
import 'package:flutter_application_1/NTSE%20Screens/MathsScreens/Nma2.dart';

class NMathsPage extends StatefulWidget {
  NMathsPage(this.nm1Color);
  Color nm1Color;
  @override
  _NMathsPageState createState() => _NMathsPageState();
}

class _NMathsPageState extends State<NMathsPage>
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
      widget.nm1Color;
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
                    "Algebra",
                    style: TextStyle(
                      color: _tabController.index == 0
                          ? widget.nm1Color
                          : Colors.grey,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Geometry",
                    style: TextStyle(
                      color: _tabController.index == 1
                          ? widget.nm1Color
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
              Nma1(),
              Nma2(),
            ],
          ),
        ));
  }
}
