// SplashScreen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Tap_Translate.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    // Loop the video by restarting it when it ends
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    });

    // Navigate to home page after 15 seconds
    _timer = Timer(Duration(seconds: 15), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4535C1), // Light Beige
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA07A)), // Warm Orange
        ),
      ),
    );
  }
}
