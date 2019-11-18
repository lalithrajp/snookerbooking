import 'package:flutter/material.dart';
import 'board_details.dart';
import 'owner_details.dart';
import 'parlour_details.dart';
import 'api_requests.dart';

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

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>  with AutomaticKeepAliveClientMixin<SignupScreen>{
  int no_of_boards = 1;
  int no_of_boards_temp = 1;
  PageController _controller;
  void initState() {
    super.initState();
    _controller = new PageController(
        initialPage: 0, keepPage: false, viewportFraction: 1.0);
    //platform.setMessageHandler(changePage);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _columns = new List.generate(
        no_of_boards, (int i) => new Board(boardNumber: no_of_boards));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: PageView(
          scrollDirection: Axis.vertical,
            controller: _controller,
          children: <Widget>[
            OwnerDetails(),
            ParlourDetails(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                    shape: ,
                    onPressed: () {
                      setState(() {
                        no_of_boards = no_of_boards_temp;
                        //BoardDetails(noOfBoards: no_of_boards);
                        //Navigator.pushNamed(context, '/board');
                        print('Visited here');
                        _controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
                      });

                      // Navigate to the second screen using a named route.
                      //  Navigator.pushNamed(context, '/signup');
                    }),
              ],
            ),
        Container(
          margin: EdgeInsets.only(bottom: 200.0),
          height: 200.0,
          child:ListView(
              //scrollDirection: Axis.horizontal,
            //child: Wrap(
                    //child: Column(
                    children: _columns
            //),
          ),),
            RaisedButton(
                child: Text('Confirm'),
                onPressed: () {
                  setState(() {
                    var response = sendDataToServer();
                    Navigator.pop(context, response);
                  });

                }),
          ],
        ),

      ),
    );
  }
  Future<String> sendDataToServer() async{
    String url =
        'https://virtserver.swaggerhub.com/SacredMinds/SnookerBooker/1.0.0/parlour';
    Map map = {
      'data': {
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
      },
    };
    return await request.apiPOSTRequest(url, map);
  }

  @override//This is to save data while scrolling through pages
  bool get wantKeepAlive => true;
}

//return TextFormField(
////autovalidate: true,
//
//return null;
//},
