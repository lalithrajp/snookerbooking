import"package:flutter/material.dart";
import"board_details.dart";
import 'package:http/http.dart';

class DisplayBoardInfo extends StatefulWidget {
  int noOfBoards;

  DisplayBoardInfo(this.noOfBoards);

  @override
  _DisplayBoardInfoState createState() => _DisplayBoardInfoState(noOfBoards);
}

class _DisplayBoardInfoState extends State<DisplayBoardInfo> {
  int noOfBoards;

//  List<Widget> _temp;
//  _temp.add(Board(boardNumber: 1));
  _DisplayBoardInfoState(this.noOfBoards) {
    //_createBoardInfo();
  }

  List<Widget>  _createBoardInfo(){
    List<Widget> _columns = new List();
    for (int i = 1; i < noOfBoards + 1; i++) {
          _columns.add(new Board(boardNumber: i));
    }
      return _columns;
  }

  void initState() {
    super.initState();

    //platform.setMessageHandler(changePage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Card(
//            child: RaisedButton(
//              onPressed: () {
//                _createBoardInfo(context);
//              },
//              child: Text('Generate Boards'),
//            )
            child: LimitedBox(
              //child: Board(boardNumber: 1),
              maxHeight: 700,
              child: ListView(
                //scrollDirection: Axis.horizontal,
                children: _createBoardInfo(),
              ),
            ),
          ),
          RaisedButton(
              child: Text('Confirm'),
              onPressed: () async {
                var response = await _makePostRequest();
                setState(() {
                  //var response = sendDataToServer();

                  print(response);
                  //Navigator.pop(context, response);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                });
              }),
      ],
    );
  }
  _makePostRequest() async {
    // set up POST request arguments
    String url = 'https://virtserver.swaggerhub.com/SacredMinds/SnookerBooker/1.0.0/parlour';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '''{
  "parlourName": "Frames Parlour,Snooker Den",
  "description": "Parlour description",
  "mailId": "string",
  "phoneNo": "string",
  "location": {
    "locationId": 0,
    "addressLine1": "string",
    "addressLine2": "string",
    "city": "string",
    "state": "string",
    "gps": {
      "latitude": 0,
      "longitude": 0
    }
  },
  "owner": {
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "phoneNo": "string"
  },
  "boards": [
    {
      "category": 0,
      "pricePerHour": 0,
      "name": "Board1,Board2",
      "description": "Description about the board",
      "photoUrls": [
        "string"
      ]
    }
  ],
  "tags": [
    {
      "id": 0,
      "name": "English"
    }
  ]
}''';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    print(statusCode);
    print(body);
    return statusCode;
  }
}
