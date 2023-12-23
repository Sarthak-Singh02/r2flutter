import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:r2flutter/chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map diabetes = {
    'Age': _generateRandomList(25, 70, 50),
    'Gender': _generateGenderList(50),
    'BMI': _generateRandomFloatList(18, 40, 50),
    'Blood_Pressure': _generateRandomList(80, 180, 50),
    'Glucose': _generateRandomList(70, 200, 50),
    'Insulin': _generateRandomList(0, 300, 50),
    'Cholesterol': _generateRandomFloatList(100, 300, 50),
    'HbA1c': _generateRandomFloatList(4, 12, 50),
    'Status': _generateStatusList(50),
  };

  List<List> data = [];

  addToData() {
    for (int i = 0; i < 50; i++) {
      data.add([
        diabetes["Age"][i],
        diabetes["Gender"][i],
        diabetes["BMI"][i],
        diabetes["Blood_Pressure"][i],
        diabetes["Glucose"][i],
        diabetes["Insulin"][i],
        diabetes["Cholesterol"][i],
        diabetes["HbA1c"][i],
        diabetes["Status"][i],
        if (diabetes["Cholesterol"][i] > 115) 1 else 0
      ]);
      diabetes["Status"][i] == "Yes"
          ? measureYes = measureYes + 1
          : measureNo = measureNo + 1;
      histogramData.add(ChartData1(diabetes["Glucose"][i]));
      histogramData2.add(ChartData2(diabetes["Insulin"][i]));
    }
  }

  final List<ChartData1> histogramData = <ChartData1>[];
  final List<ChartData2> histogramData2 = <ChartData2>[];
  @override
  void initState() {
    addToData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2), color: Colors.grey.shade200),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 25,
                            child: Column(
                              children: [
                                Text(
                                  "S.No",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text((index + 1).toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 25,
                            child: Column(
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Age"][index])
                                                    .toInt()
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 35,
                            child: Column(
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Gender"][index])
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 20,
                            child: Column(
                              children: [
                                Text(
                                  "BMI",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["BMI"][index])
                                                    .toString()
                                                    .replaceRange(4, null, ""),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                Text(
                                  "Blood_Pressure",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Blood_Pressure"]
                                                        [index])
                                                    .toInt()
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                Text(
                                  "Glucose",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Glucose"][index])
                                                    .toInt()
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                Text(
                                  "Insulin",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Insulin"][index])
                                                    .toInt()
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 60,
                            child: Column(
                              children: [
                                Text(
                                  "Cholesterol",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Cholesterol"][index])
                                                    .toString()
                                                    .replaceRange(6, null, ""),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                Text(
                                  "HbA1c",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["HbA1c"][index])
                                                    .toString()
                                                    .replaceRange(4, null, ""),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                (diabetes["Status"][index])
                                                    .toString(),
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Cholesterol_Level",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            Text(
                                                diabetes["Cholesterol"][index] >
                                                        115
                                                    ? "1"
                                                    : "0",
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SfCartesianChart(series: <CartesianSeries>[
                HistogramSeries<ChartData1, double>(
                  dataSource: histogramData,
                  yValueMapper: (ChartData1 data, _) => data.y,
                  // yAxisName: "Frequency",
                  // xAxisName: "Glucose",
                ),
              ]),
              SizedBox(
                height: 5,
              ),
              SfCartesianChart(series: <CartesianSeries>[
                HistogramSeries<ChartData2, double>(
                  dataSource: histogramData2,
                  yValueMapper: (ChartData2 data, _) => data.x,
                  enableTooltip: true,
                  isTrackVisible: true,
                  // yAxisName: "Frequency",
                  // xAxisName: "Insulin",
                ),
              ]),
              SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBarO(
                  groupList: ordinalGroup,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int measureYes = 0;
int measureNo = 0;
List<OrdinalData> ordinalList = [
  OrdinalData(domain: 'No', measure: measureNo),
  OrdinalData(domain: 'Yes', measure: measureYes),
];
final ordinalGroup = [
  OrdinalGroup(
    id: '1',
    data: ordinalList,
  ),
];
List<double> _generateRandomList(int min, int max, int length) {
  var random = Random();
  return List.generate(
      length, (index) => min + random.nextInt(max - min + 1).toDouble());
}

List<String> _generateGenderList(int length) {
  var random = Random();
  return List.generate(
      length, (index) => random.nextBool() ? 'Male' : 'Female');
}

List<double> _generateRandomFloatList(double min, double max, int length) {
  var random = Random();
  return List.generate(
      length, (index) => min + random.nextDouble() * (max - min));
}

List<String> _generateStatusList(int length) {
  var random = Random();
  return List.generate(length, (index) => random.nextBool() ? 'Yes' : 'No');
}

void _createHistogram(List<int> data) {
  // Implement histogram creation
  print('Creating histogram for $data');
}

void _createBarPlot(List<String> data) {
  // Implement bar plot creation
  print('Creating bar plot for $data');
}

List<int> _calculateCholesterolLevel(List<double> cholesterol) {
  return List.generate(
      cholesterol.length, (index) => cholesterol[index] > 115 ? 1 : 0);
}
