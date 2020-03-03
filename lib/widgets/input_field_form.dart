import 'package:flutter/material.dart';

class InputFieldForm extends StatelessWidget {
  final String hint;
  final BoxBorder border;

  InputFieldForm({this.hint, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            hintText: hint),
      ),
    );
  }
}
