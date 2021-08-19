import 'package:firbase_test3/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
