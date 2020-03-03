import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';
import './caption_text.dart';

class CaptionLinkForm extends StatelessWidget {
  final String text;
  final double animationDelay;
  final double textSize;
  final String linkText;
  final Function onLinkTap;

  CaptionLinkForm(
      {this.text,
      this.animationDelay,
      this.linkText,
      this.textSize,
      this.onLinkTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CaptionText(
            text: text,
            animationDelay: animationDelay,
            textSize: textSize,
          ),
          SizedBox(
            width: 6.0,
          ),
          GestureDetector(
            onTap: onLinkTap,
            child: FadeAnimation(
              animationDelay,
              Text(
                linkText,
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
