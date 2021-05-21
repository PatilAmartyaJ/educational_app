import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CirculartabIndicator.dart';
import 'package:flutter_application_1/NTSE%20Screens/MentalAbilityScreens/Nm1.dart';
import 'package:flutter_application_1/NTSE%20Screens/MentalAbilityScreens/Nm2.dart';
import 'package:flutter_application_1/NTSE%20Screens/MentalAbilityScreens/Nm3.dart';

class NMentalAbilityTab extends StatefulWidget {
  NMentalAbilityTab(this.nm1Color);
  final Color nm1Color;
  @override
  _NMentalAbilityTabState createState() => _NMentalAbilityTabState();
}

class _NMentalAbilityTabState extends State<NMentalAbilityTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Color nm1Color;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      nm1Color = widget.nm1Color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
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
                    "Verbal Reasoning",
                    style: TextStyle(
                      color: _tabController.index == 0 ? nm1Color : Colors.grey,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Non-Verbal Reasoning",
                    style: TextStyle(
                      color: _tabController.index == 1 ? nm1Color : Colors.grey,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Logical and Analytical Reasoning",
                    style: TextStyle(
                      color: _tabController.index == 2 ? nm1Color : Colors.grey,
                    ),
                  )),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Nm1(),
              Nm2(),
              Nm3(),
            ],
          ),
        ));
  }
}
