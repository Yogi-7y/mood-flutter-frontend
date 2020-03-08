import 'package:flutter/material.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/screens/movies_screen.dart';
import 'package:mood_frontend/widgets/custom_floating_action_button.dart';
import 'package:mood_frontend/widgets/hero_text.dart';
import 'package:mood_frontend/widgets/mood_songs_list.dart';
import 'package:mood_frontend/widgets/popular_music.dart';
import 'package:mood_frontend/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KMoviesScreenColor,
        elevation: 0,
        title: Text('Music'),
      ),
      backgroundColor: KMoviesScreenColor,
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
          child: ListView(
            children: <Widget>[
              SearchTextField(),
              SizedBox(
                height: 10.0,
              ),
              HeroText(
                animationDelay: 1.2,
                heroText: ['Popular Songs'],
                heroTextSize: 26.0,
              ),
              SizedBox(
                height: 6.0,
              ),
              PopularMusicList(),
              SizedBox(
                height: 4.0,
              ),
              MoodSongList(),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
