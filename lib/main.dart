import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firbase_test3/screens/wrapper.dart';
import 'package:firbase_test3/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firbase_test3/models/myUser.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      //used to pushing logout you are actually logged out from Firebase
      //but it won't return to authentication screen
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Wrapper(),
      ),
    );
  }
}
