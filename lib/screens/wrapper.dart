import 'package:firbase_test3/models/myUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firbase_test3/screens/auth/auth.dart';
import 'package:firbase_test3/screens/home/homePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    //return home or auth
    if (user == null) {
      return Auth();
    } else {
      return HomePage();
    }
  }
}
