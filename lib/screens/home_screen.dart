import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'custom_screen.dart';
import 'package:tomatoes/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final yourName = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: new AssetImage("images/PomodoroTitlePage.png"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextField(
                maxLength: 8,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    counterText: '',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    filled: true,
                    hintStyle: kTextField,
                    hintText: "Enter your name",
                    fillColor: Colors.white70),
                controller: yourName,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: CustomScreen(name: yourName.text),
                    duration: Duration(milliseconds: 500),
                    reverseDuration: Duration(milliseconds: 500),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: kPink,
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 13),
                textStyle: TextStyle(fontSize: 15),
                shape: StadiumBorder(),
              ),
              child: Text(
                'Proceed',
                textAlign: TextAlign.center,
                style: kPinkButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
