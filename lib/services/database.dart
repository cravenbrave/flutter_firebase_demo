// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_test3/models/brew.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //collection reference/instance
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String sugar, String name, int strength) async {
    //firebase creates a document with a unique uid for you, and setup data
    //in that document
    //set a map
    return await brewCollection.doc(uid).set({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        sugar: doc.get('sugar') ?? '0',
        strength: doc.get('strength') ?? 0,
      );
    }).toList();
  }

  //get brews collection streams
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
