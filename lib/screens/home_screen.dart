import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/screens/chat_screen.dart';
import 'package:mood_frontend/screens/movies_screen.dart';
import 'package:mood_frontend/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KBlueColor,
        elevation: 0,
        title: Text('Music'),
      ),
      backgroundColor: KBlueColor,
      resizeToAvoidBottomPadding: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
          child: Column(
            children: <Widget>[
              SearchTextField(),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_front),
            label: 'Image Picker',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.chat_bubble),
            label: 'Chat',
            onTap: () {
              Navigator.pushNamed(context, ChatScreen.id);
            },
          )
        ],
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Color(0xFF0d0d0d),
        overlayOpacity: 0.2,
        curve: Curves.bounceIn,
      ),
    );
  }
}
