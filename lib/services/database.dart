// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference/instance
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugar, String name, int strength) async{
    //firebase creates a document with a unique uid for you, and setup data
    //in that document
    //set a map
    Map<String, Object> data = {
      'sugar' : sugar,
      'name': name,
      'strength': strength,
    };
      return await brewCollection.doc(uid).set({data});
  }
}