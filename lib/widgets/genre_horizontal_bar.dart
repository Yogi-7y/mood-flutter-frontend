import 'package:flutter/material.dart';

class GenreHorizontalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: dummyData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 6.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color:
                  dummyData[index] == 'Horror' ? Colors.red : Color(0xFF202020),
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                dummyData[index].toUpperCase(),
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          );
        },
      ),
    );
  }
}

final dummyData = [
  'Action',
  'Comedy',
  'Horror',
  'Sci-Fi',
  'Adventure',
  'Animation',
  'Children',
  'Biopic',
  'Documentry'
];
