import 'package:flutter/material.dart';

const KAppGlobalColor = Color.fromRGBO(3, 9, 23, 1);
const KBlueColor = Color(0xFF090e42);
const KPinkColor = Color(0xFFff6b80);
const KMoviesScreenColor = Color(0xFF060304);

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.white70),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
