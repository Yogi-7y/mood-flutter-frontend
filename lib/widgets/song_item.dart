import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongItem extends StatefulWidget {
  final title;
  final artist;
  final image;
  final duration;
  final preview;

  SongItem(this.title, this.artist, this.image, this.duration, this.preview);

  @override
  _SongItemState createState() => _SongItemState();
}

class _SongItemState extends State<SongItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('stopped');
    } else {
      print('did not stop');
    }
  }

  play() async {
    print('started');
    int result = await audioPlayer.play(widget.preview);
    if (result == 1) {
      print('played');
    } else {
      print('did not played');
    }
  }

  _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        play();
        _animationController.forward();
      } else {
        pause();
        _animationController.reverse();
      }
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _handleOnPressed(),
                  child: Container(
                      height: 60.0,
                      width: 60.0,
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white.withOpacity(0.7),
                        size: 40.0,
                      )),
                )
              ],
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        widget.artist,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '·',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '${widget.duration} secs',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7), fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
