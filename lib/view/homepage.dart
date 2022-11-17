import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        title: const Text(
          "I-MAN",
          style: TextStyle(
              color: Color(0xff562B08),
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: selectedIndex == 2
          ? displayScreens[2]
          : displayScreens[selectedIndex!],
      bottomNavigationBar: FloatingNavbar(
        selectedBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color(0xff562B08),
        unselectedItemColor: Color(0xff562B08),
        // elevation: 2,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        borderRadius: 0,
        itemBorderRadius: 0,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.all(0),
        backgroundColor: Color(0xffF5EFE6),
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.explore, title: 'Stocks'),
          FloatingNavbarItem(icon: Icons.group, title: '  HR  '),
        ],
      ),
    );
  }
}
