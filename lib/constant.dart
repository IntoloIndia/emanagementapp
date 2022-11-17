import 'package:emanagementapp/view/Leaves.dart';
import 'package:emanagementapp/view/home.dart';
import 'package:flutter/material.dart';

import 'view/stocksmanage.dart';

String action = "Home";
int selectedIndex = 0;
Color iconColor = Color(0xff562B08);
Color themeColor = Color(0xffF5EFE6);

List displayScreens = [
  Home(),
  Stocks(),
  Leaves(),
];
