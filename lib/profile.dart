import 'package:emanagementapp/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Porfile extends StatefulWidget {
  const Porfile({super.key});

  @override
  State<Porfile> createState() => _PorfileState();
}

class _PorfileState extends State<Porfile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(88, 255, 255, 255),
      margin: const EdgeInsets.all(5),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Icon(
                Icons.person_outline_rounded,
                size: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(172, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text("name"),
                trailing: Icon(Icons.edit),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(172, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(Icons.e_mobiledata),
                title: Text('Email'),
                trailing: Icon(Icons.edit),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(172, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30)),
              child: const ListTile(
                leading: Icon(Icons.phone),
                title: Text('9300225588'),
                trailing: Icon(Icons.edit),
              ),
            ),
          ),
          Container(
              color: Colors.grey,
              height: 40,
              // width: 100,
              child: TextButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.remove('login_id');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  child: const Text('Logout')))
        ],
      ),
    );
  }
}
