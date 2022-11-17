import 'package:carousel_slider/carousel_slider.dart';
import 'package:emanagementapp/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 5,
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.1,
                      padding: EdgeInsets.all(height * 0.005),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Today's Sales",
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
                                "750",
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
                      width: width * 0.3,
                      height: height * 0.1,
                      padding: EdgeInsets.all(height * 0.005),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Monthly Sales",
                                style: TextStyle(
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            Text(
                              "10000",
                              style: TextStyle(
                                fontSize: height * 0.02,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                        print(selectedIndex);
                      });
                    },
                    child: Material(
                      elevation: 5,
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.1,
                        padding: EdgeInsets.all(height * 0.005),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Stocks",
                                  style: TextStyle(
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              Container(
                                // color: Colors.black54,
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: height * 0.02,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
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
            //                                   Row(
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
      ),
    );
  }
}
