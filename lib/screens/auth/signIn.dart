import 'package:firbase_test3/screens/auth/register.dart';
import 'package:firbase_test3/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firbase_test3/services/auth_service.dart';
import 'package:firbase_test3/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //used to identify the form
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(0, 39, 76, 1),
              title: Text('Sign in Page'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  style: TextButton.styleFrom(
                    primary: Color.fromRGBO(255, 203, 5, 1),
                  ),
                  icon: Icon(Icons.person),
                  label: Text('Sign up'),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    //user name/email/id
                    TextFormField(
                      decoration: textInputDecSignIn,
                      // enableInteractiveSelection: true,
                      // enabled: true,
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() => email = val.trim());
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //password
                    TextFormField(
                      decoration:
                          textInputDecSignIn.copyWith(hintText: 'Password:'),
                      validator: (val) =>
                          val!.length < 6 ? 'Need a longer password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          // print('it is valid');
                          dynamic result = await _auth.signInWithEmailPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error =
                                  'Please enter a valid email address or password';
                            });
                          }
                        }
                      },
                      child: Text('Sign in'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 39, 76, 1),
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    error == ''
                        ? SizedBox()
                        : Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                  ],
                ),
              ),
            ),
          );
  }
}
