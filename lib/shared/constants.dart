import 'package:flutter/material.dart';

const textInputDec = InputDecoration(
  hintText: 'Email:',
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: UMBlue, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: UMYellow, width: 1.0),
  ),
);

const textInputDecSignIn = InputDecoration(
  hintText: 'Email:',
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: UMYellow, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: UMBlue, width: 1.0),
  ),
);

const UMBlue = Color.fromRGBO(0, 39, 76, 1);

const UMYellow = Color.fromRGBO(255, 203, 5, 1);