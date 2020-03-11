class MovieId {
  String movieTitle;
  String movieId;
  String imdbId;
  // String title;
  // String tagline;

  MovieId({this.imdbId, this.movieId, this.movieTitle});

  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //       imdbId: json['result']['imdb_id'],
  //       tagline: json['result']['tagline'],
  //       title: json['result']['original_title']);
  // }
}
