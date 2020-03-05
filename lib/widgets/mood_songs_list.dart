import 'package:flutter/material.dart';
import 'package:mood_frontend/widgets/song_item.dart';
import '../providers/songs_provider.dart';
import './hero_text.dart';
import '../models/song.dart';
import 'package:provider/provider.dart';

class MoodSongList extends StatelessWidget {
  _buildRestaurants(BuildContext context, SongProvider songData) {
    List<Widget> musicList = [];
    var playlist = songData.isSad ? songData.sadPlayList : songData.songs;
    playlist.forEach(
      (Song song) {
        musicList.add(SongItem(song.title, song.artist, song.image,
            song.duration.toString(), song.preview));
      },
    );
    return Column(children: musicList);
  }

  @override
  Widget build(BuildContext context) {
    print('${Provider.of<SongProvider>(context).songs.length} songs here');
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeroText(
            animationDelay: 1.2,
            heroText: ['Mood: ${Provider.of<SongProvider>(context).isSad}'],
            heroTextSize: 26.0,
          ),
          SizedBox(
            height: 4.0,
          ),
          Consumer<SongProvider>(
            builder: (context, songData, child) {
              return _buildRestaurants(context, songData);
            },
          )
        ],
      ),
    );
  }
}
