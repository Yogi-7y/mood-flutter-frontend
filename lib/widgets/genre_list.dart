import 'package:flutter/material.dart';

final genreStyle =
    TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14.0);

class GenresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Text(
            'Crime,',
            style: genreStyle,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text('Drama,', style: genreStyle),
          Text('Thriller', style: genreStyle),
        ],
      ),
    );
  }
}
