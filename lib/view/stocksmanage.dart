import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/controller/controller.dart';
import 'package:emanagementapp/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../model/filter_category.dart';

class Stocks extends StatefulWidget {
  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  List items1 = [];

  List category = ["Mens", "Womens", "kids"];
  // List category = ["Mens", "Womens", "kids"];
  var cont;

  @override
  void initState() {
    cont = Provider.of<Controller>(context, listen: false);
    Provider.of<Controller>(context, listen: false).getCategoryData();
    Provider.of<Controller>(context, listen: false).getSubCategory();
    Provider.of<Controller>(context, listen: false).getTodaySales();
    Provider.of<Controller>(context, listen: false).getColorCategory();
    Provider.of<Controller>(context, listen: false).getSizeCategory();
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
    final todaySale = Provider.of<Controller>(context, listen: true).category;
    final cont = Provider.of<Controller>(context, listen: true);
    final colorCategory =
        Provider.of<Controller>(context, listen: true).colorModel;
    final sizeCategory =
        Provider.of<Controller>(context, listen: true).sizeModel;

    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
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
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Stock",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  List<String> otherIt = [];
                                  for (int i = 0;
                                      i < availableCategory.data!.length;
                                      i++) {
                                    otherIt.add(availableCategory
                                        .data![i].category
                                        .toString());
                                  }

                                  List<String> otherIt2 = [];
                                  for (int i = 0;
                                      i < availableSubCategory.data!.length;
                                      i++) {
                                    otherIt2.add(availableSubCategory
                                        .data![i].subCategory
                                        .toString());
                                  }

                                  final List<String> otherIt3 = [
                                    "Shirt",
                                    "Shirt",
                                    "Shirt",
                                    "Shirt",
                                  ];
                                  List<String> otherIt4 = [];
                                  for (int i = 0;
                                      i < colorCategory.data!.length;
                                      i++) {
                                    otherIt4.add(colorCategory.data![i].color
                                        .toString());
                                  }

                                  List<String> otherIt5 = [];
                                  for (int i = 0;
                                      i < sizeCategory.data!.length;
                                      i++) {
                                    otherIt5.add(
                                        sizeCategory.data![i].size.toString());
                                  }

                                  final List<String> ab = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Fiters(
                                        category: otherIt,
                                        subCategory: otherIt2,
                                        team: otherIt3,
                                        color: otherIt4,
                                        size: otherIt5,
                                      );
                                    },
                                  );
                                  setState(
                                    () {
                                      items1 = ab;
                                      print("guestDFac");
                                      print(ab);
                                    },
                                  );
                                },
                                child: Icon(Icons.format_list_bulleted),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

  void itemChanges(bool isSelected, String itemValue) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
  }

  void cancel() {
    Navigator.pop(context);
  }

  void submit() {
    Navigator.pop(context, selectedItems);
  }

  void clear() {
    setState(() {
      selectedItems = [];
      Navigator.pop(context, selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("office facility"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  value: selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => itemChanges(isChecked!, item),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: clear,
          child: const Text('clear all'),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
