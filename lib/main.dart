import 'package:flutter/material.dart';
import 'package:mood_frontend/providers/movies_provider.dart';
import 'package:mood_frontend/providers/songs_provider.dart';
import 'package:mood_frontend/screens/chat_screen.dart';
import 'package:mood_frontend/screens/home_screen.dart';
import 'package:mood_frontend/screens/login_screen.dart';
import 'package:mood_frontend/screens/movies_screen.dart';
import 'package:mood_frontend/screens/pick_image_screen.dart';
import 'package:mood_frontend/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SongProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MovieProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegistrationScreen.id: (context) => RegistrationScreen(),
            ChatScreen.id: (context) => ChatScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            MoviesScreen.id: (context) => MoviesScreen(),
            ImagePickerScreen.id: (context) => ImagePickerScreen(),
          },
        ),
      ),
    );
