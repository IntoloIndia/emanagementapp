import 'dart:convert';

import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/home.dart';
import 'package:emanagementapp/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

bool isLogged = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController id = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isTap = true;

  @override
  void initState() {
    super.initState();
    // login(id.text, pass.text);
  }

  Future<dynamic> login(user, pswd) async {
    Map Data = {
      'email': id.text,
      'password': pass.text,
    };
    var res = await http.post(
      Uri.parse('${dotenv.env["APP_URL"]}user-login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Data),
    );

    final jsonResponse = jsonDecode(res.body);
    final loginres = jsonResponse;
    print(loginres);
    if (loginres['status'] == 200
        ? loginres['login_id'] != null
            ? true
            : false
        : false) {
      isLogged = true;
      Fluttertoast.showToast(
          msg: '${loginres['message']}', backgroundColor: iconColor);

      id.clear();
      pass.clear();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavBar(),
          ));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setInt('login_id', loginres['login_id']);
      preferences.setString('name', loginres['login_name']);
    } else {
      Fluttertoast.showToast(
          msg: '${loginres['message']}', backgroundColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 173, 218, 255),
                Color.fromRGBO(10, 88, 255, 1),
                // Color.fromARGB(255, 253, 74, 19),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 10,
                child: SizedBox(
                    height: 150, child: Image.asset('assets/img/log.png')),
              ),
              Column(
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    elevation: 10,
                    child: TextField(
                      controller: id,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          label: Text('Employee Id'),
                          hintText: 'Email@com'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    elevation: 10,
                    child: TextField(
                      controller: pass,
                      obscureText: isTap,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isTap = false;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.password),
                          label: const Text('Password'),
                          hintText: 'Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 10,
                    child: SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                            onPressed: () async {
                              id.text;
                              pass.text;
                              login(id.text, pass.text);
                            },
                            child: const Text("Login"))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  Text(
                    "Powered By Intenics India",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
