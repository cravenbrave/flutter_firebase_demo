import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firbase_test3/services/auth_service.dart';
import 'package:firbase_test3/services/database.dart';
import 'package:firbase_test3/screens/home/brew_list.dart';
import 'package:firbase_test3/models/brew.dart';
import 'package:firbase_test3/shared/constants.dart';
import 'package:firbase_test3/screens/home/setting_forms.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //create a setting list
    void _showSettingPanel() {
      //a built-in model of bottom sheet
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingForm(),
            );
          });
    }

    //a stream provider used to get real time brew values
    return StreamProvider<List<Brew>>.value(
      //we dont need a specific uid, so just leave it blank
      value: DatabaseService(uid: '').brews,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 39, 76, 1),
          title: Text('Brew Crew'),
          actions: [
            ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                style: ElevatedButton.styleFrom(
                  primary: UMBlue,
                  onPrimary: UMYellow,
                ),
                icon: Icon(Icons.person),
                label: Text('Logout')),
            ElevatedButton.icon(
              onPressed: _showSettingPanel,
              icon: Icon(Icons.settings),
              label: Text('Setting'),
              style: ElevatedButton.styleFrom(
                primary: UMBlue,
                onPrimary: UMYellow,
              ),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
