import 'package:flutter/material.dart';
import 'package:mood_frontend/widgets/genre_list.dart';
import 'package:mood_frontend/widgets/star_display_widget.dart';

class MoviesHeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              width: width * 0.4,
              height: height * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5.0),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          'Joker',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '(2019)',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: StarDisplayWidget(
                      filledStar: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 26,
                      ),
                      unfilledStar: Icon(
                        Icons.star_border,
                        color: Colors.grey,
                        size: 26,
                      ),
                      value: 3,
                    ),
                  ),
                  GenresWidget(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'English',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          '·',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          '122 min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white.withOpacity(.7)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
