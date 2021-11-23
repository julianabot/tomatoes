import 'package:flutter/material.dart';

class PomodoroTracker extends StatelessWidget {
  PomodoroTracker(
      @required this.pomodoro, this.pShortBreak, this.pLongBreak, this.pStyle);

  final String? pomodoro;
  final String? pShortBreak;
  final String? pLongBreak;
  final TextStyle? pStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              pomodoro ?? "",
              textAlign: TextAlign.center,
              style: pStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              pShortBreak ?? "",
              textAlign: TextAlign.center,
              style: pStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              pLongBreak ?? "",
              textAlign: TextAlign.center,
              style: pStyle,
            ),
          ),
        ],
      ),
    );
  }
}
