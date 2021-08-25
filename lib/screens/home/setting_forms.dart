import 'package:flutter/material.dart';
import 'package:firbase_test3/shared/constants.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  //create a global key
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String _currentName = '';
  String _currentSugar = '';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings',
            style: TextStyle(
                fontSize: 22.0, fontWeight: FontWeight.bold, color: UMBlue),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            //from constants file
            decoration: textInputDec.copyWith(hintText: 'Name'),
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),

          //drop down menu
          DropdownButtonFormField(
            decoration: textInputDec.copyWith(hintText: 'Sugar(s)'),
            //don't let the list to high
            isDense: true,
            onChanged: (val) {
              setState(() => _currentSugar = val as String);
            },
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
          ),

          //slider for selecting strength
          Slider(
            thumbColor: Colors.brown[_currentStrength],
            activeColor: Colors.brown[_currentStrength],
            value: _currentStrength.toDouble(),
            onChanged: (val) {
              //round: cast double into int
              setState(() => _currentStrength = val.round());
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
                print(_currentName);
                print(_currentSugar);
                print(_currentStrength);
              }),
        ],
      ),
    );
  }
}
