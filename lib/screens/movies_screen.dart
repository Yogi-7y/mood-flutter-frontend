import 'package:flutter/material.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/screens/home_screen.dart';
import 'package:mood_frontend/widgets/movie_hero_card.dart';
import '../widgets/custom_search_delegate.dart';

class MoviesScreen extends StatelessWidget {
  static String id = 'movies_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMoviesScreenColor,
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
        backgroundColor: KMoviesScreenColor,
        elevation: 0,
        title: Text('Movies'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            children: <Widget>[
              Container(
                child: MoviesHeroCard(),
              ),
              Container(
                color: Color(0xFFBF5542),
              ),
              Container(
                color: Color(0xFFE1030E),
              ),
            ],
          )),
    );
  }
}
