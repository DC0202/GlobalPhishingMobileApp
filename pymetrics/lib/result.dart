import 'package:flutter/material.dart';
import 'package:pymetrics/companyName.dart';
import 'package:pymetrics/values.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultForFamiliarity extends StatefulWidget {
  final List<CompanyName> result;
  const ResultForFamiliarity({super.key, required this.result});

  @override
  State<ResultForFamiliarity> createState() => _ResultForFamiliarityState();
}

class _ResultForFamiliarityState extends State<ResultForFamiliarity> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(five, avgFive, Colors.orange),
      ChartData(four, avgFour, Colors.black),
      ChartData(three, avgThree, Colors.amber),
      ChartData(two, avgTwo, Colors.deepPurpleAccent),
      ChartData(one, avgOne, Colors.lightBlueAccent),
    ];
    final List<ChartData1> chartData1 = [
      ChartData1(five, countFive),
      ChartData1(four, countFour),
      ChartData1(three, countThree),
      ChartData1(two, countTwo),
      ChartData1(one, countOne),
    ];
    debugPrint("$countFive");
    debugPrint("$countFour");
    debugPrint("$countThree");
    debugPrint("$countTwo");
    debugPrint("$countOne");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Results of Familiarity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Card Sorting Result in Datatable",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 250.0,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView(
                        children: <Widget>[
                          DataTable(
                            columnSpacing: 10.0,
                            columns: const [
                              DataColumn(
                                  label: Text(
                                'Index',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                              DataColumn(
                                  label: Text(
                                'Company Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text(
                                'Familiarity Rate',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                            ],
                            rows: widget.result.map((e) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      (e.cno + 1).toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e.cName,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e.value,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Pie Chart Data as Percentage%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: SizedBox(
                    height: 200.0,
                    child: SfCircularChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<ChartData, String>(
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                            dataSource: chartData,
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y.round())
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Count Data of each Familiarity Rate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        StackedLineSeries<ChartData1, String>(
                          enableTooltip: true,
                          dataLabelSettings: const DataLabelSettings(
                            labelAlignment: ChartDataLabelAlignment.middle,
                            isVisible: true,
                            showCumulativeValues: true,
                            useSeriesColor: true,
                          ),
                          dataSource: chartData1,
                          xValueMapper: (ChartData1 data, _) => data.x,
                          yValueMapper: (ChartData1 data, _) => data.y,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color = Colors.blue]);
  final String x;
  final double y;
  final Color color;
}

class ChartData1 {
  ChartData1(this.x, this.y);
  final String x;
  final int y;
}
