import 'package:http/http.dart' as http;
import '../models/song.dart';
import 'dart:convert';

const POPULAR_MUSIC_BASE_URL = 'https://api.deezer.com/playlist/';
const TOP_POP_NUMBER = '1140232701';

Future<List<Song>> getData() async {
  List<Song> songList = [];
  http.Response response =
      await http.get('$POPULAR_MUSIC_BASE_URL$TOP_POP_NUMBER');
  var tracks = jsonDecode(response.body)['tracks']['data'];
  for (int i = 0; i < tracks.length; i++) {
    print(tracks[i]['album']);
    // setState(() {
    songList.add(
      Song(
          artist: tracks[i]['artist']['name'],
          title: tracks[i]['title'],
          image: tracks[i]['album']['cover_xl'],
          preview: tracks[i]['preview']),
    );
    // });
  }
  print(songList.length);
  return songList;
}
