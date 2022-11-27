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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: Container(
              height: 180,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 74,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: const Text('Sold Items',
                            style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: const Text('Score',
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Today\'s : ',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 180,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 74,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: const Text('Sold Items',
                            style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: const Text('Score',
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Monthly :',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 180,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 74,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: const Text('Sold Items',
                            style: TextStyle(fontSize: 18)),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: const Text('Score',
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Yearly :',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
