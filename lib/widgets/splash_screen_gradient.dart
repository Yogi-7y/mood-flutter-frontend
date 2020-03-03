import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';

class SplashScreenGradient extends StatelessWidget {
  final double positionTop;
  final double animationDelay;

  SplashScreenGradient({this.positionTop, this.animationDelay});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: positionTop,
      left: 0,
      child: FadeAnimation(
        animationDelay,
        Container(
          width: width,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/splash_screen_gradient_pic.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
