import 'package:flutter/foundation.dart';
import 'package:mood_frontend/constants/moods.dart';
import '../models/song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/playlists_id.dart';

class SongProvider extends ChangeNotifier {
  List<Song> topSongsPlaylist = [];
  List<Song> sadSongsPlayList = [];
  List<Song> happySongsPlayList = [];
  List<Song> sleepySongsPlayList = [];
  bool isSad = false;
  bool isSpleepy = false;

  String smileProbability = '0';
  String leftEyeOpenProbability = '0';
  String rightEyeProbability = '0';
  var mood = Mood.Happy;
  String emoji = '';

  void predictEmoji() {
    switch (mood) {
      case Mood.Happy:
        emoji = '😊';
        break;
      case Mood.Sad:
        emoji = '😔';
        break;
      case Mood.Sleepy:
        emoji = '😴';
        break;
      default:
        emoji = '🤔';
        break;
    }
    notifyListeners();
  }

  void changeMood(var m) {
    mood = m;
    predictEmoji();
    notifyListeners();
  }

  void changeSmileProbability(String probability) {
    smileProbability = probability;
    notifyListeners();
  }

  void changeLeftEyeProbability(String probability) {
    leftEyeOpenProbability = probability;
    notifyListeners();
  }

  void changeRightEyeProbability(String probability) {
    rightEyeProbability = probability;
    notifyListeners();
  }

  void makeHappyPredictions() {
    isSad = false;
    notifyListeners();
  }

  void makeSadPredictions() {
    isSad = true;
    notifyListeners();
  }

  void makeSleepyPredictions() {
    isSpleepy = true;
    notifyListeners();
  }

  void addSong(Song song) {
    topSongsPlaylist.add(song);
    notifyListeners();
  }

  void toggleIsSad() {
    isSad = !isSad;
    notifyListeners();
  }

  void toggleIsSleepy() {
    isSpleepy = !isSpleepy;
    notifyListeners();
  }

  fillTopSongsPlaylist() async {
    String url = '$POPULAR_MUSIC_BASE_URL$TOP_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      topSongsPlaylist.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_medium'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }

  fillSadSongsPlaylist() async {
    String url = '$POPULAR_MUSIC_BASE_URL$SAD_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      sadSongsPlayList.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_medium'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }

  fillHappySongsPlaylist() async {
    String url = '$POPULAR_MUSIC_BASE_URL$HAPPY_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      happySongsPlayList.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_medium'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }

  fillSleepySongsPlaylist() async {
    String url = '$POPULAR_MUSIC_BASE_URL$SLEEPY_SONGS_PLAYLIST';
    http.Response response = await http.get(url);
    var tracks = jsonDecode(response.body)['tracks']['data'];
    for (int i = 0; i < tracks.length; i++) {
      sleepySongsPlayList.add(
        Song(
            artist: tracks[i]['artist']['name'],
            title: tracks[i]['title'],
            image: tracks[i]['album']['cover_medium'],
            preview: tracks[i]['preview'],
            duration: tracks[i]['duration']),
      );
    }
  }
}
