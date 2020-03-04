import 'package:flutter/material.dart';
import 'package:mood_frontend/models/song.dart';
import 'package:mood_frontend/widgets/item_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../providers/songs_provider.dart';
import 'package:provider/provider.dart';

class PopularMusicList extends StatefulWidget {
  @override
  _PopularMusicListState createState() => _PopularMusicListState();
}

class _PopularMusicListState extends State<PopularMusicList> {
  static const POPULAR_MUSIC_BASE_URL = 'https://api.deezer.com/playlist/';
  static const TOP_POP_NUMBER = '1140232701';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    http.Response response =
        await http.get('$POPULAR_MUSIC_BASE_URL$TOP_POP_NUMBER');
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      Provider.of<SongProvider>(context, listen: false).addSong(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_xl'],
            preview: tracks[i]['preview']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<SongProvider>(context).songs.length,
        itemBuilder: (BuildContext context, int index) {
          Song song = Provider.of<SongProvider>(context).songs[index];
          return ItemCard(
            image: song.image,
            title: song.title,
            preview: song.preview,
            artist: song.artist,
          );
        },
      ),
    );
  }
}
