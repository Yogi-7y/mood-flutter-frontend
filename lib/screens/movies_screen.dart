import 'package:flutter/material.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/screens/home_screen.dart';
import 'package:mood_frontend/widgets/genre_horizontal_bar.dart';
import 'package:mood_frontend/widgets/movie_list.dart';

import 'package:mood_frontend/widgets/popular_movies_list.dart';
import '../widgets/custom_search_delegate.dart';

class MoviesScreen extends StatefulWidget {
  static String id = 'movies_screen';

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
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
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: PopularMoviesList()),
          Expanded(flex: 2, child: GenreHorizontalBar()),
          Expanded(flex: 7, child: MovieList()),
        ],
      ),
    );
  }
}
