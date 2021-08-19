import 'package:firbase_test3/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:firbase_test3/services/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 39, 76, 1),
        title: Text('Sign in Page'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign up'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              //user name/email/id
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              //password
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {},
                child: Text('Sign in'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
