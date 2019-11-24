import 'dart:io';

import"package:flutter/material.dart";
import 'package:player_town/board_info_display.dart';
import 'api_requests.dart';
import 'board_details.dart';
import 'package:http/http.dart';

class PreBoard extends StatefulWidget {
  @override
  _PreBoardState createState() => _PreBoardState();
}

class _PreBoardState extends State<PreBoard> {
  @override
  APIRequests request = APIRequests();
  var _notValid = " ";
  int no_of_boards = 1;
  int no_of_boards_temp = 1;
  PageController _controller;
  TimeOfDay _startTime = new TimeOfDay.now();
  TimeOfDay _endTime = new TimeOfDay.now();


  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null && picked != _startTime) {
      print('Time Selected:' + _startTime.toString());
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime) {
      print('Time Selected:' + _endTime.toString());
      setState(() {
        _endTime = picked;
      });
    }
  }

  void initState() {
    super.initState();
    _controller = new PageController(
        initialPage: 0, keepPage: false, viewportFraction: 1.0);
    //platform.setMessageHandler(changePage);
  }

  Widget build(BuildContext context) {
    List<Widget> _columns = new List.generate(
        no_of_boards, (int i) => new Board(boardNumber: no_of_boards));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Parlour Timings',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Start Time: ${_startTime.format(context)}',
                //textAlign: TextAlign.center,
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //SizedBox(width: 73),
              RaisedButton(
                onPressed: () {
                  _selectStartTime(context);
                },
                child: Text('Select Start Time'),
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'End Time: ${ _endTime.format(context)}',
                //textAlign: TextAlign.center,
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //SizedBox(width: 80),
              RaisedButton(
                onPressed: () {
                  _selectEndTime(context);
                },
                child: Text('Select End Time'),
              ),
            ],
          ),
        ),

        Text(
          _notValid,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: Color(0xFFEB1555),
          ),
        ),
        SizedBox(height: 80),
        Text(
          'No of boards',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          no_of_boards_temp.toString(),
          style: TextStyle(
            fontSize: 65.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        Slider(
          value: no_of_boards_temp.toDouble(),
          min: 1.0,
          max: 15.0,
          activeColor: Color(0xFFEB1555),
          inactiveColor: Color(0xFF8D8E98),
          onChanged: (double newValue) {
            setState(() {
              no_of_boards_temp = newValue.round();
            });
          },
        ),
        RaisedButton(
            child: Text('Confirm'),
            //shape: ,
            onPressed: () {
              setState(() {
                no_of_boards = no_of_boards_temp;
                //BoardDetails(noOfBoards: no_of_boards);
                //Navigator.pushNamed(context, '/board');
                print('Visited here');
                int difference = _endTime.hour - _startTime.hour;
                if (!(difference.isNegative) && !(difference < 1)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayBoardInfo(no_of_boards)),
                  );
                  // _controller.nextPage(
                  //     duration: kTabScrollDuration, curve: Curves.ease);
                }
                else {
                  _notValid =
                  "Timings are either less than 1 hour or invalid.";
                }
              });

              // Navigate to the second screen using a named route.
              //  Navigator.pushNamed(context, '/signup');
            }),
//        Card(
//          child: Container(
//            //margin: EdgeInsets.only(bottom: 200.0),
//            //height: 200.0,
//            child: ListView(
//              //scrollDirection: Axis.horizontal,
//              //child: Wrap(
//              //child: Column(
//                children: _columns,
//              //),
//            ),
//          ),
//        ),
//        RaisedButton(
//            child: Text('Confirm'),
//            onPressed: () async {
//              var response = await _makePostRequest();
//              setState(() {
//                //var response = sendDataToServer();
//
//                print(response);
//                //Navigator.pop(context, response);
//                Navigator.popUntil(context, ModalRoute.withName('/'));
//              });
//            }),
      ],
    );
  }
}