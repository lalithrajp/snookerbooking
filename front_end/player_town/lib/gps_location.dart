import 'package:flutter/material.dart';
import 'parlour_json.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(GPSLocation());

class GPSLocation extends StatefulWidget {
  @override
  _GPSLocationState createState() => _GPSLocationState();
}

class _GPSLocationState extends State<GPSLocation> {
  //GoogleMapController mapController;

  //final LatLng _center = const LatLng(45.521563, -122.677433);

  //void _onMapCreated(GoogleMapController controller) {
  //mapController = controller;
  //}

  @override
  Widget build(BuildContext context) {
    var _latitude = 10.2222;
    var _longitude = 55.0000;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Column(
          children: <Widget>[
            //      GoogleMap(
            //        onMapCreated: _onMapCreated,
            //        initialCameraPosition: CameraPosition(
            //          target: _center,
            //          zoom: 11.0,
            //        ),
            //      ),
            RaisedButton(
              child: Text('GPS Location'),
              onPressed: () async {
                GPSJSON gpsDetails = GPSJSON(_latitude, _longitude);
                // Navigate to the second screen using a named route.
                Navigator.pop(context, gpsDetails);
              },
            ),
          ],
        ),
      ),
    );
  }
}
//class GPSLocation extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: RaisedButton(
//      child:
//      Text('GPS Location'),
//      onPressed: () async{
//        // Navigate to the second screen using a named route.
//        Navigator.pop(context, 'success');
//      },
//    ),);
//  }
//}
