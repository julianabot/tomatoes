import 'package:flutter/material.dart';
import 'package:tomatoes/constants.dart';

class ButtonOperator extends StatelessWidget {
  @override
  ButtonOperator(
      {@required this.text,
      @required this.left,
      @required this.right,
      this.onPress});

  final String? text;
  final double? left;
  final double? right;
  final Function()? onPress;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Montserrat-Bold',
          ),
        ),
        margin: EdgeInsets.fromLTRB((left ?? 0), 8, (right ?? 0), 0),
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kInactiveCardColor,
        ),
      ),
    );
  }
}
