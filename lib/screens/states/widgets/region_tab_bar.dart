import 'package:flutter/material.dart';
import 'package:flutter_covid_ui/common/custom_appbar.dart';
import 'package:flutter_covid_ui/screens/states/widgets/country_list.dart';
import 'package:flutter_covid_ui/screens/states/widgets/states_tab_bar.dart';

class RegionTabBar extends StatefulWidget {
  const RegionTabBar({Key? key}) : super(key: key);

  @override
  State<RegionTabBar> createState() => _RegionTabBar();
}

class _RegionTabBar extends State<RegionTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: CustomAppBar(title: ""),
      body: Column(
        children: [
          Container(
            color: Colors.purple[900],
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: const Text(
              "Statistics",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                labelColor: Colors.purple[900],
                labelStyle: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(text: "My Country"),
                  Tab(
                    text: "World",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                CountryList(),
                MyCountryStates(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCountryStates extends StatelessWidget {
  const MyCountryStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          StatesTabBar(),
        ],
      ),
    );
  }
}
