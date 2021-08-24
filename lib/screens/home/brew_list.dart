import 'package:firbase_test3/models/brew.dart';
import 'package:firbase_test3/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    // print(brews!.docs);
    // if (brews != null) {
    //   for (var doc in brews.docs) {
    //     print(doc.data());
    //   }
    // }

    // if (brews != null) {
    for (var doc in brews) {
      print(doc.name);
      print(doc.sugar);
      print(doc.strength);
    }
    // }
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
