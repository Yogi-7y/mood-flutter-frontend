import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  final title;
  final artist;
  final image;
  final duration;
  final preview;
  SongItem(this.title, this.artist, this.image, this.duration, this.preview);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => DetailedScreen(title, artist, image)));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 26.0),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      height: 60.0,
                      width: 60.0,
                      child: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white.withOpacity(0.7),
                        size: 40.0,
                      ))
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
                          fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(

                        child: Text(
                          artist,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 14.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '·',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '$duration secs',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 14.0),
                      )
                    ],
                  ),
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
