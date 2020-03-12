import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;
  Poster(
    this.posterUrl, {
    this.height = 180.0,
  });

  final String posterUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        elevation: 2.0,
        child: Image.network(
          posterUrl,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
