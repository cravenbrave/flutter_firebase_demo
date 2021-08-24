import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_test3/services/auth_service.dart';
import 'package:firbase_test3/services/database.dart';
import 'package:firbase_test3/screens/home/brew_list.dart';
import 'package:firbase_test3/models/brew.dart';
class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService(uid: '').brews,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 39, 76, 1),
          title: Text('Home Page'),
          actions: [
            ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 39, 76, 1),
                  onPrimary: Color.fromRGBO(255, 203, 5, 1),
                ),
                icon: Icon(Icons.person),
                label: Text('Logout')),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
