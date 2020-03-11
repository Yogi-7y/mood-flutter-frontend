import 'package:flutter/material.dart';

final genreStyle =
    TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14.0);

class GenresWidget extends StatelessWidget {
  final List<String> geners;
  GenresWidget({this.geners});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 20.0,
          width: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: geners.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                geners[index],
                style: genreStyle,
              );
            },
          ),
        ),
      ],
    );
  }
}
