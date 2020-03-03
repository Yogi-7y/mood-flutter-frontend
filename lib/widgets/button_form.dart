import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';

class ButtonForm extends StatelessWidget {
  final double animationDelay;
  final double buttonWidth;
  final String buttonText;
  final Function onButtonClick;

  ButtonForm(
      {this.animationDelay,
      this.buttonText,
      this.buttonWidth,
      this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      Center(
        child: GestureDetector(
          onTap: onButtonClick,
          child: Container(
            width: buttonWidth,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[800]),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white.withOpacity(.7)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
