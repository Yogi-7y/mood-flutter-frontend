import 'package:flutter/material.dart';
import '../animations/fade_animations.dart';

class FormContainer extends StatelessWidget {
  final double animationDelay;
  final double formPadding;
  final double formBorderRadius;
  final Widget child;

  FormContainer(
      {this.animationDelay,
      this.formPadding,
      this.child,
      this.formBorderRadius});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      Container(
          padding: EdgeInsets.all(formPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(formBorderRadius),
              color: Colors.white),
          child: child),
    );
  }
}
