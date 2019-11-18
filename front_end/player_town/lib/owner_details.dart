import 'package:flutter/material.dart';

class OwnerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text(
      'Owner Details',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            //icon: Icon(Icons.person),
            hintText: 'What\'s your name?',
            labelText: 'First Name',
          ),
          //onSaved: (String value) { _owner_name = value; },
          validator: _validateName,
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            //icon: Icon(Icons.person),
            hintText: 'What\'s your name?',
            labelText: 'Last Name',
          ),
          //onSaved: (String value) { _owner_name = value; },
          validator: _validateName,
        ),
        TextField(
          onChanged: (String newVal) {

          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mail Id',
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            //icon: Icon(Icons.person),
            hintText: 'Owners phone number',
            labelText: 'Phone Number',
          ),
          onSaved: (String value) { final String cost_per_hour = value; },
          validator: _validateName,
        )
      ],
    );
  }

  bool isNumber(String value) {
    if(value == null) {
      return true;
    }
    final n = num.tryParse(value);
    return n!= null;
  }
  String _validateName(String value) {
    if (value.isEmpty)
      return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }
}

