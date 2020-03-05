import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mood_frontend/constants/constants.dart';
import '../providers/songs_provider.dart';
import 'package:mood_frontend/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../constants/moods.dart';

class ImagePickerScreen extends StatefulWidget {
  static String id = 'image_picker_screen';

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File _imageFile;
  List<Face> _faces;
  bool isLoading = false;
  ui.Image _image;

  _getImageAndDetectFaces() async {
    final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        isLoading = true;
      },
    );
    final image = FirebaseVisionImage.fromFile(imageFile);
    final faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
          mode: FaceDetectorMode.accurate,
          enableClassification: true,
          enableLandmarks: true),
    );
    List<Face> faces = await faceDetector.processImage(image);
    if (mounted) {
      setState(
        () {
          _imageFile = imageFile;
          _faces = faces;
          _loadImage(imageFile);
        },
      );
    }
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then(
      (value) => setState(
        () {
          _image = value;
          isLoading = false;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<SongProvider>(context).mood.toString()),
        leading: null,
        automaticallyImplyLeading: false,
        backgroundColor: KBlueColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          )
        ],
      ),
      backgroundColor: KBlueColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (_imageFile == null)
              ? Center(
                  child: Icon(
                    Icons.image,
                    size: 100.0,
                    color: Colors.white,
                  ),
                )
              : Column(
                  children: <Widget>[
                    Center(
                      child: FittedBox(
                        child: SizedBox(
                          width: _image.width.toDouble(),
                          height: _image.height.toDouble(),
                          child: CustomPaint(
                            painter: FacePainter(_image, _faces, context),
                          ),
                        ),
                      ),
                    ),
                    Consumer<SongProvider>(
                      builder: (context, songData, child) {
                        return RaisedButton(
                          onPressed: () {
                            double smileProbability =
                                double.parse(songData.smileProbability);
                            double leftEyeOpen =
                                double.parse(songData.leftEyeOpenProbability);
                            double rightEyeOpen =
                                double.parse(songData.rightEyeProbability);

                            if (smileProbability > 0.5 &&
                                leftEyeOpen > 0.3 &&
                                rightEyeOpen > 0.3) {
                              songData.makeHappyPredictions();
                              songData.changeMood(Mood.Happy);
                            } else {
                              songData.makeSadPredictions();
                              songData.changeMood(Mood.Sad);
                            }

                            if (leftEyeOpen < 0.4 &&
                                rightEyeOpen < 0.4 &&
                                smileProbability < 0.4) {
                              songData.makeSleepyPredictions();
                              songData.changeMood(Mood.Sleepy);
                            }

                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          child: Text('hey'),
                        );
                      },
                    )
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndDetectFaces,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final ui.Image image;
  final List<Face> faces;
  final List<Rect> rects = [];
  BuildContext context;

  FacePainter(this.image, this.faces, BuildContext ctx) {
    context = ctx;
    for (var i = 0; i < faces.length; i++) {
      rects.add(faces[i].boundingBox);
    }
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..color = Colors.yellow;

    canvas.drawImage(image, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      String smileProbability = faces[i].smilingProbability.toStringAsFixed(2);
      String leftEyeOpenProbability =
          faces[i].leftEyeOpenProbability.toStringAsFixed(2);
      String rightEyeOpenProbability =
          faces[i].rightEyeOpenProbability.toStringAsFixed(2);
      Provider.of<SongProvider>(context, listen: false)
          .changeSmileProbability(smileProbability);
      Provider.of<SongProvider>(context, listen: false)
          .changeLeftEyeProbability(leftEyeOpenProbability);
      Provider.of<SongProvider>(context, listen: false)
          .changeRightEyeProbability(rightEyeOpenProbability);
      canvas.drawRect(rects[i], paint);
      // print('Smile Probability: $smileProbability');
      // print('left eye:  $leftEyeOpenProbability');
      // print('right eye:  $rightEyeOpenProbability');
      TextSpan span = new TextSpan(
          style: new TextStyle(color: Colors.deepPurple, fontSize: 24.0),
          text:
              'Smile: $smileProbability\n left eye: $leftEyeOpenProbability\n right eye: $rightEyeOpenProbability');
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, faces[i].boundingBox.bottomRight);
    }
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return image != oldDelegate.image || faces != oldDelegate.faces;
  }
}
