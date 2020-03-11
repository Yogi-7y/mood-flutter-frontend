import 'package:flare_flutter/flare_actor.dart';
import 'package:mood_frontend/screens/home_screen.dart';
import 'package:mood_frontend/widgets/button_form.dart';
import 'package:mood_frontend/widgets/form_caption_link.dart';
import 'package:mood_frontend/widgets/form_container.dart';
import 'package:mood_frontend/widgets/input_field_form.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../animations/teddy_controller.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final isPasswordFocus = FocusNode();
  final usernameController = TextEditingController();
  final isUsernameFocused = FocusNode();
  String animationType = 'idle';
  // final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email, password;
  TeddyController _teddyController;

  @override
  void initState() {
    super.initState();

    _teddyController = TeddyController();
    // passwordController.addListener(
    //   () {
    //     if (isPasswordFocus.hasFocus) {
    //       setState(() {
    //         animationType = 'hands_up';
    //       });
    //     } else {
    //       setState(() {
    //         animationType = 'idle';
    //       });
    //     }
    //   },
    // );

    // usernameController.addListener(
    //   () {
    //     if (isUsernameFocused.hasFocus) {
    //       setState(() {
    //         animationType = 'test';
    //       });
    //     } else {
    //       setState(() {
    //         animationType = 'idle';
    //       });
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(left: 60.0),
              width: 350.0,
              height: 225.0,
              child: FlareActor(
                'assets/Teddy.flr',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                controller: _teddyController,
              ),
            ),
            // Flexible(
            //     // child: HeroText(
            //     //   animationDelay: 1.2,
            //     //   heroText: ["Login"],
            //     //   heroTextSize: 40.0,
            //     // ),
            //     ),
            // SizedBox(
            //   height: 30,
            // ),
            FormContainer(
              animationDelay: 1.5,
              formBorderRadius: 10.0,
              formPadding: 10.0,
              child: Column(
                children: <Widget>[
                  InputFieldForm(
                    inputType: TextInputType.emailAddress,
                    isObscure: false,
                    hint: 'Email or Phone number',
                    onCaretMoved: (Offset caret) {
                      _teddyController.lookAt(caret);
                    },
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300]),
                    ),
                    onTextChange: (value) {
                      setState(() {
                        // animationType = 'test';
                      });
                      email = value;
                    },
                  ),
                  InputFieldForm(
                    isFocused: isPasswordFocus,
                    isObscure: true,
                    onCaretMoved: (Offset caret) {
                      _teddyController.coverEyes(caret != null);
                      _teddyController.lookAt(null);
                    },
                    inputType: TextInputType.text,
                    hint: 'Password',
                    onTextChange: (value) {
                      password = value;
                      _teddyController.setPassword(value);
                      // setState(() {
                      //   animationType = 'hands_up';
                      // });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ButtonForm(
              animationDelay: 1.8,
              buttonText: 'Login',
              buttonWidth: 120.0,
              onButtonClick: () async {
                try {
                  Navigator.popAndPushNamed(context, HomeScreen.id);
                  // await _auth
                  //     .signInWithEmailAndPassword(
                  //         email: email, password: password)
                  //     .then(
                  //   (_) {
                  //     _teddyController.success();
                  //     Timer(
                  //       Duration(seconds: 2),
                  //       () {
                  //         Navigator.popAndPushNamed(context, HomeScreen.id);
                  //       },
                  //     );
                  //   },
                  // ).catchError(
                  //   (onError) {
                  //     _teddyController.fail();
                  //   },
                  // );
                } catch (e) {
                  _teddyController.fail();
                  print(e);
                }
                setState(() {
                  showSpinner = false;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: CaptionLinkForm(
                animationDelay: 1.8,
                text: 'New User?',
                textSize: 14.0,
                linkText: 'Sign up',
                onLinkTap: () {
                  print('hereeee');
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     type: PageTransitionType.fade,
                  //     child: RegistrationScreen(),
                  //   ),
                  // );
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
