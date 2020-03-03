import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final double animationDelay;
  final double textSize;

  CaptionText({this.animationDelay, this.text, this.textSize});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      Text(
        text,
        style: TextStyle(
            color: Colors.white.withOpacity(.7),
            height: 1.4,
            fontSize: textSize),
      ),
    );
  }
}
