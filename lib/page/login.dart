import 'package:assetinventory/page/iampage.dart';
import 'package:assetinventory/utility/normalDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool status;
  String user, password;

  @override
  void initState() {
    super.initState();
    status = false;
    checkStatus();
  }

  Future<Null> checkStatus() async {
    Firebase.initializeApp().then((value) => {
          FirebaseAuth.instance.authStateChanges().listen((event) {
            if (event == null) {
              setState(() {
                status = false;
              });
            } else {
              String uid = event.uid;
              checkTeam(uid);
            }
          })
        });
  }

  Future<Null> checkTeam(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('user').doc(uid).snapshots().listen((event) {
      String team = event.data()['team'];
      routeToService(team);
    });
  }

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
                  RichText(
                    textAlign: TextAlign.center,
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
                  Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child:
                              Icon(Icons.people, size: 30, color: Colors.black),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) => user = value.trim(),
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.lightBlue[100],
                                  filled: true,
                                  border: InputBorder.none),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.lock,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) => password = value.trim(),
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  fillColor: Colors.lightBlue[100],
                                  filled: true,
                                  border: InputBorder.none),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () {
                        if (user == null ||
                            user.isEmpty ||
                            password == null ||
                            password.isEmpty) {
                          normalDialog(context, 'Please fill every blank');
                        } else {
                          loginUserPassword();
                        }
                      },
                      elevation: 6.0,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      color: Colors.white,
                      hoverColor: Colors.blue[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> loginUserPassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .signInWithEmailAndPassword(email: user, password: password)
        .then((value) async {
      String uid = value.user.uid;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .snapshots()
          .listen((event) {
        String team = event.data()['team'];
        routeToService(team);
      });
    }).catchError((response) {
      String string = response.message;
      normalDialog(context, string);
    });
  }

  void routeToService(String team) {
    switch (team) {
      case 'iam':
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
            (route) => false);
        break;
      // case 'Student':
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => MyServiceStudent(),
      //       ),
      //       (route) => false);
      //   break;
      default:
    }
  }
}
