import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mood_frontend/widgets/genre.dart';

class MovieListItem extends StatelessWidget {
  final title;
  final previewImage;
  final genreList;
  final rottenTomatosRating;
  final imdbRating;
  final onClick;

  MovieListItem({
    this.title,
    this.imdbRating,
    this.genreList,
    this.previewImage,
    this.rottenTomatosRating,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 90.0,
                    width: 90.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(previewImage),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: <Widget>[
                      RatingBar(
                        initialRating: imdbRating,
                        minRating: 1,
                        itemSize: 20.0,
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
                      // StarDisplayWidget(
                      //   filledStar: Icon(
                      //     Icons.star,
                      //     color: Colors.yellow,
                      //     size: 22,
                      //   ),
                      //   unfilledStar: Icon(
                      //     Icons.star_border,
                      //     color: Colors.grey,
                      //     size: 22,
                      //   ),
                      //   value: 4,
                      // ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Image(
                              width: 25.0,
                              height: 25.0,
                              image: AssetImage('assets/images/tomato.png'),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            child: Text(
                              '$rottenTomatosRating',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.9),
                                  fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  GenresWidget(
                    geners: genreList,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Container(
                  //       child: Text(
                  //         'artist',
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(
                  //             color: Colors.white.withOpacity(0.5),
                  //             fontSize: 14.0),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.symmetric(horizontal: 4.0),
                  //       child: Text(
                  //         '·',
                  //         style: TextStyle(
                  //             color: Colors.white.withOpacity(0.8),
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     Text(
                  //       '120 secs',
                  //       overflow: TextOverflow.ellipsis,
                  //       style: TextStyle(
                  //           color: Colors.white.withOpacity(.7), fontSize: 14.0),
                  //     )
                  //   ],
                  // ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.white.withOpacity(0.6),
                size: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
