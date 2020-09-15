import 'package:assetinventory/page/iampage.dart';
import 'package:assetinventory/page/login.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Balsamiq',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (login)?MyHomePage():LoginPage(),
    );
  }
}
