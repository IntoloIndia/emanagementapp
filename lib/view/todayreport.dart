import 'package:flutter/material.dart';

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
        margin: EdgeInsets.all(6),
        height: height * 0.1,
        child: Card(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Product"),
                    Text("Code"),
                    Text("Price"),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    
                  ],                
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
