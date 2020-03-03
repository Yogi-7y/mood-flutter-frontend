import 'package:flutter/material.dart';

class InputFieldForm extends StatelessWidget {
  final String hint;
  final BoxBorder border;
  final Function onTextChange;
  final bool isObscure;
  final TextInputType inputType;

  InputFieldForm(
      {this.hint,
      this.border,
      this.onTextChange,
      this.inputType,
      this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: TextField(
        keyboardType: inputType,
        obscureText: isObscure ? true : false,
        onChanged: onTextChange,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            hintText: hint),
      ),
    );
  }
}
