import 'package:emanagementapp/model/brand_model.dart';
import 'package:emanagementapp/view/stocksmanage.dart';
import 'package:emanagementapp/view/Leaves.dart';
import 'package:flutter/foundation.dart';
import 'package:emanagementapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';
import '../controller/filter_controller.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List items1 = [];

  List<String>? ab;
  // var cont;

  @override
  void initState() {
    var cont = Provider.of<FilterController>(context, listen: false);
    // Provider.of<FilterController>(context, listen: false)
    //     .getListAvailableSubCategory();

    Provider.of<Controller>(context, listen: false).availableStocksData();
    Provider.of<Controller>(context, listen: false).getCategoryData();
    Provider.of<Controller>(context, listen: false).getSubCategory();
    Provider.of<Controller>(context, listen: false).getTodaySales();
    Provider.of<Controller>(context, listen: false).getColorCategory();
    Provider.of<Controller>(context, listen: false).getSizeCategory();
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
    var cont = Provider.of<Controller>(context, listen: false);

    print("object");
    // print(cont.subCategory);

    // final available =
    //     Provider.of<Controller>(context, listen: true).availableStocks;
    final availableSubCategory =
        Provider.of<Controller>(context, listen: true).subCategory;
    final availableCategory =
        Provider.of<Controller>(context, listen: true).category;
    final todaySales =
        Provider.of<Controller>(context, listen: true).todaySales;
    final colorCategory =
        Provider.of<Controller>(context, listen: true).colorModel;
    final sizeCategory =
        Provider.of<Controller>(context, listen: true).sizeModel;

    // print(todaySales.data![0].productCode);

    var containerHeight;

    if (cont.availableStocks.data != null) {
      if (cont.availableStocks.data!.length == 2) {
        containerHeight = height * 0.2;
      } else if (cont.availableStocks.data!.length == 1) {
        containerHeight = height * 0.1;
      } else if (cont.availableStocks.data!.length > 2) {
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
              setState(
                () {
                  tSalesAnimatedheight = height * 0.5;
                  tSalesAnimatedheight = width * 0.4;
                  if (isToday == false) {
                    isToday = true;
                  } else {
                    isToday = false;
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
                                    child: Text(
                                      todaySales.data == null
                                          ? "${0}\u{20B9}"
                                          : "${todaySales.data!.length}\u{20B9}",
                                      style: TextStyle(
                                          // color : Colors.white,
                                          // fontWeight : FontWeight.w600
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
                                      otherIt5.add(sizeCategory.data![i].size
                                          .toString());
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
                    ),
                    if (isToday == true) ...[
                      if (todaySales.data == null) ...{
                        const CircularProgressIndicator()
                      } else ...{
                        for (int i = 0; i < todaySales.data!.length; i++)
                          AnimatedContainer(
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(seconds: 5),
                            // color: Colors.black54,
                            height: tSalesAnimatedheight,
                            width: tSalesAnimatedwidth,
                            child: Column(
                              children: [
                                const Divider(
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
                                      decoration: const BoxDecoration(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "${i + 1} ${todaySales.data![i].product}"),
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
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      // Container(
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //     color: Colors.black,
                                                      //     borderRadius:
                                                      //         BorderRadius
                                                      //             .circular(10),
                                                      //   ),
                                                      //   margin: const EdgeInsets
                                                      //       .only(
                                                      //     top: 3,
                                                      //     left: 5,
                                                      //   ),
                                                      //   padding:
                                                      //       const EdgeInsets
                                                      //               .symmetric(
                                                      //           horizontal: 10,
                                                      //           vertical: 8),
                                                      //   child: const Text(
                                                      //     "2",
                                                      //     style: TextStyle(
                                                      //       color: Colors.white,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        padding:
                                                            const EdgeInsets
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
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text("Price :  600"),
                                                Row(
                                                  children: const [
                                                    Text("11/19/2022"),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("12.00 pm "),
                                                  ],
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
                      }
                    ]
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
                                      otherIt5.add(sizeCategory.data![i].size
                                          .toString());
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
                                    child: Text(
                                      cont.availableStocks.data == null
                                          ? "${0}"
                                          : "${cont.availableStocks.data!.length}",
                                      style: const TextStyle(),
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
                                      otherIt5.add(sizeCategory.data![i].size
                                          .toString());
                                    }

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const BuildFilter()),
                                    // );

                                    final List<String> ab = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Fiters(
                                            category: otherIt,
                                            subCategory: otherIt2,
                                            team: otherIt3,
                                            color: otherIt4,
                                            size: otherIt5,
                                            cate: cont.cateEndPointCahnge,
                                            subCate: cont.subCateEndPointCahnge,
                                            colorCate:
                                                cont.ColorCateEndPointCahnge,
                                            sizeCate:
                                                cont.SizeCateEndPointCahnge,
                                            submit: cont.filterData,
                                            cancel: cont.setValuesEmpty,
                                            brand:
                                                cont.brandCateEndPointCahnge);
                                      },
                                    );

                                    setState(
                                      () {
                                        items1 = ab;
                                        print("guestDFac");
                                        // print(cont.selc);
                                        // print(ab);
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
                      if (cont.availableStocks.data == null) ...[
                        CircularProgressIndicator(),
                      ] else ...[
                        for (int i = 0;
                            i < cont.availableStocks.data!.length;
                            i++) ...{
                          Card(
                            child: ClipPath(
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left:
                                        BorderSide(color: iconColor, width: 5),
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
                                              "${i + 1}.${cont.availableStocks.data![i].product}"),
                                          Container(
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  minRadius: 15,
                                                  backgroundColor: Color(cont
                                                              .availableStocks
                                                              .data![i]
                                                              .color ==
                                                          null
                                                      ? 0xFFFFFFFF
                                                      : int.parse("0xFF" +
                                                          "${cont.availableStocks.data![i].color.toString().substring(1, cont.availableStocks.data![i].color.toString().length)}")),
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
                                                    "${cont.availableStocks.data![i].size}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Price : ${cont.availableStocks.data![i].salesPrice}",
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ]
                    ]
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
                                      otherIt5.add(sizeCategory.data![i].size
                                          .toString());
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
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Fiters extends StatefulWidget {
  List<String> category;
  List<String> subCategory;
  List<String> team;
  List<String> color;
  List<String> size;

  Function? cate;
  Function? subCate;
  Function? colorCate;
  Function? sizeCate;
  Function? submit;
  Function? brand;
  Function? cancel;

  Fiters(
      {required this.category,
      required this.subCategory,
      required this.team,
      required this.color,
      required this.size,
      Function? this.cate,
      Function? this.subCate,
      Function? this.colorCate,
      Function? this.sizeCate,
      Function? this.submit,
      Function? this.cancel,
      Function? this.brand});
  @override
  State<Fiters> createState() => _FitersState();
}

class _FitersState extends State<Fiters> {
  List<String> selectedItems = [];
  List<String> brandsList = [];

  String selectedSubCategory = "SUB-CATEGORY";
  String selectedPeople = "SALES BY";
  String selectedColor = "COLOR";
  String selectedSize = "SIZE";
  String selectedCategory = "CATEGOFY";
  String selectedBrand = "BRAND";

  List ListAvailableSubCategory = [];

  Future? SubCate;

  int availableSubCategoryId = 0;

  Future<void> setSubCategoryId(
      {required String it, required Function fn}) async {
    final response =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}get-category"));
    if (response.statusCode == 200) {
      // final jsonResponse = jsonDecode(response.body);
      final ApiData = categoryFromJson(response.body);

      for (int i = 0; i < ApiData.data!.length; i++) {
        if (ApiData.data![i].category == it) {
          availableSubCategoryId = ApiData.data![i].id!;
          final res = await http.get(Uri.parse(
              "${dotenv.env["APP_URL"]}get-sub-category/$availableSubCategoryId"));
          if (res.statusCode == 200) {
            final sipData = subCategoryFromJson(res.body);

            ListAvailableSubCategory = [];

            for (int i = 0; i < sipData.data!.length; i++) {
              if (ListAvailableSubCategory.contains(
                      sipData.data![i].subCategory) ==
                  false) {
                setState(() {
                  ListAvailableSubCategory.add(sipData.data![i].subCategory);
                });
              }
            }
            print("ListAvailableSubCategory");
            print(ListAvailableSubCategory);
          }
          break;
        }
      }
    } else {}
  }

  Future<void> setBrand() async {
    final response =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}get-brand"));
    if (response.statusCode == 200) {
      final ApiData = brandsModelFromJson(response.body);

      for (int i = 0; i < ApiData.data!.length; i++) {
        brandsList.add(ApiData.data![i].brandName.toString());
      }
    } else {}
  }

  void cancel() {
    Navigator.pop(context);
  }

  void clear() {
    setState(
      () {
        selectedItems = [];
        Navigator.pop(context, selectedItems);
      },
    );
  }

  bool isPresent = false;

  @override
  void initState() {
    setBrand();
    // TODO: implement initState
    super.initState();
  }

  void submit() {
    widget.submit!();
    // filterCont.filterData();
    // filterCont.availableStocksData();
    Navigator.pop(context, selectedItems);

    widget.cancel!();
    // filterCont.setValuesEmpty();
  }

  @override
  Widget build(BuildContext context) {
    var filterCont = Provider.of<Controller>(context, listen: true);
    var cont = Provider.of<FilterController>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("abhishek");
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: const Text("Filter"),
        content: SingleChildScrollView(
          child: Column(
            children: [
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
                      hint: Text(selectedCategory.toString()),
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
                            // cont.setSubCategoryId(items.value.toString());

                            if (items.value != filterCont.selectedCategory) {
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
                        setState(
                          () {
                            setSubCategoryId(
                                it: items.toString(),
                                fn: () {
                                  setState(() {});
                                });

                            selectedCategory = items.toString();
                          },
                        );

                        // filterCont.setSub(items.toString());

                        widget.cate!(items.toString());
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Material(
                    elevation: 5,
                    child: Container(
                      height: height * 0.05,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text(selectedSubCategory),
                          iconDisabledColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          items: ListAvailableSubCategory.asMap()
                              .entries
                              .map((ele) {
                            String value = ele.value;
                            int key = ele.key;

                            return DropdownMenuItem(
                              value: ele.value,
                              onTap: () {
                                if (ele.value != selectedSubCategory) {
                                  selectedItems.add(ele.value);
                                }
                              },
                              child: Text(ele.value),
                            );
                          }).toList(),
                          onChanged: (items) {
                            setState(() {
                              selectedSubCategory = items as String;

                              print(selectedSubCategory);

                              widget.subCate!(selectedSubCategory.toString());
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Material(
                  elevation: 5,
                  child: Container(
                    height: height * 0.05,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(selectedBrand),
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items

                        items: brandsList.asMap().entries.map((ele) {
                          String value = ele.value;
                          int key = ele.key;

                          return DropdownMenuItem(
                            value: ele.value,
                            onTap: () {
                              if (ele.value != selectedBrand) {
                                selectedItems.add(ele.value);
                              }
                            },
                            child: Text(ele.value),
                          );
                        }).toList(),
                        onChanged: (items) {
                          setState(() {
                            selectedBrand = items.toString();
                            widget.brand!(items.toString());
                            print(selectedBrand);
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
                      hint: Text(selectedColor),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: widget.color.asMap().entries.map((items) {
                        String value = items.value;
                        int key = items.key;
                        return DropdownMenuItem(
                          value: items.value,
                          onTap: () {
                            if (items.value != selectedColor) {
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
                          selectedColor = items as String;
                          widget.colorCate!(selectedColor.toString());
                          // filterCont.ColorCateEndPointCahnge(selectedColor);
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
                      hint: Text(selectedSize),
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Color.fromRGBO(255, 255, 255, 1),

                      // Down Arrow Icon

                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items

                      items: widget.size.asMap().entries.map(
                        (items) {
                          String value = items.value;
                          int key = items.key;
                          return DropdownMenuItem(
                            value: items.value,
                            onTap: () {
                              if (items.value != selectedSize) {
                                if (selectedItems.contains(items.value) ==
                                    false) {
                                  selectedItems.add(items.value);
                                }
                              }
                            },
                            child: Text(items.value),
                          );
                        },
                      ).toList(),
                      onChanged: (items) {
                        setState(() {
                          selectedSize = items as String;
                          widget.sizeCate!(selectedSize.toString());
                          // filterCont.SizeCateEndPointCahnge(selectedSize);
                        });
                      },
                    ),
                  ),
                ),
              ),
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
    });
  }
}