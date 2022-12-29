import 'dart:convert';
import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/navbar.dart';
import 'package:emanagementapp/view/homepage.dart';
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

  Future<dynamic> teamLogin(user, pswd, endPonit, team) async {
    Map Data = {
      'email': id.text,
      'password': pass.text,
    };
    var res = await http.post(
      Uri.parse('${dotenv.env["APP_URL"]}$endPonit'),
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

      if (team == false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavBar(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
      SharedPreferences preferences = await SharedPreferences.getInstance();

      if (team) {
        preferences.setInt('admin_login_id', loginres['login_id']);
        preferences.setString('admin_name', loginres['login_name']);
      } else {
        preferences.setInt('login_id', loginres['login_id']);
        preferences.setString('name', loginres['login_name']);
      }
    } else {
      Fluttertoast.showToast(
          msg: '${loginres['message']}', backgroundColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: bgColor,
        //   toolbarHeight: 5,
        // ),

        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(children: [
                 SizedBox(
                  height: height * 0.15,
                 ),
                const Text(
                  "MangalDeep Clothes",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: appBarTextColor),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Team Login",
                        style: TextStyle(
                          fontWeight: admLogin == false
                              ? FontWeight.bold
                              : FontWeight.w400,
                        ),
                      ),
                      Switch(
                          value: admLogin,
                          onChanged: (value) {
                            setState(() {
                              admLogin = value;
                            });
                          }),
                      Text(
                        "Admin Login",
                        style: TextStyle(
                          fontWeight: admLogin == true
                              ? FontWeight.bold
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: height * 0.35,
                // ),
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
                                  if (isTap == false) {
                                    isTap = true;
                                  } else {
                                    isTap = false;
                                  }
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
                                if (admLogin == true) {
                                  teamLogin(id.text, pass.text, "admin-login",
                                      admLogin);
                                } else {
                                  teamLogin(id.text, pass.text, "user-login",
                                      admLogin);
                                }
                              },
                              child: const Text("Login"))),
                    ),
                    const SizedBox(
                      height: 20,
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
