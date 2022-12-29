import 'package:emanagementapp/view/todayreport.dart';
import 'package:flutter/material.dart';

class MonthlyReport extends StatelessWidget {
  MonthlyReport({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 198, 221),
      appBar: AppBar(
        title: const Text(
          "MANGALDEEP CLOTHES LLP",
          style: TextStyle(
              color: Color.fromARGB(255, 224, 134, 233),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(6),
        child: Column(
          children: [
            Card(
              child: Center(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      width: width,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Monthly Reports')))),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Product"),
                        Text("Code"),
                        Text("Price"),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    Table(
                      columnWidths: {

                        0: FractionColumnWidth(.45),
                        1: FractionColumnWidth(.45),
                        2: FractionColumnWidth(.2),
                        
                      },
                      children: [
                        const TableRow(
                          children: [
                            Text("1.T-shirt"),
                            Text("#123456"),
                            Text("1000"),
                          ],
                        ),
                        rowSpacer,
                        const TableRow(children: [
                          Text("2.Shirt"),
                          Text("#123652"),
                          Text("200"),
                        ]),
                        rowSpacer,
                        const TableRow(
                          children: [
                            Text("3.Boxer"),
                            Text("#126555"),
                            Text("500"),
                          ],
                        ),
                        rowSpacer,
                        const TableRow(
                          children: [
                            Text("4.jeans"),
                            Text("#126555"),
                            Text("9000"),
                          ],
                        ),
                        rowSpacer,
                        const TableRow(
                          children: [
                            Text("5.Lower"),
                            Text("#126555"),
                            Text("800"),
                          ],
                        ),
                        rowSpacer,
                        const TableRow(
                          children: [
                            Text("6.Boxer"),
                            Text("#126555"),
                            Text("700"),
                          ],
                        ),
                        rowSpacer,
                        const TableRow(
                          children: [
                            Text("7.Lehanga"),
                            Text("#126555"),
                            Text("600"),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Sold  3"),
                        Text("1700 rs  Total")
                      ],
                    )
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: const [
                    //     Flexible(child: Text("1.T-shirt")),
                    //     Flexible(child: Text("#123456")),
                    //     Flexible(child: Text("1000")),
                    //   ],
                    // ),
                    // Row(
                    //   // mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   // crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: const [
                    //     Flexible(child: Text("1.T-asd")),
                    //     Flexible(child: Text("#123456")),
                    //     Flexible(child: Text("1000")),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
