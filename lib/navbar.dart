import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/home.dart';
import 'package:emanagementapp/login.dart';
import 'package:emanagementapp/profile.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'attendance.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // ignore: prefer_final_fields
  int index = 0;
  final screens = [const Home(), Cal(), Porfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        leading: Text(
          'i',
          style: TextStyle(fontSize: 18),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 5,
        backgroundColor: themeColor,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'i - man',
              style: TextStyle(fontSize: 18, color: iconColor),
            ),
            Text(
              'MANGALDEEP CLOTHES LLP',
              style: TextStyle(fontWeight: FontWeight.w500, color: iconColor),
            ),
          ],
        ),
        // actions: [
        // Row(
        //   children: [
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 3, right: 5),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Row(
        //       children: [
        // Text(
        //   'i',
        //   style: TextStyle(fontSize: 20, color: iconColor),
        // ),
        // Text(
        //   ' - man',
        //   style: TextStyle(fontSize: 20, color: iconColor),
        // ),
        //     ],
        //   ),
        // ),
        // ),

        //   ],
        // )
        // ],
      ),
      body: screens[index],
      bottomNavigationBar: FloatingNavbar(
        // elevation: ,
        margin: EdgeInsets.all(0),
        fontSize: 16,
        iconSize: 28,
        borderRadius: 0,
        backgroundColor: themeColor,
        selectedBackgroundColor: Colors.white,
        selectedItemColor: iconColor,
        unselectedItemColor: iconColor,
        itemBorderRadius: 0,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.edit_calendar, title: 'Attendance'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
