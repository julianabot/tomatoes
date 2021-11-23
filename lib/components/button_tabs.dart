import 'package:flutter/material.dart';
import 'package:tomatoes/constants.dart';

class ButtonTabs extends StatelessWidget {
  ButtonTabs(
      {@required this.onPress,
      @required this.text,
      @required this.left,
      @required this.right,
      this.colour,
      this.textFamily});

  final String? text;
  final double? left;
  final double? right;
  final Function()? onPress;
  final Color? colour;
  final String? textFamily;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: textFamily ?? "",
            fontWeight: FontWeight.bold,
          ),
        ),
        margin: EdgeInsets.fromLTRB((left ?? 0), 8, (right ?? 0), 0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: (colour ?? kInactiveCardColor),
        ),
      ),
    );
  }
}
