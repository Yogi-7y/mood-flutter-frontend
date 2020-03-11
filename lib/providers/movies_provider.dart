import 'dart:convert';
import 'package:mood_frontend/models/movie.dart';

import '../models/movie_id.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/movies_const.dart';

class MovieProvider extends ChangeNotifier {
  final genreList = genre_list_const;
  final topPopularMovies = [];
  final topPopularMoviesId = [];

  fillTopPopularMoviesId() async {
    print('top popular movies');
    String url = '$MOVIES_ID_BASE_URL$popularMovies';
    http.Response response = await http.post(url, body: {'top_n': '5'});
    Map imdbId = jsonDecode(response.body)['result']['imdb_id'] as Map;
    Map data = jsonDecode(response.body)['result'] as Map;

    imdbId.forEach(
      (key, v) {
        topPopularMoviesId.add(
          MovieId(
            imdbId: v,
            movieTitle: data['original_title'][key],
            movieId: key,
          ),
        );
      },
    );
    print('inside id');
    fillTopPopularMovies();
    print('inside id completed');
  }

  fillTopPopularMovies() async {
    topPopularMoviesId.forEach(
      (movieId) async {
        Uri uri = Uri.http(
            'omdbapi.com', '', {'apikey': API_KEY, 'i': movieId.imdbId});
        http.Response response = await http.post(uri);
        final decoded = jsonDecode(response.body);
        topPopularMovies.add(
          Movie(
            imdbId: decoded['imdbID'],
            title: decoded['Title'],
            awards: decoded['Awards'],
            country: decoded['Country'],
            genres: decoded['Genre'].toString().split(','),
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
