import 'package:flutter/material.dart';
import 'package:mood_frontend/widgets/genre.dart';
import 'package:mood_frontend/widgets/star_display_widget.dart';

class MovieListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        image: NetworkImage(
                            'https://m.media-amazon.com/images/M/MV5BYzE5MjY1ZDgtMTkyNC00MTMyLThhMjAtZGI5OTE1NzFlZGJjXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg'),
                      )),
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
                    'Deadpool',
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
                    StarDisplayWidget(
                      filledStar: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 22,
                      ),
                      unfilledStar: Icon(
                        Icons.star_border,
                        color: Colors.grey,
                        size: 22,
                      ),
                      value: 3,
                    ),
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
                            '68%',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                GenresWidget(),
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
    );
  }
}
