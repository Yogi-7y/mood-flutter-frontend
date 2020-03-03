import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';

class HeroText extends StatelessWidget {
  final double animationDelay;
  final String heroText;
  final double heroTextSize;

  HeroText({this.animationDelay, this.heroText, this.heroTextSize});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      Text(
        heroText,
        style: TextStyle(
            color: Colors.white,
            fontSize: heroTextSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
