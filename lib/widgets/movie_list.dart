import 'package:flutter/material.dart';

import 'package:mood_frontend/widgets/hero_text.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';
import 'movie_list_item.dart';
import '../models/movie.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              HeroText(
                animationDelay: 1.2,
                heroText: ['Recommendations'],
                heroTextSize: 26.0,
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Consumer<MovieProvider>(
            builder: (context, movieData, child) {
              print('length: ${movieData.moviesByGenre.length}');
              return Expanded(
                child: ListView.builder(
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  itemCount: movieData.moviesByGenre.length,
                  itemBuilder: (BuildContext context, int index) {
                    Movie movie = movieData.moviesByGenre[index] as Movie;
                    final _imdbRating = double.parse(movie.imdbRating);

                    return MovieListItem(
                      imdbRating: _imdbRating / 2,
                      title: movie.title,
                      previewImage: movie.poster,
                      genreList: movie.genre,
                      rottenTomatosRating: movie.rottenTomatoRatings,
                      onClick: () {
                        print('movie name: ${movie.title}');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MovieDetailsPage(movie),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
