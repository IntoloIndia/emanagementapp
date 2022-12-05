import 'package:flutter/material.dart';

final TableRow rowSpacer = const TableRow(children: [
  SizedBox(
    height: 15,
  ),
  SizedBox(
    height: 15,
  ),
  SizedBox(
    height: 15,
  ),
 ]
);

class TodayReport extends StatelessWidget {
  TodayReport({super.key});

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
        child: Card(
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
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Product Sold  3"), Text("1700 rs  Total")],
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
      ),
    );
  }
}
