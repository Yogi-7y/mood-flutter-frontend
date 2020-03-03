import 'package:flutter/material.dart';
import 'package:mood_frontend/models/song.dart';
import 'package:mood_frontend/widgets/item_card.dart';
import 'package:http/http.dart' as http;
//import '../data/popular_music.dart';
import 'dart:convert';

class PopularMusicList extends StatefulWidget {
  @override
  _PopularMusicListState createState() => _PopularMusicListState();
}

class _PopularMusicListState extends State<PopularMusicList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var songs = [];

  getData() async {
    print('hey');
    http.Response response =
        await http.get('https://api.deezer.com/playlist/7335752284');
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      print(tracks[i]['album']);
      setState(() {
        songs.add(
          Song(
              title: tracks[i]['title'],
              image: tracks[i]['album']['cover_xl'],
              preview: tracks[i]['preview']),
        );
      });

    }
    print(songs.length);
  }

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
            preview: song.preview,
          );
        },
      ),
    );
  }
}
