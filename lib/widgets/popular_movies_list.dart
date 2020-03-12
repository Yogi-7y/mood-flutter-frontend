import 'package:flutter/material.dart';
import 'package:mood_frontend/providers/movies_provider.dart';
import 'package:mood_frontend/screens/movie_details_screen.dart';
import 'package:mood_frontend/widgets/movie_hero_card.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';

class PopularMoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieData, child) {
        return Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieData.popularMovies.length,
            itemBuilder: (BuildContext context, int index) {
              Movie movie = movieData.popularMovies[index];
              print('movie : ${movie.title}');
              return MoviesHeroCard(
                genres: movie.genre,
                imdbId: movie.imdbId,
                imdbRating: movie.imdbRating,
                language: movie.language,
                plot: movie.plot,
                previewImage: movie.poster,
                rottenTomatoRating: movie.rottenTomatoRatings,
                runtime: movie.runtime,
                title: movie.title,
                year: movie.year,
                onClick: () {
                  print('movie title: ${movie.title}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        movie: movie,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
