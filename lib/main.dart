import 'package:flutter/material.dart';
import 'package:mood_frontend/screens/chat_screen.dart';
import 'package:mood_frontend/screens/login_screen.dart';
import 'package:mood_frontend/screens/registration_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
      ),
    );
