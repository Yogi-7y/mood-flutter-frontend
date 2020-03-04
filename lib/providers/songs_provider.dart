import 'package:flutter/foundation.dart';
import '../models/song.dart';

class SongProvider extends ChangeNotifier {
  static const POPULAR_MUSIC_BASE_URL = 'https://api.deezer.com/playlist/';
  static const TOP_POP_NUMBER = '1140232701';

//  List<Song> songs = getData();
  List<Song> songs = [];

  void addSong(Song song) {
    songs.add(song);
    notifyListeners();
  }
}
