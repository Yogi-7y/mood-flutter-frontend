import 'package:mood_frontend/screens/home_screen.dart';
import 'package:mood_frontend/screens/login_screen.dart';
import 'package:mood_frontend/widgets/button_form.dart';
import 'package:mood_frontend/widgets/form_caption_link.dart';
import 'package:mood_frontend/widgets/form_container.dart';
import 'package:mood_frontend/widgets/hero_text.dart';
import 'package:mood_frontend/widgets/input_field_form.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String username, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeroText(
                animationDelay: 1.2,
                heroText: ['Sign Up..'],
                heroTextSize: 40.0,
              ),
              SizedBox(
                height: 30,
              ),
              FormContainer(
                animationDelay: 1.5,
                formBorderRadius: 10.0,
                formPadding: 10.0,
                child: Column(
                  children: <Widget>[
                    InputFieldForm(
                      inputType: TextInputType.text,
                      isObscure: false,
                      hint: 'Username',
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      onTextChange: (value) {
                        username = value;
                      },
                    ),
                    InputFieldForm(
                      inputType: TextInputType.emailAddress,
                      isObscure: false,
                      hint: 'Email or Phone number',
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      onTextChange: (value) {
                        email = value;
                      },
                    ),
                    InputFieldForm(
                      inputType: TextInputType.text,
                      isObscure: true,
                      hint: 'Password',
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      onTextChange: (value) {
                        password = value;
                      },
                    ),
                    InputFieldForm(
                      inputType: TextInputType.text,
                      isObscure: true,
                      hint: 'Confirm Password',
                      onTextChange: (value) {
                        confirmPassword = value;
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
                buttonText: 'Sign up',
                buttonWidth: 120.0,
                onButtonClick: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (newUser != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: HomeScreen(), type: PageTransitionType.fade),
                      );
                    }
                  } catch (e) {
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
                  text: 'Already have an account?',
                  textSize: 14.0,
                  linkText: 'Sign in',
                  onLinkTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: LoginScreen()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
