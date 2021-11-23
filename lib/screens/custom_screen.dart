import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomatoes/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';
import 'package:tomatoes/components/button_operator.dart';
import 'package:tomatoes/components/button_tabs.dart';
import 'package:tomatoes/screens/result_screen.dart';
import 'package:tomatoes/pomodoro_brain.dart';

enum System { standard, military }
enum Quality { regular, customized, randomized }

class CustomScreen extends StatefulWidget {
  CustomScreen({required this.name});
  String name;

  @override
  _CustomScreenState createState() => _CustomScreenState(name: name);
}

class _CustomScreenState extends State<CustomScreen> {
  _CustomScreenState({required this.name});
  String name;
  Random random = new Random();

  System selectedSystem = System.standard;
  Quality selectedQuality = Quality.regular;
  int quantity = 4;
  int lPomodoro = 25;
  int lShortBreaks = 5;
  int lLongBreaks = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RichText(
                text: new TextSpan(
                  style: kHeading,
                  children: <TextSpan>[
                    new TextSpan(text: 'Hello, '),
                    new TextSpan(
                        text: name == "" ? 'there!' : name,
                        style: kOtherHeading),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 14, 20),
              child: Text(
                'Craft your preferred pomodoro technique.',
                style: kSubHeading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'System Time',
                style: kLabel,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ButtonTabs(
                    onPress: () {
                      setState(() {
                        selectedSystem = System.standard;
                      });
                    },
                    text: 'Standard',
                    left: 20,
                    right: 0,
                    colour: selectedSystem == System.standard
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    textFamily: selectedSystem == System.standard
                        ? 'Montserrat-Bold'
                        : 'Montserrat-Regular',
                  ),
                ),
                Expanded(
                  child: ButtonTabs(
                    onPress: () {
                      setState(() {
                        selectedSystem = System.military;
                      });
                    },
                    text: 'Military',
                    left: 0,
                    right: 20,
                    colour: selectedSystem == System.military
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    textFamily: selectedSystem == System.military
                        ? 'Montserrat-Bold'
                        : 'Montserrat-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Quality',
                style: kLabel,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ButtonTabs(
                    onPress: () {
                      setState(() {
                        selectedQuality = Quality.regular;
                        lPomodoro = 25;
                        lShortBreaks = 5;
                        lLongBreaks = 45;
                      });
                    },
                    text: 'Regular',
                    left: 20,
                    right: 0,
                    colour: selectedQuality == Quality.regular
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    textFamily: selectedQuality == Quality.regular
                        ? 'Montserrat-Bold'
                        : 'Montserrat-Regular',
                  ),
                ),
                Expanded(
                  child: ButtonTabs(
                    onPress: () {
                      setState(() {
                        selectedQuality = Quality.customized;
                      });
                    },
                    text: 'Customize',
                    left: 0,
                    right: 0,
                    colour: selectedQuality == Quality.customized
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    textFamily: selectedQuality == Quality.customized
                        ? 'Montserrat-Bold'
                        : 'Montserrat-Regular',
                  ),
                ),
                Expanded(
                  child: ButtonTabs(
                    onPress: () {
                      setState(() {
                        selectedQuality = Quality.randomized;
                        lPomodoro = random.nextInt(60) + 1;
                        lShortBreaks = random.nextInt(60) + 1;
                        lLongBreaks = random.nextInt(60) + 1;
                      });
                    },
                    text: 'Random',
                    left: 0,
                    right: 20,
                    colour: selectedQuality == Quality.randomized
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    textFamily: selectedQuality == Quality.randomized
                        ? 'Montserrat-Bold'
                        : 'Montserrat-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Quantity',
                style: kLabel,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ButtonOperator(
                      onPress: () {
                        setState(() {
                          if (quantity != 4) {
                            quantity = quantity - 4;
                          }
                        });
                      },
                      text: '–',
                      left: 20,
                      right: 5),
                ),
                Expanded(
                  flex: 2,
                  child: ButtonOperator(
                      text: quantity.toString(), left: 0, right: 0),
                ),
                Expanded(
                  flex: 1,
                  child: ButtonOperator(
                      onPress: () {
                        setState(() {
                          if (quantity < 10) {
                            quantity = quantity + 4;
                          }
                        });
                      },
                      text: '+',
                      left: 5,
                      right: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Pomodoro Length (min.): ' + lPomodoro.toString(),
                style: kLabel,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xfff1ead9),
                activeTrackColor: Color(0xff8BD3DD),
                thumbColor: Color(0xff001858),
                overlayColor: Color(0xffeb1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Slider(
                  value: lPomodoro.toDouble(),
                  min: 0.0,
                  max: 60.0,
                  onChanged: selectedQuality == Quality.regular
                      ? null
                      : (double newValue) {
                          setState(() {
                            lPomodoro = newValue.round();
                          });
                        },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Short Break Length (min.): ' + lShortBreaks.toString(),
                style: kLabel,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xfff1ead9),
                activeTrackColor: Color(0xff8BD3DD),
                thumbColor: Color(0xff001858),
                overlayColor: Color(0xffeb1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Slider(
                  value: lShortBreaks.toDouble(),
                  min: 0.0,
                  max: 60.0,
                  onChanged: selectedQuality == Quality.regular
                      ? null
                      : (double newValue) {
                          setState(() {
                            lShortBreaks = newValue.round();
                          });
                        },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Long Break Length (min.): ' + lLongBreaks.toString(),
                style: kLabel,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xfff1ead9),
                activeTrackColor: Color(0xff8BD3DD),
                thumbColor: Color(0xff001858),
                overlayColor: Color(0xffeb1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Slider(
                  value: lLongBreaks.toDouble(),
                  min: 0.0,
                  max: 60.0,
                  onChanged: selectedQuality == Quality.regular
                      ? null
                      : (double newValue) {
                          setState(() {
                            lLongBreaks = newValue.round();
                          });
                        },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  PomodoroBrain pomodoroBrain = new PomodoroBrain(
                      quantity: quantity,
                      lPomodoro: lPomodoro,
                      lShortBreak: lShortBreaks,
                      lLongBreak: lLongBreaks);
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: ResultScreen(
                        pomodoros: pomodoroBrain.calculatePomodoros(),
                        qPomodoro: pomodoroBrain.getPomodoroQuantity(),
                        qShortBreaks: pomodoroBrain.getShortBreaksQuantity(),
                        qLongBreaks: pomodoroBrain.getLongBreaksQuantity(),
                        totalTime: pomodoroBrain.getTotalTime(),
                        lPomodoro: lPomodoro,
                        lShortBreaks: lShortBreaks,
                        lLongBreaks: lLongBreaks,
                      ),
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF582AE),
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  textStyle: TextStyle(fontSize: 15),
                ),
                child: Text(
                  'Start Your Pomodoro!',
                  textAlign: TextAlign.center,
                  style: kPinkButtonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
