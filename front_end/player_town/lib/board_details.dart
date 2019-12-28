import 'package:flutter/material.dart';
import 'package:player_town/parlour_json.dart';

class ValueNotification extends Notification {
  final BoardJSON board;

  const ValueNotification({this.board});
}

class Board extends StatefulWidget {
  const Board({Key key, this.boardNumber}) :super(key: key);
  final int boardNumber;

  //Board({this.boardNumber});
  @override
  _BoardState createState() => _BoardState(boardNumber);
}

class _BoardState extends State<Board> {

  int boardNumber;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  _BoardState(this.boardNumber);
  @override
  Widget build(BuildContext context) {
    int _boardType;
    int _pricePerHour;
    String _boardName;
    String _description;
    List<String> _urls = ['hljkasdef', 'asdf', 'asdf'];

    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
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
            onSaved: (String value) {
              _boardName = value;
            },
            validator: _validateBoardDetails,
          ),
          TextFormField(
            //textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              //icon: Icon(Icons.person),
              hintText: 'What\'s type of the Board',
              labelText: 'Board Type',
            ),
            onSaved: (String value) {
              _boardType = int.parse(value);
            },
            //validator: _validateBoardDetails,
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
            onSaved: (String value) {
              _pricePerHour = int.parse(value);
            },
            validator: _validateBoardCost,
          ),
          RaisedButton(
              child: Text('Confirm'),
              //shape: ,
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  // Text forms was validated.
                  BoardJSON board = BoardJSON(
                      _boardType, _pricePerHour, _boardName, _description,
                      _urls);
                  print("Board:details:" + board.toJson().toString());

                  ValueNotification(board: board)
                    ..dispatch(context);
                  //setState(() => _autoValidate = true);
                } else {
                  setState(() => _autoValidate = true);
                }
              }),
        ],
      ),
    );
  }

  String _validateBoardDetails(String value) {
    if (value.isEmpty) return 'Board details required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validateBoardCost(String value) {
    if (value.isEmpty)
      return 'Cost is required.';
    else
      return null;
  }
}
