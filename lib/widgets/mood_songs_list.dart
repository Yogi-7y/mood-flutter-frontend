import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/songs_provider.dart';

class MoodSongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Provider.of<SongProvider>(context).songs.length);
    return Container(
      child: Text(
        '${Provider.of<SongProvider>(context).songs.length}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
