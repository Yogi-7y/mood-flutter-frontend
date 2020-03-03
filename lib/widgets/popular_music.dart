import 'package:flutter/material.dart';
import 'package:mood_frontend/models/song.dart';
import 'package:mood_frontend/widgets/item_card.dart';
import '../data/popular_music.dart';

class PopularMusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          Song song = songs[index];
          return ItemCard(
            image: song.image,
            title: song.title,
          );
        },
      ),
    );
  }
}
