import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants.dart';

void main() {
  runApp(TomatoesApp());
}

class TomatoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kYellowishWhiteBgColor,
      ),
      home: HomeScreen(),
    );
  }
}
