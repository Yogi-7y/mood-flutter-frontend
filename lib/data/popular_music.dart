import '../models/song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mood_frontend/models/song.dart';

getData() async {
  print('hey');
  http.Response response =
      await http.get('https://api.deezer.com/playlist/7335752284');
  var tracks = jsonDecode(response.body)['tracks']['data'];
  for (int i = 0; i < tracks.length; i++) {
    print(tracks[i]['album']);
    songs.add(
      Song(
          title: tracks[i]['title'],
          image: tracks[i]['album']['cover_xl'],
          preview: tracks[i]['preview']),
    );
  }
  print(songs.length);
}

final songs = [
  Song(
      artist: 'Ed Sherran',
      image:
          'https://e-cdns-images.dzcdn.net/images/cover/000a9228cecfcc7c2093d9cd7bb66447/1000x1000-000000-80-0-0.jpg',
      preview:
          "https://cdns-preview-a.dzcdn.net/stream/c-a91b6819c1de627ea291bbc69b77019c-4.mp3",
      title: 'Perfect',
      id: 142986206),
];
