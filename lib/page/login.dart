import 'package:assetinventory/ui/custommaterialbutton.dart';
import 'package:assetinventory/ui/customtextfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Center(
            child: Container(
              width: 400,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'IT\nAsset Inventory\nSystem',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nPlease log in',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 40,
                    ),
                    'Email',
                  ),
                  CustomTextField(
                      Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 40,
                      ),
                      'Password'),
                  Container(
                    width: 400,
                    height: 50,
                    child: CustomMaterialButton(
                        Text(
                          'Log In',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
