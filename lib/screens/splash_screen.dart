import 'package:flutter/material.dart';
import 'package:mood_frontend/providers/movies_provider.dart';

import 'package:mood_frontend/screens/login_screen.dart';
import 'package:mood_frontend/widgets/caption_text.dart';
import 'package:mood_frontend/widgets/splash_screen_gradient.dart';
import 'package:page_transition/page_transition.dart';
import '../animations/fade_animations.dart';
import 'package:provider/provider.dart';
import '../providers/songs_provider.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

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
//            artist: tracks[i]['artist']['name'],
//            title: tracks[i]['title'],
//            image: tracks[i]['album']['cover_xl'],
//            preview: tracks[i]['preview'],
//            duration: tracks[i]['duration']),
//      );
//    }
//    Fluttertoast.showToast(
//        msg: 'Data successfully loaded',
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0);
//
//    print('toast loaded');
//  }

  @override
  void initState() {
    super.initState();
//    getData();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation = Tween<double>(begin: 1.0, end: 32.0).animate(
        _scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(type: PageTransitionType.fade, child: LoginScreen()),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      // backgroundColor: Colors.red,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            SplashScreenGradient(
              positionTop: -60.0,
              animationDelay: 1.0,
            ),
            SplashScreenGradient(
              positionTop: -110.0,
              animationDelay: 1.5,
            ),
            SplashScreenGradient(
              positionTop: -160.0,
              animationDelay: 2.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  CaptionText(
                    text: 'You all call it music; we call it therapy.',
                    animationDelay: 1.3,
                    textSize: 20.0,
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  FadeAnimation(
                    1.6,
                    AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child) => Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _widthController,
                              builder: (context, child) => Container(
                                width: _widthAnimation.value,
                                height: 80,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue.withOpacity(.4)),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: InkWell(
                                    onTap: () {
                                      Provider.of<MovieProvider>(context,
                                              listen: false)
                                          .fillMoviesByGenreId();
                                      Provider.of<SongProvider>(context,
                                              listen: false)
                                          .fillTopSongsPlaylist();
                                      Provider.of<SongProvider>(context,
                                              listen: false)
                                          .fillHappySongsPlaylist();
                                      Provider.of<SongProvider>(context,
                                              listen: false)
                                          .fillSadSongsPlaylist();
                                      Provider.of<SongProvider>(context,
                                              listen: false)
                                          .fillSleepySongsPlaylist();

                                      _scaleController.forward();
                                    },
                                    child: Stack(children: <Widget>[
                                      AnimatedBuilder(
                                        animation: _positionController,
                                        builder: (context, child) => Positioned(
                                          left: _positionAnimation.value,
                                          child: AnimatedBuilder(
                                            animation: _scale2Controller,
                                            builder: (context, child) =>
                                                Transform.scale(
                                              scale: _scale2Animation.value,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue),
                                                child: hideIcon == false
                                                    ? Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
