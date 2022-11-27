import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/view/Leaves.dart';
import 'package:emanagementapp/view/stocksmanage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List items1 = [];

  @override
  void initState() {
    Provider.of<Controller>(context, listen: false).availableStocksData();
    Provider.of<Controller>(context, listen: false).getCategoryData();
    Provider.of<Controller>(context, listen: false).getSubCategory();
    // TODO: implement initState
    super.initState();
  }

  bool isToday = false;
  bool stockAlert = false;
  bool isAvailable = false;
  bool isTrending = false;
  bool isNote = false;

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

    var containerHeight;

    if (available.data != null) {
      if (available.data!.length == 2) {
        containerHeight = height * 0.2;
      } else if (available.data!.length == 1) {
        containerHeight = height * 0.1;
      } else if (available.data!.length > 2) {
        containerHeight = height * 0.25;
      }
    }
    var tSalesAnimatedheight;
    var tSalesAnimatedwidth;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   margin: EdgeInsets.all(height * 0.01),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Material(
          //         elevation: 5,
          //         child: Container(
          //           width: width * 0.3,
          //           height: height * 0.12,
          //           padding: EdgeInsets.all(height * 0.005),
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Today's Sales",
          //                   style: TextStyle(
          //                     fontSize: height * 0.02,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 const Divider(
          //                   thickness: 2,
          //                 ),
          //                 Container(
          //                   child: Text(
          //                     "750",
          //                     style: TextStyle(
          //                       fontSize: height * 0.02,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Material(
          //         elevation: 5,
          //         child: Container(
          //           width: width * 0.3,
          //           height: height * 0.12,
          //           padding: EdgeInsets.all(height * 0.005),
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     "Monthly Sales",
          //                     style: TextStyle(
          //                         fontSize: height * 0.02,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                 ),
          //                 const Divider(
          //                   thickness: 2,
          //                 ),
          //                 Text(
          //                   "10000",
          //                   style: TextStyle(
          //                     fontSize: height * 0.02,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedIndex = 2;
          //             print(selectedIndex);
          //           });
          //         },
          //         child: Material(
          //           elevation: 5,
          //           child: Container(
          //             width: width * 0.3,
          //             height: height * 0.12,
          //             padding: EdgeInsets.all(height * 0.005),
          //             child: Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     child: Text(
          //                       "Stocks",
          //                       style: TextStyle(
          //                           fontSize: height * 0.02,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                   const Divider(
          //                     thickness: 2,
          //                   ),
          //                   Container(
          //                     // color: Colors.black54,
          //                     child: Text(
          //                       "5",
          //                       style: TextStyle(
          //                         fontSize: height * 0.02,
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(() {
                tSalesAnimatedheight = height * 0.5;
                tSalesAnimatedheight = width * 0.4;
                if (isToday == false) {
                  isToday = true;
                } else {
                  isToday = false;
                }
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            // vertical: height * 0.008,
                            horizontal: width * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Today's Sale",
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.black26,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(5), //<-- SEE HERE
                                  ),
                                  child: Container(
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04),
                                    child: const Text(
                                      "999999 \u{20B9}",
                                      style: TextStyle(
                                          // color: Colors.white,
                                          // fontWeight: FontWeight.w600
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                                    final List<String> ab = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Fiters(
                                            category: otherIt,
                                            subCategory: otherIt2,
                                            team: otherIt3);
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
                    ),
                    if (isToday == true) ...[
                      AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(seconds: 5),
                        // color: Colors.black54,
                        height: tSalesAnimatedheight,
                        width: tSalesAnimatedwidth,
                        child: Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                            Card(
                              child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                          color: iconColor, width: 5),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("1. T-shirt"),
                                            Container(
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    minRadius: 15,
                                                    backgroundColor:
                                                        Colors.blueAccent,
                                                    child: Text(""),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const CircleAvatar(
                                                    minRadius: 15,
                                                    backgroundColor:
                                                        Colors.black87,
                                                    child: Text(
                                                      "XL",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 3,
                                                      left: 5,
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                    child: const Text(
                                                      "2",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Price :  600"),
                                            Container(
                                              child: Row(
                                                children: [
                                                  const Text("11/19/2022"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text("12.00 pm "),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 3),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                    child: const Text(
                                                      "S1",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     side: const BorderSide(
                    //       color: Colors.black12,
                    //     ),
                    //     borderRadius:
                    //         BorderRadius.circular(20.0), //<-- SEE HERE
                    //   ),
                    //   child: Container(
                    //     margin: EdgeInsets.all(10),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("1. T-shirt"),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.black87,
                    //               child: Text(
                    //                 "Xl",
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //             ),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.blueAccent,
                    //               child: Text(""),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("Price :  600"),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                 color: Colors.black54,
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               margin: EdgeInsets.only(top: 3),
                    //               padding: EdgeInsets.all(10),
                    //               child: Text(
                    //                 "S1",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                tSalesAnimatedheight = height * 0.5;
                tSalesAnimatedheight = width * 0.4;
                if (stockAlert == false) {
                  stockAlert = true;
                } else {
                  stockAlert = false;
                }
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    // Divider(
                    //   thickness: 2,
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            // vertical: height * 0.008,
                            horizontal: width * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Stock Alert",
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.black26,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(5), //<-- SEE HERE
                                  ),
                                  child: Container(
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04),
                                    child: const Text(
                                      "10",
                                      style: TextStyle(
                                          // color: Colors.white,
                                          // fontWeight: FontWeight.w600
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                                    final List<String> ab = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Fiters(
                                            category: otherIt,
                                            subCategory: otherIt2,
                                            team: otherIt3);
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
                    ),
                    if (stockAlert == true) ...[
                      const Divider(
                        thickness: 2,
                      ),
                      Card(
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: iconColor, width: 5),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("1. shirt"),
                                      Container(
                                        child: Row(
                                          children: const [
                                            CircleAvatar(
                                              minRadius: 15,
                                              backgroundColor: Colors.red,
                                              child: Text(""),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CircleAvatar(
                                              minRadius: 15,
                                              backgroundColor: Colors.black87,
                                              child: Text(
                                                "L",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price :  600"),
                                      Container(
                                        child: Row(
                                          children: [
                                            const Text("QTY"),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              margin: const EdgeInsets.only(
                                                top: 3,
                                                left: 5,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                              child: const Text(
                                                "2",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     side: const BorderSide(
                    //       color: Colors.black12,
                    //     ),
                    //     borderRadius:
                    //         BorderRadius.circular(20.0), //<-- SEE HERE
                    //   ),
                    //   child: Container(
                    //     margin: EdgeInsets.all(10),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("1. T-shirt"),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.black87,
                    //               child: Text(
                    //                 "Xl",
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //             ),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.blueAccent,
                    //               child: Text(""),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("Price :  600"),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                 color: Colors.black54,
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               margin: EdgeInsets.only(top: 3),
                    //               padding: EdgeInsets.all(10),
                    //               child: Text(
                    //                 "S1",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          // Card(
          //   shape: RoundedRectangleBorder(
          //     side: const BorderSide(
          //       color: Colors.black12, //<-- SEE HERE
          //     ),
          //     borderRadius: BorderRadius.circular(6.0),
          //   ),
          //   margin: const EdgeInsets.all(10),
          //   child: Container(
          //     margin: const EdgeInsets.all(5),
          //     child: Column(
          //       children: [
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: const [
          //               Text(
          //                 "Stock Alert",
          //                 style: TextStyle(
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

          //         // Card(
          //         //   shape: RoundedRectangleBorder(
          //         //     side: const BorderSide(
          //         //       color: Colors.black12,
          //         //     ),
          //         //     borderRadius:
          //         //         BorderRadius.circular(20.0), //<-- SEE HERE
          //         //   ),
          //         //   child: Container(
          //         //     margin: EdgeInsets.all(10),
          //         //     child: Column(
          //         //       children: [
          //         //         Row(
          //         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //           children: [
          //         //             Text("1. T-shirt"),
          //         //             CircleAvatar(
          //         //               minRadius: 15,
          //         //               backgroundColor: Colors.black87,
          //         //               child: Text(
          //         //                 "Xl",
          //         //                 style: TextStyle(color: Colors.white),
          //         //               ),
          //         //             ),
          //         //             CircleAvatar(
          //         //               minRadius: 15,
          //         //               backgroundColor: Colors.blueAccent,
          //         //               child: Text(""),
          //         //             )
          //         //           ],
          //         //         ),
          //         //         Row(
          //         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //           children: [
          //         //             Text("Price :  600"),
          //         //             Container(
          //         //               decoration: BoxDecoration(
          //         //                 color: Colors.black54,
          //         //                 borderRadius: BorderRadius.circular(10),
          //         //               ),
          //         //               margin: EdgeInsets.only(top: 3),
          //         //               padding: EdgeInsets.all(10),
          //         //               child: Text(
          //         //                 "S1",
          //         //                 style: TextStyle(
          //         //                   color: Colors.white,
          //         //                 ),
          //         //               ),
          //         //             ),
          //         //           ],
          //         //         )
          //         //       ],
          //         //     ),
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  tSalesAnimatedheight = height * 0.5;
                  tSalesAnimatedheight = width * 0.4;
                  if (isAvailable == false) {
                    isAvailable = true;
                  } else {
                    isAvailable = false;
                  }
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    // Divider(
                    //   thickness: 2,
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            // vertical: height * 0.008,
                            horizontal: width * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Available Stocks",
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.black26,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(5), //<-- SEE HERE
                                  ),
                                  child: Container(
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04),
                                    child: const Text(
                                      "100 ",
                                      style: TextStyle(
                                          // color: Colors.white,
                                          // fontWeight: FontWeight.w600
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                                    final List<String> ab = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Fiters(
                                            category: otherIt,
                                            subCategory: otherIt2,
                                            team: otherIt3);
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
                    ),
                    if (isAvailable == true) ...[
                      if (available.data == null) ...[
                        CircularProgressIndicator(),
                      ] else ...[
                        Container(
                          height: containerHeight,
                          width: width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: available.data!.length,
                            itemBuilder: (context, i) {
                              // num col = 0xFF + cont.data![i].color as int;
                              return Card(
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3))),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: iconColor, width: 5),
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "${i + 1}.${available.data![i].product}"),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      minRadius: 15,
                                                      backgroundColor: Color(
                                                          int.parse("0xFF" +
                                                              "${available.data![i].color.toString().substring(1, available.data![i].color.toString().length)}")),
                                                      child: Text(""),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CircleAvatar(
                                                      minRadius: 15,
                                                      backgroundColor:
                                                          Colors.black87,
                                                      child: Text(
                                                        "${available.data![i].size}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Price : ${available.data![i].price}",
                                              ),
                                              Row(
                                                children: [
                                                  const Text("QTY"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black87,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 3,
                                                      left: 5,
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                    child: const Text(
                                                      "2",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]
                    ]
                  ],
                ),
              ),
            ),
          ),

          // Card(
          //   shape: RoundedRectangleBorder(
          //     side: const BorderSide(
          //       color: Colors.black12, //<-- SEE HERE
          //     ),
          //     borderRadius: BorderRadius.circular(6.0),
          //   ),
          //   margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          //   child: Container(
          //     margin: const EdgeInsets.all(5),
          //     child: Column(
          //       children: [
          //         // Divider(
          //         //   thickness: 2,
          //         // ),
          //         Align(
          //           alignment: Alignment.topLeft,
          //           child: Container(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 const Text(
          //                   "Available Stock",
          //                   style: TextStyle(
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 GestureDetector(
          //                     onTap: () async {
          //                       List<String> otherIt = [];
          //                       for (int i = 0;
          //                           i < availableCategory.data!.length;
          //                           i++) {
          //                         otherIt.add(availableCategory
          //                             .data![i].category
          //                             .toString());
          //                       }

          //                       List<String> otherIt2 = [];
          //                       for (int i = 0;
          //                           i < availableSubCategory.data!.length;
          //                           i++) {
          //                         otherIt2.add(availableSubCategory
          //                             .data![i].subCategory
          //                             .toString());
          //                       }

          //                       final List<String> otherIt3 = [
          //                         "Shirt",
          //                         "Shirt",
          //                         "Shirt",
          //                         "Shirt",
          //                       ];

          //                       final List<String> ab = await showDialog(
          //                         context: context,
          //                         builder: (BuildContext context) {
          //                           return Fiters(
          //                               category: otherIt,
          //                               subCategory: otherIt2,
          //                               team: otherIt3);
          //                         },
          //                       );
          //                       setState(() {
          //                         items1 = ab;
          //                         print("guestDFac");
          //                         print(ab);
          //                       });
          //                     },
          //                     child: Icon(Icons.format_list_bulleted))
          //               ],
          //             ),
          //           ),
          //         ),
          //         const Divider(
          //           thickness: 2,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              setState(() {
                tSalesAnimatedheight = height * 0.5;
                tSalesAnimatedheight = width * 0.4;
                if (isTrending == false) {
                  isTrending = true;
                } else {
                  isTrending = false;
                }
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    // Divider(
                    //   thickness: 2,
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            // vertical: height * 0.008,
                            horizontal: width * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Products In Trend",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.black26,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(5), //<-- SEE HERE
                                  ),
                                  child: Container(
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04),
                                    child: const Text(
                                      "5",
                                      style: TextStyle(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
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
                                    final List<String> ab = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Fiters(
                                            category: otherIt,
                                            subCategory: otherIt2,
                                            team: otherIt3);
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
                    ),
                    if (isTrending == true) ...[
                      const Divider(
                        thickness: 2,
                      ),
                    ]
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     side: const BorderSide(
                    //       color: Colors.black12,
                    //     ),
                    //     borderRadius:
                    //         BorderRadius.circular(20.0), //<-- SEE HERE
                    //   ),
                    //   child: Container(
                    //     margin: EdgeInsets.all(10),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("1. T-shirt"),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.black87,
                    //               child: Text(
                    //                 "Xl",
                    //                 style: TextStyle(color: Colors.white),
                    //               ),
                    //             ),
                    //             CircleAvatar(
                    //               minRadius: 15,
                    //               backgroundColor: Colors.blueAccent,
                    //               child: Text(""),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text("Price :  600"),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                 color: Colors.black54,
                    //                 borderRadius: BorderRadius.circular(10),
                    //               ),
                    //               margin: EdgeInsets.only(top: 3),
                    //               padding: EdgeInsets.all(10),
                    //               child: Text(
                    //                 "S1",
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                tSalesAnimatedheight = height * 0.5;
                tSalesAnimatedheight = width * 0.4;
                if (isNote == false) {
                  isNote = true;
                } else {
                  isNote = false;
                }
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        padding: EdgeInsets.symmetric(
                            // vertical: height * 0.008,
                            horizontal: width * 0.008),
                        child: Text(
                          "Note Sheet and Chat",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  if (isNote == true) ...[
                    const Divider(
                      height: 0,
                      thickness: 2,
                    ),
                    Container(
                      height: height * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          Container(),
                        ],
                      ),
                    )
                  ],
                  // const SizedBox(
                  //   height: 300,
                  // )
                ]),
              ),
            ),
          )
          // Material(
          //   elevation: 5,
          //   child: Container(
          //       margin: EdgeInsets.all(10),
          //       width: width,
          //       height: height * 0.4,
          //       child: CarouselSlider(
          //         options: CarouselOptions(
          //           height: 400,
          //           aspectRatio: 16 / 9,
          //           viewportFraction: 0.8,
          //           initialPage: 0,
          //           enableInfiniteScroll: true,
          //           reverse: false,
          //           autoPlay: true,
          //           autoPlayInterval: Duration(seconds: 2),
          //           autoPlayAnimationDuration: Duration(milliseconds: 800),
          //           autoPlayCurve: Curves.fastOutSlowIn,
          //           enlargeCenterPage: true,
          //           scrollDirection: Axis.horizontal,
          //         ),
          //         items: [
          //           "assets/image/download.jpg",
          //           "assets/image/image.jpg",
          //           "assets/image/images.jpg"
          //         ].map((i) {
          //           return Builder(
          //             builder: (BuildContext context) {
          //               return Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
          //                 child: Image.asset(
          //                   i,
          //                   fit: BoxFit.fill,
          //                 ),
          //               );
          //             },
          //           );
          //         }).toList(),
          //       )),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: Material(
          //     // color: Color.fromARGB(255, 0, 109, 164),
          //     borderRadius: BorderRadius.circular(10),
          //     elevation: 5,
          //     child: Column(
          //       children: [
          //         Container(
          //           width: width,
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 10, horizontal: 4),
          //           margin: const EdgeInsets.symmetric(horizontal: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: const [
          //               Text(
          //                 "Today's Sales",
          //                 style: TextStyle(
          //                     fontSize: 24, fontWeight: FontWeight.bold),
          //               ),
          //               Icon(Icons.format_list_bulleted)
          //             ],
          //           ),
          //         ),
          //         const Divider(
          //           thickness: 2,
          //         ),
          //         Container(
          //           color: Colors.white,
          //           margin: const EdgeInsets.symmetric(
          //             horizontal: 8,
          //             vertical: 8,
          //           ),
          //           height: height * 0.4,
          //           child: ListView.builder(
          //             itemCount: 10,
          //             itemBuilder: (context, index) {
          //               return Container(
          //                 height: height * 0.15,
          //                 width: 0.2,
          //                 // padding: EdgeInsets.symmetric(horizontal: 10),
          //                 child: Card(
          //                   child: Row(
          //                     mainAxisAlignment:
          //                         MainAxisAlignment.spaceEvenly,
          //                     children: <Widget>[
          //                       Expanded(
          //                         child: Container(
          //                           padding: EdgeInsets.all(8),
          //                           child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   const Text(
          //                                     "T-Shirt ",
          //                                     style: TextStyle(
          //                                         fontWeight:
          //                                             FontWeight.bold),
          //                                   ),
          //                                 Row(
          //                                     children: [
          //                                       const Text(
          //                                         "QTY",
          //                                         style: TextStyle(
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ),
          //                                       Card(
          //                                         color: Colors.blue,
          //                                         child: SizedBox(
          //                                           child: Container(
          //                                             padding:
          //                                                 const EdgeInsets
          //                                                         .symmetric(
          //                                                     horizontal: 20,
          //                                                     vertical: 8),
          //                                             child: const Text(
          //                                               "1",
          //                                               style: TextStyle(
          //                                                 color: Colors.white,
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       )
          //                                     ],
          //                                   )
          //                                 ],
          //                               ),
          //                               const Text(
          //                                 "Here we can add the  description about the products",
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: Material(
          //     // color: Color.fromARGB(255, 0, 109, 164),
          //     borderRadius: BorderRadius.circular(10),
          //     elevation: 5,
          //     child: Column(
          //       children: [
          //         Container(
          //           width: width,
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 10, horizontal: 4),
          //           margin: const EdgeInsets.symmetric(horizontal: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: const [
          //               Text(
          //                 "Available's Quantity",
          //                 style: TextStyle(
          //                     fontSize: 24, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const Divider(
          //           thickness: 2,
          //         ),
          //         Container(
          //           color: Colors.white,
          //           margin: const EdgeInsets.symmetric(
          //             horizontal: 8,
          //             vertical: 8,
          //           ),
          //           height: height * 0.4,
          //           child: ListView.builder(
          //             itemCount: 10,
          //             itemBuilder: (context, index) {
          //               return Container(
          //                 height: height * 0.15,
          //                 width: 0.2,
          //                 //padding: EdgeInsets.symmetric(horizontal: 10),
          //                 child: Card(
          //                   child: Row(
          //                     mainAxisAlignment:
          //                         MainAxisAlignment.spaceEvenly,
          //                     children: <Widget>[
          //                       Expanded(
          //                         child: Container(
          //                           padding: EdgeInsets.all(8),
          //                           child: Column(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   const Text(
          //                                     "T-Shirt ",
          //                                     style: TextStyle(
          //                                         fontWeight:
          //                                             FontWeight.bold),
          //                                   ),
          //                                   Row(
          //                                     children: [
          //                                       const Text(
          //                                         "QTY",
          //                                         style: TextStyle(
          //                                             fontWeight:
          //                                                 FontWeight.bold),
          //                                       ),
          //                                       Card(
          //                                         color: const Color.fromARGB(
          //                                             255, 0, 109, 164),
          //                                         child: SizedBox(
          //                                           child: Container(
          //                                             padding:
          //                                                 const EdgeInsets
          //                                                         .symmetric(
          //                                                     horizontal: 20,
          //                                                     vertical: 8),
          //                                             child: const Text(
          //                                               "5",
          //                                               style: TextStyle(
          //                                                 color: Colors.white,
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ),
          //                                       )
          //                                     ],
          //                                   )
          //                                 ],
          //                               ),
          //                               const Text(
          //                                 "Here we can add the  description about the products",
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Fiters extends StatefulWidget {
  List<String> category;
  List<String> subCategory;
  List<String> team;
  Fiters(
      {required this.category, required this.subCategory, required this.team});
  @override
  State<Fiters> createState() => _FitersState();
}

class _FitersState extends State<Fiters> {
  List<String> selectedItems = [];
  String selectedCategory = "CATEGOFY";
  String selectedSubCategory = "SUB-CATEGORY";
  String selectedPeople = "SALES BY";

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

  bool isPresent = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: const Text("Filter"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Text("Category"),
            // SizedBox(
            //   height: 10,
            // ),
            Center(
              child: Material(
                elevation: 5,
                child: Container(
                  height: height * 0.05,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      // Initial Value
                      // value: dropdownvalue,
                      hint: Text(selectedCategory),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: widget.category.asMap().entries.map((items) {
                        String value = items.value;
                        int key = items.key;
                        return DropdownMenuItem(
                          value: items.value,
                          onTap: () {
                            if (items.value != selectedCategory) {
                              if (selectedItems.contains(items.value) ==
                                  false) {
                                selectedItems.add(items.value);
                              }
                            }
                          },
                          child: Text(items.value),
                        );
                      }).toList(),
                      onChanged: (items) {
                        setState(() {
                          selectedCategory = items as String;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              child: Container(
                height: height * 0.05,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    // Initial Value
                    // value: dropdownvalue,
                    hint: Text(selectedSubCategory),
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items

                    items: widget.subCategory.asMap().entries.map((items) {
                      String value = items.value;
                      int key = items.key;

                      return DropdownMenuItem(
                        value: items.value,
                        onTap: () {
                          if (items.value != selectedSubCategory) {
                            selectedItems.add(items.value);
                            for (int i = 0; i < selectedItems.length; i++) {
                              for (int j = 0;
                                  j < widget.subCategory.length;
                                  j++) {
                                if (selectedItems[i] == items.value) {
                                  isPresent = true;
                                  break;
                                } else {
                                  // if(selectedItems)
                                  selectedItems.remove(widget.subCategory[j]);
                                }
                              }
                              if (isPresent == true) {
                                isPresent = false;
                                break;
                              }
                            }
                          }
                        },
                        child: Text(items.value),
                      );
                    }).toList(),
                    onChanged: (items) {
                      setState(() {
                        selectedSubCategory = items as String;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              child: Container(
                height: height * 0.05,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    // Initial Value
                    // value: dropdownvalue,
                    hint: Text(selectedPeople),
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items

                    items: widget.team.asMap().entries.map((items) {
                      String value = items.value;
                      int key = items.key;
                      return DropdownMenuItem(
                        value: items.value,
                        onTap: () {
                          if (items.value != selectedSubCategory) {
                            if (selectedItems.contains(items.value) == false) {
                              selectedItems.add(items.value);
                            }
                          }
                        },
                        child: Text(items.value),
                      );
                    }).toList(),
                    onChanged: (items) {
                      setState(() {
                        selectedPeople = items as String;
                      });
                    },
                  ),
                ),
              ),
            ),
            // ListBody(
            //   children: widget.category
            //       .map(
            //         (item) => CheckboxListTile(
            //           activeColor: iconColor,
            //           value: selectedItems.contains(item),
            //           title: Text(item),
            //           controlAffinity: ListTileControlAffinity.leading,
            //           onChanged: (isChecked) => itemChanges(isChecked!, item),
            //         ),
            //       )
            //       .toList(),
            // ),
            // Text("Sold By"),
            // ListBody(
            //   children: widget.subCategory
            //       .map(
            //         (item) => CheckboxListTile(
            //           activeColor: iconColor,
            //           value: selectedItems.contains(item),
            //           title: Text(item),
            //           controlAffinity: ListTileControlAffinity.leading,
            //           onChanged: (isChecked) => itemChanges(isChecked!, item),
            //         ),
            //       )
            //       .toList(),
            //),
          ],
        ),
      ),
      actions: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(iconColor),
          ),
          onPressed: cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(iconColor),
          ),
          onPressed: submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
