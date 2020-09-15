import 'package:assetinventory/configure/pagesection/navbar.dart';
import 'package:assetinventory/page/iamlanding.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue[800],
              Colors.blue[100],
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: IamLanding(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
