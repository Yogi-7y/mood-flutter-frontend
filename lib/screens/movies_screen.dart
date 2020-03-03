import 'package:flutter/material.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/screens/home_screen.dart';

class MoviesScreen extends StatelessWidget {
  static String id = 'movies_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlueColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Movies Header'),
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            ),
            ListTile(
              title: Text('Music'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              },
            ),
            ListTile(
              title: Text('Movies'),
              onTap: () {
                Navigator.pushReplacementNamed(context, MoviesScreen.id);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: KBlueColor,
        elevation: 0,
        title: Text('Movies'),
      ),
    );
  }
}
