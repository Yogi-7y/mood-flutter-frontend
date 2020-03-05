import 'package:flutter/material.dart';
import 'package:mood_frontend/models/song.dart';
import 'package:mood_frontend/widgets/item_card.dart';

import '../providers/songs_provider.dart';
import 'package:provider/provider.dart';

class PopularMusicList extends StatefulWidget {
  @override
  _PopularMusicListState createState() => _PopularMusicListState();
}

class _PopularMusicListState extends State<PopularMusicList> {
//  @override
//  void initState() {
//    super.initState();
//    print('init called');
////    getData();
//    print('init done');
//  }
//
//  getData() async {
//    bool isSad = Provider.of<SongProvider>(context, listen: false).isSad;
//    String url = isSad
//        ? '$POPULAR_MUSIC_BASE_URL$SAD_SONGS_PLAYLIST'
//        : '$POPULAR_MUSIC_BASE_URL$POPULAR_SONGS_PLAYLIST';
//    http.Response response = await http.get(url);
//    var tracks = jsonDecode(response.body)['tracks']['data'];
//    for (int i = 0; i < tracks.length; i++) {
//      Provider.of<SongProvider>(context, listen: false).addSong(
//        Song(
//          artist: tracks[i]['artist']['name'],
//          title: tracks[i]['title'],
//          image: tracks[i]['album']['cover_xl'],
//          preview: tracks[i]['preview'],
//          duration: tracks[i]['duration'],
//        ),
//      );
//    }
//  }

//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<SongProvider>(context).topSongsPlaylist.length,
        itemBuilder: (BuildContext context, int index) {
          Song song =
              Provider.of<SongProvider>(context).topSongsPlaylist[index];
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
