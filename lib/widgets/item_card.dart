import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ItemCard extends StatefulWidget {
  final image;
  final String title;
  final preview;
  final artist;

  ItemCard({this.image, this.title, this.preview, this.artist});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              child: Center(
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50.0,
                  color: Colors.white,
                  onPressed: () => _handleOnPressed(),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 150.0,
              width: 120.0,
            ),
          ),
        ),
        Container(
          width: 120.0,
          child: Column(
            children: <Widget>[
              Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.start,
              ),
              Text(
                widget.artist,
                style: TextStyle(
                    color: Colors.white.withOpacity(.7), fontSize: 12.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
