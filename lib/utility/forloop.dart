import 'dart:convert';

import 'package:assetinventory/models/user.dart';
import 'package:flutter/material.dart';

class ForLoop extends StatelessWidget {
  int i = 0;
  Future<List<User>> getUsersFromJSON(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/files/data.json');
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((e) => User.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test JSON'),
      ),
      body: FutureBuilder(
        future: getUsersFromJSON(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            return Container(
              child: Column(
                children: [
                  for (var i = 0; i < users.length; i++)
                    Text('${users[i].name}--${users[i].team}--${users[i].manager}'),
                ],
              ),
            );
          } else {}
        },
      ),
    );
  }
}
