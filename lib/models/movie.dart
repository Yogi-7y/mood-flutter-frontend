class Movie {
  String imdbId;
  String title;
  String year;
  String releaseDate;
  String runtime;
  List<String> genre;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String rottenTomatoRatings;
  String imdbRating;
  String numberOfVotes;

  Movie({
    this.actors,
    this.awards,
    this.country,
    this.genre,
    this.imdbId,
    this.imdbRating,
    this.language,
    this.plot,
    this.poster,
    this.numberOfVotes,
    this.rottenTomatoRatings,
    this.releaseDate,
    this.runtime,
    this.title,
    this.writer,
    this.year,
  });
}
