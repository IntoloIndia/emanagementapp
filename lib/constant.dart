import 'package:flutter/material.dart';

import 'package:emanagementapp/view/Leaves.dart';
import 'package:emanagementapp/view/home.dart';
import 'package:emanagementapp/view/report.dart';
import 'package:flutter/material.dart';

import 'view/stocksmanage.dart';

String action = "Home";
int selectedIndex = 0;
Color iconColor = Color(0xff562B08);
Color appBarTextColor = Color.fromARGB(255, 224, 134, 233);
Color themeColor = Color(0xffF5EFE6);
const Color kGreen = Color.fromARGB(255, 61, 218, 93);
const Color kRed = Color.fromARGB(255, 233, 97, 73);
const Color kBlue = Color.fromARGB(255, 76, 162, 231);
const Color bgColor = Color.fromARGB(255, 216, 198, 221);

List displayScreens = [
  Home(),
  Stocks(),
  const Reports(),
  const Leaves(),
];
