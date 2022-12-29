import 'package:emanagementapp/view/customer_bills.dart';
import 'package:flutter/material.dart';

import 'package:emanagementapp/view/Leaves.dart';
import 'package:emanagementapp/view/home.dart';
import 'package:emanagementapp/view/report.dart';

import 'view/stocksmanage.dart';

String action = "Home";
int selectedIndex = 0;
const Color iconColor = Color(0xff562B08);
const Color appBarTextColor = Color.fromARGB(255, 224, 134, 233);
const Color themeColor = Color(0xffF5EFE6);
const Color kGreen = Color.fromARGB(255, 64, 255, 102);
const Color kRed = Color.fromARGB(255, 255, 90, 60);
const Color kBlue = Color.fromARGB(255, 77, 175, 255);
const Color bgColor = Color.fromARGB(255, 216, 198, 221);
const Color fontColor = Color.fromARGB(255, 224, 134, 233);

bool admLogin = true;

List displayScreens = [
  Home(),
  Stocks(),
  CustomerBills(),
  Reports(),
  Leaves(),
];

List absent = [11, 18, 25, 5];

List leave = [14, 15, 16];

List present = [
  1,
  2,
  3,
  4,
  6,
  7,
  8,
  9,
  10,
  12,
  13,
  17,
  19,
  20,
  21,
  22,
  23,
  24,
  26,
  27,
  28,
  29,
  30,
];

List festiveLeaves = [
  8,
  20,
  28,
];


// Future<void> getData( ) async {

// }
