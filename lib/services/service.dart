//getData() async {
//  const POPULAR_MUSIC_BASE_URL = 'https://api.deezer.com/playlist/';
//  const TOP_POP_NUMBER = '1140232701';
//  http.Response response =
//  await http.get('$POPULAR_MUSIC_BASE_URL$TOP_POP_NUMBER');
//  var tracks = jsonDecode(response.body)['tracks']['data'];
//  for (int i = 0; i < tracks.length; i++) {
//    Provider.of<SongProvider>(context, listen: false).addSong(
//      Song(
//          artist: tracks[i]['artist']['name'],
//          title: tracks[i]['title'],
//          image: tracks[i]['album']['cover_xl'],
//          preview: tracks[i]['preview']),
//    );
//  }
//}
