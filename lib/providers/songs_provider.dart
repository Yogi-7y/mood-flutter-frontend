import 'package:flutter/foundation.dart';
import '../models/song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/playlists_id.dart';

class SongProvider extends ChangeNotifier {
  List<Song> songs = [];
  List<Song> sadPlayList = [];
  bool isSad = false;

//  SongProvider() {
//    print('change notifier called');
//    getData();
//  }

  void addSong(Song song) {
    songs.add(song);
    notifyListeners();
  }

  void toggleIsSad() {
    isSad = !isSad;
    notifyListeners();
  }

  getData() async {
    print('getData() called.');
    String url = isSad
        ? '$POPULAR_MUSIC_BASE_URL$SAD_SONGS_PLAYLIST'
        : '$POPULAR_MUSIC_BASE_URL$POPULAR_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      songs.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_xl'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }

  getSadPlayList() async {
    print('getData() called.');
    String url = '$POPULAR_MUSIC_BASE_URL$SAD_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      sadPlayList.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_xl'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }
}
