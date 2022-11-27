import 'package:emanagementapp/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'navbar.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var logged = preferences.getInt('login_id');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logged == null ? LoginPage() : NavBar()));
}
