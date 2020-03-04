import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroText extends StatelessWidget {
  final double animationDelay;
  final List heroText;
  final double heroTextSize;

  HeroText({this.animationDelay, this.heroText, this.heroTextSize});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      ColorizeAnimatedTextKit(
        colors: [Colors.white, Colors.blue],
        alignment: AlignmentDirectional.topStart,
        text: heroText,
        textStyle: TextStyle(
            letterSpacing: 1.2,
            color: Colors.white,
            fontSize: heroTextSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
