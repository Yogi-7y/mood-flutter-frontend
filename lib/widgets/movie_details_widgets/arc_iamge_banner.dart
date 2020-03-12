import 'package:flutter/material.dart';
import 'package:mood_frontend/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const api_key = '32e96f05d4d21cd2f67369d4451b2cf8';
const language = 'en-US';
const external_source = 'imdb_id';

var backdropImageUrl = '';

class ArcImageBanner extends StatelessWidget {
  final Movie movie;
  ArcImageBanner({this.movie});

  // Future<String> getBackdropImage() async {
  //   Uri uri = Uri.http('api.themoviedb.org', '/3/find/${movie.imdbId}', {
  //     'api_key': api_key,
  //     'language': language,
  //     'external_source': external_source
  //   });
  //   http.Response response = await http.get(uri);
  //   final decoded = jsonDecode(response.body);
  //   final backdropImagePath = decoded['movie_results'][0]['backdrop_path'];

  //   backdropImageUrl =
  //       'https://image.tmdb.org/t/p/w500https://image.tmdb.org/t/p/w500/6OTRuxpwUUGbmCX3MKP25dOmo59.jpg';

  //   return backdropImageUrl;
  // }

  Future<String> _getBackdropImage() async {
    Uri uri = Uri.http('api.themoviedb.org', '/3/find/${movie.imdbId}', {
      'api_key': api_key,
      'language': language,
      'external_source': external_source
    });

    http.Response response = await http.get(uri);
    final decoded =
        jsonDecode(response.body)['movie_results'][0]['backdrop_path'];
    final backdropImageUrl = 'https://image.tmdb.org/t/p/w500$decoded';

    return backdropImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: FutureBuilder(
        future: _getBackdropImage(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          // if (snapshot.data == null) {
          //   print('here');
          //   return Container(
          //     child: Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   );
          // } else {
          return Image.network(
            'https://image.tmdb.org/t/p/w500/6OTRuxpwUUGbmCX3MKP25dOmo59.jpg',
            width: screenWidth,
            height: 250.0,
            fit: BoxFit.cover,
          );
          // }
        },
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
