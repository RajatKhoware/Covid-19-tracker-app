import 'package:flutter/material.dart';
import 'package:flutter_covid_ui/models/world_model.dart';
import 'package:flutter_covid_ui/screens/states/widgets/states_grid.dart';
import 'package:flutter_covid_ui/services/states_services.dart';

import 'chart_data.dart';

class StatesTabBar extends StatefulWidget {
  const StatesTabBar({Key? key}) : super(key: key);

  @override
  State<StatesTabBar> createState() => _StatesTabBarState();
}

class _StatesTabBarState extends State<StatesTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          //  height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.white24,
              tabs: const [
                Tab(text: "Total"),
                Tab(text: "Today"),
                Tab(text: "Yesterday"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 460,
          child: Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                TotalStates(),
                TodayStates(),
                YesterdayStates(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TotalStates extends StatefulWidget {
  const TotalStates({Key? key}) : super(key: key);

  @override
  State<TotalStates> createState() => _TotalStates();
}

class _TotalStates extends State<TotalStates> {
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return FutureBuilder(
      future: statesServices.fetchWorldStateRecords(),
      builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
        if (!snapshot.hasData) {
          return const Text("");
        } else {
          return Column(
            children: [
              StatesGrid(
                count: (snapshot.data!.cases!.toString()),
                count1: (snapshot.data!.deaths!.toString()),
                count2: (snapshot.data!.recovered!.toString()),
                count3: (snapshot.data!.active!.toString()),
                count4: (snapshot.data!.critical!.toString()),
              ),
              const SizedBox(height: 8),
              const ChartData()
            ],
          );
        }
      },
    );
  }
}

class TodayStates extends StatefulWidget {
  const TodayStates({Key? key}) : super(key: key);

  @override
  State<TodayStates> createState() => _TodayStatesState();
}

class _TodayStatesState extends State<TodayStates> {
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return FutureBuilder(
      future: statesServices.fetchWorldStateRecords(),
      builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
        if (!snapshot.hasData) {
          return const Text("");
        } else {
          return Column(
            children: [
              StatesGrid(
                count: (snapshot.data!.todayCases!.toString()),
                count1: (snapshot.data!.todayDeaths!.toString()),
                count2: (snapshot.data!.todayRecovered!.toString()),
                count3: (snapshot.data!.active!.toString()),
                count4: (snapshot.data!.critical!.toString()),
              ),
              const SizedBox(height: 8),
              const ChartData()
            ],
          );
        }
      },
    );
  }
}

class YesterdayStates extends StatefulWidget {
  const YesterdayStates({Key? key}) : super(key: key);

  @override
  State<YesterdayStates> createState() => _YesterdayStatesState();
}

class _YesterdayStatesState extends State<YesterdayStates> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatesGrid(
          count: "900",
          count1: "1000",
          count2: "1100",
          count3: "1200",
          count4: "1300",
        ),
        const SizedBox(height: 8),
        const ChartData()
      ],
    );
  }
}
