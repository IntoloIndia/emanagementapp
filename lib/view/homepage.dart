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
      backgroundColor: Color.fromARGB(255, 216, 198, 221),
      appBar: AppBar(
        title: const Text(
          "MANGALDEEP CLOTHES LLP",
          style: TextStyle(
              color: Color.fromARGB(255, 224, 134, 233),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: displayScreens[selectedIndex],
      bottomNavigationBar: FloatingNavbar(
        selectedBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color(0xff562B08),
        unselectedItemColor: const Color(0xff562B08),
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
          FloatingNavbarItem(icon: Icons.analytics_outlined, title: 'Report'),
          FloatingNavbarItem(icon: Icons.group, title: '  HR  '),
        ],
      ),
    );
  }
}
