import 'package:flutter/material.dart';
import 'package:mood_frontend/widgets/song_item.dart';
import '../providers/songs_provider.dart';
import './hero_text.dart';
import '../models/song.dart';
import 'package:provider/provider.dart';
import '../constants/moods.dart';

class MoodSongList extends StatefulWidget {
  @override
  _MoodSongListState createState() => _MoodSongListState();
}

class _MoodSongListState extends State<MoodSongList> {
  String emoji = '🤔';

  _buildRestaurants(BuildContext context, SongProvider songData) {
    List<Widget> musicList = [];
    var playlist;
    // var playlist = songData.isSad
    //     ? songData.sadSongsPlayList
    //     : songData.happySongsPlayList;

    switch (songData.mood) {
      case Mood.Happy:
        playlist = songData.happySongsPlayList;
        emoji = '😊';
        break;
      case Mood.Sad:
        playlist = songData.sadSongsPlayList;
        emoji = '😔';
        break;
      case Mood.Sleepy:
        playlist = songData.sleepySongsPlayList;
        emoji = '😴';
        break;
      default:
        playlist = songData.happySongsPlayList;
        emoji = '🤔';
        break;
    }
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
    print(
        '${Provider.of<SongProvider>(context).happySongsPlayList.length} songs here');
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeroText(
            animationDelay: 1.2,
            heroText: [
              'Recommendations ${Provider.of<SongProvider>(context).emoji}'
            ],
            heroTextSize: 26.0,
          ),
          SizedBox(
            height: 4.0,
          ),
          Consumer<SongProvider>(
            builder: (context, songData, child) {
              print('smile: ${songData.smileProbability}');
              print('left eye: ${songData.leftEyeOpenProbability}');
              print('right eye: ${songData.rightEyeProbability}');
              return _buildRestaurants(context, songData);
            },
          )
        ],
      ),
    );
  }
}
