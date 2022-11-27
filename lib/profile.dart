import 'dart:convert';

import 'package:emanagementapp/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Porfile extends StatefulWidget {
  const Porfile({super.key});

  @override
  State<Porfile> createState() => _PorfileState();
}

class _PorfileState extends State<Porfile> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  var qr;

  var qrcode;
  var data;
  Future<dynamic> fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var loginId = preferences.getInt('login_id');
    var res =
        await http.get(Uri.parse("${dotenv.env["APP_URL"]}user/$loginId"));

    final jsonresponse = jsonDecode(res.body);
    final response = jsonresponse['data'];
    setState(() {
      data = response;
    });
    qrcode = data['qrcode'];
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            // color: const Color.fromARGB(88, 255, 255, 255),
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Id - Card',
                    style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(width: 0.5))),
                                  // width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 12),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['name'].toString().toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 0.5))),
                                // width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                child: Text(
                                  data['email'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border(bottom: BorderSide(width: 0.5))),
                                // width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                child: const Text(
                                  '9300225588',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        child: const Icon(
                          Icons.person,
                          size: 110,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    // padding: const EdgeInsets.all(10),
                    child: QrImage(
                      data: qrcode,
                      version: QrVersions.auto,
                      size: 250.0,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Container(
                //     height: 40,
                //     width: 80,
                //     decoration: BoxDecoration(
                //         color: Colors.redAccent,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: TextButton(
                //         onPressed: () async {
                //           SharedPreferences preferences =
                //               await SharedPreferences.getInstance();
                //           preferences.remove('login_id');
                //           Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const LoginPage(),
                //               ));
                //         },
                //         child: const Text(
                //           'Logout',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w700,
                //               letterSpacing: 1),
                //         )),
                //   ),
                // )
              ],
            ),
          );
  }
}
