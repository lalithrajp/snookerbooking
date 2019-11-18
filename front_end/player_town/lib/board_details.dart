import 'package:flutter/material.dart';

class BoardDetails extends StatelessWidget {
  BoardDetails({this.noOfBoards});
  int noOfBoards;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Board(boardNumber: 1)
      ],
    );
  }
}

class Board extends StatelessWidget {
  @override
  Board({this.boardNumber});
  int boardNumber;
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Text(
            'Board Details for $boardNumber',
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
              hintText: 'What\'s board name',
              labelText: 'Board Name',
            ),
            onSaved: (String value) { final String board_name = value; },
            validator: _validateBoardName,
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              //icon: Icon(Icons.person),
              hintText: 'What\'s type of the Board',
              labelText: 'Board Type',
            ),
            onSaved: (String value) { final String board_type = value; },
            validator: _validateBoardName,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              //icon: Icon(Icons.person),
              hintText: 'Cost of the board per hour',
              labelText: 'Cost Per Hour',
            ),
            onSaved: (String value) { final String cost_per_hour = value; },
            validator: _validateBoardName,
          )
        ],
      );
  }
  String _validateBoardName(String value) {
    return 'Success';
  }
}