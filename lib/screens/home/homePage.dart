import 'package:firbase_test3/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout')),
        ],
      ),
    );
  }
}
