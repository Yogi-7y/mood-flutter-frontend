import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mood_frontend/widgets/genre.dart';

class MoviesHeroCard extends StatelessWidget {
  final title;
  final imdbId;
  final year;
  final previewImage;
  final imdbRating;
  final rottenTomatoRating;
  final runtime;
  final language;
  final plot;
  final genres;
  final onClick;

  MoviesHeroCard(
      {this.imdbId,
      this.genres,
      this.imdbRating,
      this.language,
      this.plot,
      this.previewImage,
      this.rottenTomatoRating,
      this.runtime,
      this.title,
      this.year,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                // child: Center(
                //   child: Text(
                //     'hey',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                width: width * 0.4,
                height: height * 0.32,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 5.0),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(previewImage),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // SizedBox(
                          //   width: 8.0,
                          // ),
                          // Text(
                          //   year,
                          //   style: TextStyle(
                          //       color: Colors.white.withOpacity(.7),
                          //       fontSize: 20.0),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: RatingBar(
                        initialRating: double.parse(imdbRating) / 2,
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
                    ),
                    GenresWidget(
                      geners: genres,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            language,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
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
                            runtime,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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
                            rottenTomatoRating,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      plot,
                      maxLines: title.toString().length > 22 ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white.withOpacity(.7)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
