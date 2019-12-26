import 'package:flutter/material.dart';
import 'board_details.dart';
import 'owner_details.dart';
import 'parlour_details.dart';
import 'api_requests.dart';
import 'pre_board.dart';
import 'signup.dart';

APIRequests request = APIRequests();

//int no_of_boards=1;
void main() {
  runApp(MaterialApp(
    title: 'PlayerTown',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomeScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/signup': (context) => SignupScreen(),
      // '/board':  (context) => BoardDetails(noOfBoards: no_of_boards),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Welcome to Player Town'),

        backgroundColor: Colors.indigo[400],
      ),
      body: Center(
        child: RaisedButton(
          child: Text('SignUp'),
          onPressed: () {
            final result = Navigator.pushNamed(context, '/signup');
            print('Final result:');
            print(result);
          },
        ),
      ),
    );
  }
}
