import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/controller/controller.dart';
import 'package:emanagementapp/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => Controller(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: themeColor,
      )),
      home: HomePage(),
    );
  }
}
