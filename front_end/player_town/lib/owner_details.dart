import 'package:flutter/material.dart';
import 'package:player_town/parlour_details.dart';
import 'package:player_town/parlour_json.dart';

class OwnerDetails extends StatefulWidget {
  @override
  _OwnerDetailsState createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {
  String _firstName;
  String _lastName;
  String _oEmail;
  String _phNo;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Owner Details',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Card(
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                //icon: Icon(Icons.person),
                hintText: 'What\'s your name?',
                labelText: 'First Name',
              ),
              onSaved: (String value) {
                _firstName = value;
                print("FirstName:" + _firstName);
              },
              validator: _validateName,
            ),
          ),
          Card(
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                //icon: Icon(Icons.person),
                hintText: 'What\'s your name?',
                labelText: 'Last Name',
              ),
              onSaved: (String value) {
                _lastName = value;
              },
              validator: _validateName,
            ),
          ),
          Card(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                //icon: Icon(Icons.person),
                hintText: 'Owners Email',
                labelText: 'Email id',
              ),
              onSaved: (String value) {
                _oEmail = value;
              },
              validator: _validateEmail,
            ),
          ),
          Card(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                //icon: Icon(Icons.person),
                hintText: 'Owners phone number',
                labelText: 'Phone Number',
              ),
              onSaved: (String value) {
                _phNo = value;
              },
              validator: _phoneNumberValidator,
            ),
          ),
          RaisedButton(
              child: Text('Next'),
              //shape: ,
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  // Text forms was validated.
                  form.save();
                  OwnerDetailsJSON owner =
                  OwnerDetailsJSON(_firstName, _lastName, _oEmail, _phNo);
                  print(owner.toJson().toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ParlourDetails(owner)),
                  );
                } else {
                  setState(() => _autoValidate = true);
                }
              }),
        ],
      ),
    );
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

  String _phoneNumberValidator(String value) {
    Pattern pattern =
        r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Phone Number';
    else
      return null;
  }
}
