import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mood_frontend/models/movie.dart';
import 'package:mood_frontend/widgets/movie_details_widgets/arc_iamge_banner.dart';
import 'package:mood_frontend/widgets/movie_details_widgets/poster.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;
  MovieDetailHeader({this.movie});

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.genre.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 160.0),
            child: ArcImageBanner(
              movie: movie,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 14.0,
            child: Container(
              child: Row(
                children: <Widget>[
                  Poster(
                    movie.poster,
                    height: 200.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  '${double.parse(movie.imdbRating) / 2}',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26.0),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  'Ratings',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.7),
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                RatingBar(
                                  initialRating:
                                      double.parse(movie.imdbRating) / 2,
                                  minRating: 1,
                                  itemSize: 26.0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Grade Now',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white70),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                            height: 40.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: _buildCategoryChips(textTheme),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
