import"package:flutter/material.dart";
import 'package:player_town/parlour_json.dart';
import"board_details.dart";
import 'package:http/http.dart';

class DisplayBoardInfo extends StatefulWidget {
  ParlourDetailsJSON parlourDetails;
  LocationJSON locationDetails;
  OwnerDetailsJSON ownerDetails;

  DisplayBoardInfo(this.ownerDetails, this.parlourDetails,
      this.locationDetails);

  @override
  _DisplayBoardInfoState createState() =>
      _DisplayBoardInfoState(ownerDetails, parlourDetails, locationDetails);
}

class _DisplayBoardInfoState extends State<DisplayBoardInfo> {
  ParlourDetailsJSON parlourDetails;
  LocationJSON locationDetails;
  OwnerDetailsJSON ownerDetails;
  TagsJSON _tag;
  List<BoardJSON> boards = new List();

//  List<Widget> _temp;
//  _temp.add(Board(boardNumber: 1));
  _DisplayBoardInfoState(this.ownerDetails, this.parlourDetails,
      this.locationDetails);

  List<Widget>  _createBoardInfo(){
    int noOfBoards = parlourDetails.boardCount;
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
            child: LimitedBox(
              //child: Board(boardNumber: 1),
              maxHeight: 700,
              child: NotificationListener<ValueNotification>(
                child: ListView(
                  children: _createBoardInfo(),
                ),
                onNotification: (notification) {
                  print("Noti:" + notification.board.toJson().toString());
                  boards.add(notification.board);
                  return true;
                },
              ),
            ),
          ),
          RaisedButton(
              child: Text('Done'),
              onPressed: () async {
                ParlourJSON parlour = ParlourJSON(
                    parlourDetails, ownerDetails, locationDetails, boards,
                    _tag);
                var response = await _makePostRequest(parlour);
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

  _makePostRequest(parlour) async {
    // set up POST request arguments
    String url = 'https://virtserver.swaggerhub.com/SacredMinds/SnookerBooker/1.0.0/parlour';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = parlour.toJson().toString();
    print("Final JSON:" + json);
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
