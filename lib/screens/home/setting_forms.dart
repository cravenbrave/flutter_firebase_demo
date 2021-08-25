import 'package:firbase_test3/models/myUser.dart';
import 'package:firbase_test3/services/database.dart';
import 'package:firbase_test3/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firbase_test3/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  //create a global key
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String? _currentName;
  String? _currentSugar;
  int? _currentStrength;
  bool strFlag = true;
  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    return StreamBuilder<UserData?>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Update your brew settings',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: UMBlue),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    //from constants file
                    decoration: textInputDec.copyWith(hintText: 'Name'),
                    initialValue: userData!.name,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),

                  //drop down menu
                  DropdownButtonFormField(
                    decoration: textInputDec.copyWith(hintText: 'Sugar(s)'),
                    //don't let the list to high
                    isDense: true,
                    value: _currentSugar ?? userData.sugars,
                    onChanged: (val) {
                      setState(() => _currentSugar = val as String);
                    },
                    validator: (val) =>
                        val == null ? 'Please select the sugar level' : null,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                  ),

                  //slider for selecting strength
                  Slider(
                    thumbColor: Colors
                        .brown[strFlag ? userData.strength : _currentStrength!],
                    activeColor: Colors
                        .brown[strFlag ? userData.strength : _currentStrength!],
                    value: (strFlag ? userData.strength : _currentStrength!)
                        .toDouble(),
                    onChanged: (val) {
                      //round: cast double into int
                      setState(() {
                        _currentStrength = val.round();
                        strFlag = !strFlag;
                      });
                    },
                    min: 100,
                    max: 900,
                    divisions: 8,
                  ),
                  //button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: UMBlue,
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                            color: UMYellow,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugar ?? userData.sugars,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength,
                          );
                          //close the panel automatically
                          Navigator.of(context).pop();
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
