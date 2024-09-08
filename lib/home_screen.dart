// HomeScreen.dart
import 'package:flutter/material.dart';
import 'WavePainter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: WavePainter(_animationController),
            child: Container(),
          ),
          Align(
            alignment: Alignment.center, // Change Center to Align
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 100), // Add space at the top to lower the buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/textToVibramorse');
                  },
                  child: Text(
                    'Text to Morse',
                    style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/morseToText');
                  },
                  child: Text(
                    'Morse to Text',
                    style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
