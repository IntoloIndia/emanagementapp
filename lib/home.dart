// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Column(children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total Items',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '17',
                          style: TextStyle(fontSize: 30),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Column(children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total Points',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '50',
                          style: TextStyle(fontSize: 30),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
