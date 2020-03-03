import 'package:flutter/material.dart';
import 'package:mood_frontend/screens/chat_screen.dart';
import 'package:mood_frontend/screens/login_screen.dart';
import 'package:mood_frontend/screens/registration_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          'splash_screen': (context) => SplashScreen(),
          'login_screen': (context) => LoginScreen(),
          'registration_screen': (context) => RegistrationScreen(),
          'chat_screen': (context) => ChatScreen(),
        },
      ),
    );
