import 'package:assetinventory/page/iamlanding.dart';
import 'package:assetinventory/utility/my_constaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = 'name', email = 'email', uid;

  Widget currentWidget = IamLanding();

  @override
  void initState() {
    super.initState();
    readLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 5.0,
        title: Text('IAM Working Area'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            iamMainDrawer(),
            MyConstant().buildListTileSignOut(context),
          ],
        ),
      ),
      body: SafeArea(
        child: Material(
                  child: SingleChildScrollView(
            child: Container(
              child: currentWidget,
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }

  Column iamMainDrawer() => Column(
        children: [
          buildAccountsDrawerHeader(),
          buildListTileMenu1(),
          buildListTileMenu2(),
          buildListTileMenu3(),
        ],
      );

  ListTile buildListTileMenu1() => ListTile(
        leading: Icon(Icons.people),
        title: Text('Privilede'),
        subtitle: Text('Work with Privilede Account'),
        onTap: () {
          Navigator.pop(context);
        },
      );

      ListTile buildListTileMenu2() => ListTile(
        leading: Icon(Icons.computer),
        title: Text('Service'),
        subtitle: Text('Work with Service Account'),
        onTap: () {
          Navigator.pop(context);
        },
      );

      ListTile buildListTileMenu3() => ListTile(
        leading: Icon(Icons.lock),
        title: Text('Certificate'),
        subtitle: Text('Work with Certicate'),
        onTap: () {
          Navigator.pop(context);
        },
      );

  UserAccountsDrawerHeader buildAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(email),
      currentAccountPicture: Image.asset(
        'images/logo.png',
      ),
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
    );
  }

  Future<Null> readLogin() async {
    Firebase.initializeApp().then((value) =>
        FirebaseAuth.instance.authStateChanges().listen((event) async {
          setState(() {
            email = event.email;
          });
          uid = event.uid;
          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .snapshots()
              .listen((event) {
            setState(() {
              name = event.data()['name'];
            });
          });
        }));
  }
}
