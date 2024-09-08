// main.dart
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'text_to_morse_page.dart';
import 'morse_to_text_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/textToVibramorse': (context) => TextToVibramorsePage(),
        '/morseToText': (context) => MorseToTextPage(),
      },
    );
  }
}

