import 'package:firbase_test3/screens/auth/signIn.dart';
import 'package:firbase_test3/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firbase_test3/services/auth_service.dart';
import 'package:firbase_test3/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              backgroundColor: UMYellow,
              title: Text('Sign Up Page'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign in'),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                //used to identify the form
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    //user name/email/id
                    TextFormField(
                      decoration: textInputDec,
                      //return null if it's valid
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //password
                    TextFormField(
                      decoration: textInputDec.copyWith(hintText: 'Password:'),
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
                          dynamic result = await _auth.registWithEmailPassword(
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
                      child: Text('Sign up'),
                      style: ElevatedButton.styleFrom(
                        primary: UMYellow,
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
