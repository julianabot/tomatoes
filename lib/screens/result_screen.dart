import 'package:flutter/cupertino.dart';
import 'package:tomatoes/constants.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:tomatoes/components/pomodoro_tracker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tomatoes/screens/home_screen.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    required this.pomodoros,
    required this.qPomodoro,
    required this.qShortBreaks,
    required this.qLongBreaks,
    required this.totalTime,
    required this.lPomodoro,
    required this.lShortBreaks,
    required this.lLongBreaks,
  });
  List<int> pomodoros;
  int qPomodoro;
  int qShortBreaks;
  int qLongBreaks;
  int lPomodoro;
  int lShortBreaks;
  int lLongBreaks;
  int totalTime;

  _ResultScreenState createState() => _ResultScreenState(
        pomodoros: pomodoros,
        qPomodoro: qPomodoro,
        qShortBreaks: qShortBreaks,
        qLongBreaks: qLongBreaks,
        totalTime: totalTime,
        lPomodoro: lPomodoro,
        lShortBreaks: lShortBreaks,
        lLongBreaks: lLongBreaks,
      );
}

class _ResultScreenState extends State<ResultScreen> {
  _ResultScreenState({
    required this.pomodoros,
    required this.qPomodoro,
    required this.qShortBreaks,
    required this.qLongBreaks,
    required this.totalTime,
    required this.lPomodoro,
    required this.lShortBreaks,
    required this.lLongBreaks,
  });
  List<int> pomodoros;
  int qPomodoro;
  int qShortBreaks;
  int qLongBreaks;
  int lPomodoro;
  int lShortBreaks;
  int lLongBreaks;
  int totalTime;

  CountDownController _controller = CountDownController();
  int? counter;

  bool isEnabled = true;

  disableElevatedButton() {
    setState(() {
      isEnabled = false;
    });
  }

  void playSound(String audio) {
    final player = AudioCache(prefix: 'audio/');
    player.play(audio);
  }

  void confirm() {
    Alert(
      context: context,
      style: AlertStyle(titleStyle: kScoreLabel, descStyle: kSliderLabel),
      title: "Aww, that's so sad!".toUpperCase(),
      desc:
          "Anyway, life doesn't stop when you surrender. You can always try again!",
      buttons: [
        DialogButton(
          child: Text(
            "thanks",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
              fontSize: 15,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: HomeScreen(),
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500),
              ),
            );
          },
          color: Color(0xff1b4793),
          radius: BorderRadius.circular(20.0),
          width: 200,
        ),
      ],
    ).show();
    setState(() {
      playSound('fail.mp3');
      print(pomodoros);
    });
  }

  void ringtone() async {
    int duration = 0;
    int totalPom = qPomodoro + qLongBreaks + qShortBreaks;
    for (double i = 1; i <= totalPom; i++) {
      await Future.delayed(Duration(seconds: duration)).then((_) {
        setState(() {
          if (i % 2 == 0) {
            if (i % 8 == 0) {
              duration = lLongBreaks;
              qLongBreaks--;
              //print('naevis help');
              print("Long Break!" + lLongBreaks.toString());
            } else {
              duration = lShortBreaks;
              qShortBreaks--;
              print("Short Break!" + lShortBreaks.toString());
            }
          } else {
            duration = lPomodoro;
            qPomodoro--;
            print("Pomodoro!" + lPomodoro.toString());
          }
        });
        print("index number: " + i.toString());
      });
      playSound('alarm.mp3');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: RichText(
                  text: new TextSpan(
                    style: kHeading,
                    children: <TextSpan>[
                      new TextSpan(text: 'Tomato'),
                      new TextSpan(text: 'Go!', style: kOtherHeading),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: totalTime,
              //duration: totalTime * 60,

              initialDuration: 0,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,

              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 2.5,
              ringColor: kInactiveCardColor,
              fillColor: kPink,
              backgroundColor: kDarkBlue,
              backgroundGradient: null,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,

              textStyle: TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),

              //textFormat: CountdownTextFormat.HH_MM_SS,
              textFormat: CountdownTextFormat.MM_SS,

              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: false,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                print('RAWR gumana~!');
                print(totalTime);
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                Alert(
                  context: context,
                  style: AlertStyle(
                      titleStyle: kScoreLabel, descStyle: kSliderLabel),
                  title: "Happy for you!".toUpperCase(),
                  desc: "You made it. To more pomodoros to come!",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "thanks",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeScreen(),
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                      color: Color(0xff1b4793),
                      radius: BorderRadius.circular(20.0),
                      width: 200,
                    ),
                  ],
                ).show();
                playSound('success.mp3');
                print('Countdown Ended');
              },
            ),
            SizedBox(
              height: 30,
            ),
            PomodoroTracker(qPomodoro.toString(), qShortBreaks.toString(),
                qLongBreaks.toString(), kScoreNumber),
            PomodoroTracker(
                'Pomodoros', 'Short Breaks', 'Long Breaks', kScoreLabel),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: isEnabled
                    ? () {
                        _controller.start();
                        isEnabled = false;
                        ringtone();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: kDarkBlue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  'Start',
                  textAlign: TextAlign.center,
                  style: kStartLabel,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 20),
                child: ConfirmationSlider(
                  height: 64.0,
                  width: 350.0,
                  foregroundColor: kDarkBlue,
                  text: 'Surrender Now :(',
                  textStyle: kSliderLabel,
                  onConfirmation: () => confirm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
