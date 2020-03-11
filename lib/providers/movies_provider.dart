import 'dart:convert';
import 'package:mood_frontend/models/movie.dart';

import '../models/movie_id.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/movies_const.dart';
import '../constants/popular_movies.dart';

class MovieProvider extends ChangeNotifier {
  final genreList = genre_list_const;
  final moviesByGenre = [];
  final moviesByGenreId = [];
  final popularMovies = [];

  fillPopularMovies() {
    popularMoviesConst.forEach(
      (movie) {
        print('movie $movie');
        popularMovies.add(
          Movie(
            actors: movie['Actors'],
            awards: movie['Awards'],
            country: movie['Country'],
            genre: movie['Genre'].split(','),
            imdbId: movie['imdbID'],
            imdbRating: movie['imdbRating'],
            language: movie['Language'],
            numberOfVotes: movie['imdbVotes'],
            plot: movie['Plot'],
            poster: movie['Poster'],
            releaseDate: movie['Released'],
            rottenTomatoRatings: movie['Ratings'],
            runtime: movie['Runtime'],
            title: movie['Title'],
            writer: movie['Writer'],
            year: movie['Year'],
          ),
        );
      },
    );
  }

  fillMoviesByGenreId() async {
    try {
      String url = '$MOVIES_ID_BASE_URL$moviesPopularPath';
      http.Response response = await http.post(url, body: {'top_n': '20'});
      Map imdbId = jsonDecode(response.body)['result']['imdb_id'] as Map;

      Map data = jsonDecode(response.body)['result'] as Map;

      imdbId.forEach(
        (key, v) {
          moviesByGenreId.add(
            MovieId(
              imdbId: v,
              movieTitle: data['original_title'][key],
              movieId: key,
            ),
          );
        },
      );
    } catch (e) {
      throw e;
    }
    print('fill popular movies called');
    fillPopularMovies();
    print('fill popular movies executed');

    fillMovieByGenre();
  }

  fillMovieByGenre() async {
    moviesByGenreId.forEach(
      (movieId) async {
        Uri uri = Uri.http(
            'omdbapi.com', '', {'apikey': API_KEY, 'i': movieId.imdbId});
        http.Response response = await http.post(uri);
        final decoded = jsonDecode(response.body);

        moviesByGenre.add(
          Movie(
            imdbId: decoded['imdbID'],
            title: decoded['Title'],
            awards: decoded['Awards'],
            country: decoded['Country'],
            genre: decoded['Genre'].toString().split(','),
            actors: decoded['Actors'],
            imdbRating: decoded['imdbRating'],
            language: decoded['Language'],
            plot: decoded['Plot'],
            poster: decoded['Poster'],
            rottenTomatoRatings: decoded['Ratings'][1]['Value'],
            releaseDate: decoded['Released'],
            runtime: decoded['Runtime'],
            writer: decoded['Writer'],
            year: decoded['Year'],
            numberOfVotes: decoded['imdbVotes'],
          ),
        );
      },
    );
  }
}
