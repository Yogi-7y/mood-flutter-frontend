import 'package:flutter/foundation.dart';
import '../models/song.dart';

class SongProvider extends ChangeNotifier {
  static const POPULAR_MUSIC_BASE_URL = 'https://api.deezer.com/playlist/';
  static const TOP_POP_NUMBER = '1140232701';

  List<Song> songs = [
    Song(
        artist: 'Ed Sherran',
        image:
            'https://e-cdns-images.dzcdn.net/images/cover/000a9228cecfcc7c2093d9cd7bb66447/1000x1000-000000-80-0-0.jpg',
        preview:
            "https://cdns-preview-a.dzcdn.net/stream/c-a91b6819c1de627ea291bbc69b77019c-4.mp3",
        title: 'Perfect',
        id: 142986206),
    Song(
        artist: 'Ed Sherran',
        image:
            'https://e-cdns-images.dzcdn.net/images/cover/000a9228cecfcc7c2093d9cd7bb66447/1000x1000-000000-80-0-0.jpg',
        preview:
            "https://cdns-preview-a.dzcdn.net/stream/c-a91b6819c1de627ea291bbc69b77019c-4.mp3",
        title: 'Perfect',
        id: 142986206),
    Song(
        artist: 'Ed Sherran',
        image:
            'https://e-cdns-images.dzcdn.net/images/cover/000a9228cecfcc7c2093d9cd7bb66447/1000x1000-000000-80-0-0.jpg',
        preview:
            "https://cdns-preview-a.dzcdn.net/stream/c-a91b6819c1de627ea291bbc69b77019c-4.mp3",
        title: 'Perfect',
        id: 142986206),
    Song(
        artist: 'Ed Sherran',
        image:
            'https://e-cdns-images.dzcdn.net/images/cover/000a9228cecfcc7c2093d9cd7bb66447/1000x1000-000000-80-0-0.jpg',
        preview:
            "https://cdns-preview-a.dzcdn.net/stream/c-a91b6819c1de627ea291bbc69b77019c-4.mp3",
        title: 'Perfect',
        id: 142986206),
  ];

  void addSong(Song song) {
    songs.add(song);
    notifyListeners();
  }
}
