import 'package:flutter/material.dart';
import 'package:mood_frontend/widgets/hero_text.dart';

import 'movie_list_item.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          MovieListItem(),
        ],
      ),
    );
  }
}
