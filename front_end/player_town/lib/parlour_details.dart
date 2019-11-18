import 'package:flutter/material.dart';
import 'gps_location.dart';

class ParlourDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Parlour Details',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Parlour Name',
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            //icon: Icon(Icons.person),
            hintText: 'Parlour phone number',
            labelText: 'Phone Number',
          ),
          onSaved: (String value) { final String cost_per_hour = value; },
          //validator: _validateName,
        ),
        RaisedButton(
          child:
          Text('GPS Location'),
          onPressed: () async{
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GPSLocation()),
            );
            Scaffold.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text("$result")));
          },
        ),
    TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Area',
    ),),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Landmark',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Timings',
          ),
        ),

      ],
    );
  }
}
