import 'package:flutter/material.dart';
import 'package:flutter_covid_ui/models/world_model.dart';
import 'package:flutter_covid_ui/services/states_services.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartData extends StatefulWidget {
  const ChartData({Key? key}) : super(key: key);

  @override
  State<ChartData> createState() => _ChartDataState();
}

class _ChartDataState extends State<ChartData> {
  final colorList = <Color>[
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.lightBlue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Container(
          height: 301,
          width: 500,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "    Daily New Cases",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: statesServices.fetchWorldStateRecords(),
                builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("");
                  } else {
                    return PieChart(
                      dataMap: {
                        "Total":
                            double.parse(snapshot.data!.todayCases.toString()),
                        "Death":
                            double.parse(snapshot.data!.todayCases.toString()),
                        "Recoverd": double.parse(
                            snapshot.data!.todayRecovered.toString()),
                        "Active":
                            double.parse(snapshot.data!.active.toString()),
                        "Critical":
                            double.parse(snapshot.data!.critical.toString()),
                      },
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left),
                      chartRadius: 180,
                      chartType: ChartType.ring,
                      colorList: colorList,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
