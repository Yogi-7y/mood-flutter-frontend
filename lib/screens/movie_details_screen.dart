import 'package:flutter/material.dart';
import 'package:mood_frontend/constants/constants.dart';
import 'package:mood_frontend/models/movie.dart';
import 'package:mood_frontend/widgets/movie_details_widgets/movie_details_header.dart';
import 'package:mood_frontend/widgets/movie_details_widgets/story_line.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailsScreen({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMoviesScreenColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MovieDetailHeader(
              movie: movie,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: StoryLine(
                storyline: movie.plot,
              ),
            )
          ],
        ),
      ),
    );
  }
}
