import 'package:flutter/material.dart';
import 'package:player_town/pre_board.dart';
import 'gps_location.dart';
import 'parlour_json.dart';

class ParlourDetails extends StatefulWidget {
  ParlourDetails(this.owner);

  final OwnerDetailsJSON owner;

  @override
  _ParlourDetailsState createState() => _ParlourDetailsState(owner);
}

class _ParlourDetailsState extends State<ParlourDetails> {
  _ParlourDetailsState(this._ownerDetails);

  OwnerDetailsJSON _ownerDetails;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  String _parlourName, _description, _pmailId, _phoneNo, _startTime, _endTime;
  int _boardCount;
  int _locationId = 0;
  String _addressLine1,
      _addressLine2,
      _city = "Hyderabad",
      _state;
  GPSJSON _gpsLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Parlour Details' + _ownerDetails.toJson().toString(),
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
                  hintText: 'Palour Name?',
                  labelText: 'Parlour Name',
                ),
                onSaved: (String value) {
                  _parlourName = value;
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
                  hintText: 'Palour Description',
                  labelText: 'Parlour Description(Optional)',
                ),
                onSaved: (String value) {
                  _description = value;
                },
                //validator: _validateName,
              ),
            ),
            Card(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  //icon: Icon(Icons.person),
                  hintText: 'Parlour Email',
                  labelText: 'Parlour Email id(Optional)',
                ),
                onSaved: (String value) {
                  _pmailId = value;
                },
                validator: _validateEmail,
              ),
            ),
            Card(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  //icon: Icon(Icons.person),
                  hintText: 'Parlour phone number',
                  labelText: 'Phone Number(Optional)',
                ),
                onSaved: (String value) {
                  _phoneNo = value;
                },
                validator: _phoneNumberValidator,
              ),
            ),
            RaisedButton(
              child: Text('GPS Location'),
              onPressed: () async {
                _gpsLocation = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GPSLocation()),
                );
                print(_gpsLocation.toJson().toString());
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text(_gpsLocation.toJson().toString())));
              },
            ),
            Card(
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  //icon: Icon(Icons.person),
                  hintText: 'House no. / Flat no./ Floor/ Building',
                  labelText: 'Complete Address',
                ),
                onSaved: (String value) {
                  _addressLine1 = value;
                },
                validator: _validateAddress,
              ),
            ),
            Card(
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  //icon: Icon(Icons.person),
                  hintText: 'LandMark',
                  labelText: 'LandMark(Optional)',
                ),
                onSaved: (String value) {
                  _addressLine2 = value;
                },
                //validator: _validateAddress,
              ),
            ),
            Row(
              children: <Widget>[
                DropdownButton<String>(
                  value: _city,
                  elevation: 4,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  isDense: false,
                  iconSize: 30.0,
                  onChanged: (String newValue) {
                    setState(() {
                      _city = newValue;
                    });
                  },
                  items: <String>['Hyderabad', 'Bangalore', 'Tirupati']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  // Text forms was validated.
                  form.save();
                  ParlourDetailsJSON _parlourDetails =
                  ParlourDetailsJSON(
                      _parlourName,
                      _description,
                      _pmailId,
                      _phoneNo,
                      _startTime,
                      _endTime,
                      _boardCount);
                  LocationJSON _locationDetails = LocationJSON(
                      _locationId, _addressLine1, _addressLine2, _city, _state,
                      _gpsLocation);
                  print(_parlourDetails.toJson().toString());
                  print(_locationDetails.toJson().toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        PreBoard(
                            _ownerDetails, _parlourDetails, _locationDetails)),
                  );
                } else {
                  setState(() => _autoValidate = true);
                }
              },
            ),
          ],
        ),
      ),
    ));
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateEmail(String value) {
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (value.isEmpty || regExp.hasMatch(value)) {
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
    if (value.isEmpty)
      return null;
    if (!regex.hasMatch(value))
      return 'Enter Valid Phone Number';
    else
      return null;
  }

  String _validateAddress(String value) {
    if (_gpsLocation == null) {
      return "Select GPS Location";
    }
    if (value.isEmpty) {
      return "Enter Valid Address";
    }
    else
      return null;
  }
}


//"parlourName": "Frames Parlour,Snooker Den",
//"description": "Parlour description",
//"mailId": "string",
//"phoneNo": "string",
//"location": {
//"locationId": 0,
//"addressLine1": "string",
//"addressLine2": "string",
//"city": "string",
//"state": "string",
//"gps": {
//"latitude": 0,
//"longitude": 0
//}
//},
