import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';

class GenreHorizontalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Consumer<MovieProvider>(
        builder: (context, movieData, child) {
          return ListView.builder(
            itemCount: movieData.genreList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Color(0xFF202020),
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text(
                    movieData.genreList[index].toUpperCase(),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
