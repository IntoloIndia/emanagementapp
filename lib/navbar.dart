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
  final screens = [const Home(), Attendance(), Porfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 7, 26, 41),
        centerTitle: true,
        title: const Text('I-MAN'),
      ),
      body: screens[index],
      bottomNavigationBar: FloatingNavbar(
        // elevation: ,
        margin: EdgeInsets.all(0),
        // padding: const EdgeInsets.symmetric(vertical: 10),
        borderRadius: 0,
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
