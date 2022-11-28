import 'package:emanagementapp/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stocks extends StatefulWidget {
  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  List items1 = [];

  @override
  void initState() {
    Provider.of<Controller>(context, listen: false).availableStocksData();
    Provider.of<Controller>(context, listen: false).getCategoryData();
    Provider.of<Controller>(context, listen: false).getSubCategory();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final available =
        Provider.of<Controller>(context, listen: true).availableStocks;
    final availableSubCategory =
        Provider.of<Controller>(context, listen: true).subCategory;
    final availableCategory =
        Provider.of<Controller>(context, listen: true).category;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  elevation: 5,
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.12,
                    padding: EdgeInsets.all(height * 0.005),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "100",
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Container(
                            child: Text(
                              "Total Stocks",
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  elevation: 5,
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.12,
                    // padding: EdgeInsets.all(height * 0.005),

                    padding: EdgeInsets.all(height * 0.005),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "10",
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Text(
                            "Low Stocks",
                            style: TextStyle(
                              fontSize: height * 0.02,
                            ),
                          ),
                        ],
                      ),
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
