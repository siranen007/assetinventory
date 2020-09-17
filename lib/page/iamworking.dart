import 'dart:convert';

import 'package:assetinventory/models/user.dart';
import 'package:flutter/material.dart';

class WorkingWithAccount extends StatelessWidget {
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
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(users[index].team),
                      Text(users[index].manager),
                    ],
                  ),
                );
              },
            );
          } else {}
        },
      ),
    );
  }
}
