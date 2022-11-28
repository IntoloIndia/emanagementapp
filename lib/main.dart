import 'package:emanagementapp/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/controller/controller.dart';
import 'package:emanagementapp/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'navbar.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var logged = preferences.getInt('login_id');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Controller(),
      ),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: logged == null ? LoginPage() : NavBar()),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter',
//       theme: ThemeData(
//           appBarTheme: AppBarTheme(
//         color: themeColor,
//       )),
//       home: HomePage(),
//     );
//   }
// }
