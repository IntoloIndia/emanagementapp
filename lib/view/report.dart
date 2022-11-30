import 'package:emanagementapp/view/Custom_report.dart';
import 'package:emanagementapp/view/monthly_report.dart';
import 'package:emanagementapp/view/todayreport.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});
  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodayReport()));
            },
            child: Card(
              child: Container(
                height: height * 0.1,
                width: width,
                child: Center(
                    child: Text(
                  "Today Report",
                  style: TextStyle(fontSize: height * 0.03),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MonthlyReport()));
            },
            child: Card(
              child: Container(
                height: height * 0.1,
                width: width,
                child: Center(
                    child: Text(
                  "Monthly Report",
                  style: TextStyle(fontSize: height * 0.03),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomReport()));
            },
            child: Card(
              child: Container(
                height: height * 0.1,
                width: width,
                child: Center(
                    child: Text(
                  "Custom Report",
                  style: TextStyle(fontSize: height * 0.03),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container BuildCard(double height) {
    return Container(
      height: height * 0.1,
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Today's Sales Report",
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {},
                            child: const Icon(Icons.format_list_bulleted),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Sales",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("3000 rs")
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Sold",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("10 pcs"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Low In Stocks",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("5 pcs"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Avialable Stocks",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("5 pcs"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
