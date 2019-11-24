import"package:flutter/material.dart";
import 'pre_board.dart';
import 'owner_details.dart';
import 'parlour_details.dart';
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{
  PageController _controller;
  void initState() {
    super.initState();
    _controller = new PageController(
        initialPage: 0, keepPage: false, viewportFraction: 1.0);
    //platform.setMessageHandler(changePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: <Widget>[
            OwnerDetails(),
            ParlourDetails(),
            PreBoard(),


          ],
        ),
      ),
    );
  }

}
