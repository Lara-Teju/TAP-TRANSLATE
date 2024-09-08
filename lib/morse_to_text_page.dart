//morse_to_text_page.dart
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'text_converter.dart'; // Import the MorseToAlphabet class
import 'package:audioplayers/audioplayers.dart';


class MorseToTextPage extends StatefulWidget {
  @override
  _MorseToTextPageState createState() => _MorseToTextPageState();
}

class _MorseToTextPageState extends State<MorseToTextPage> {
  String _morseInput = '';
  String _translatedText = '';
  DateTime? _tapStartTime;

  void _handleTapStart() {
    _tapStartTime = DateTime.now();
  }

  void _handleTapEnd() async {
    if (_tapStartTime == null) return;

    final tapDuration = DateTime.now().difference(_tapStartTime!).inMilliseconds;
    _tapStartTime = null;

    if (tapDuration < 200) {
      // Dot (Short tap)
      setState(() {
        _morseInput += '.';
      });
      Vibration.vibrate(duration: 100);
    } else {
      // Dash (Long press)
      setState(() {
        _morseInput += '-';
      });
      Vibration.vibrate(duration: 300);
    }

    // Translate Morse to text if input ends with a space
    if (_morseInput.endsWith(' ')) {
      _translateMorse();
    }
  }

  void _translateMorse() {
    // Trim and translate the morse input
    final trimmedInput = _morseInput.trim();
    final translatedChar = MorseToAlphabet.translate(trimmedInput);

    if (translatedChar != null) {
      setState(() {
        _translatedText += translatedChar;
        _morseInput = ''; // Reset input
      });
    } else {
      setState(() {
        _morseInput = ''; // Reset input if invalid Morse code
      });
    }
  }

  void _handleSpace() {
    setState(() {
      _morseInput += ' ';
    });

    // Translate immediately after adding a space
    _translateMorse();
  }

  void _handleEndCharacter() {
    // Handle the end of a character explicitly
    _handleSpace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MORSE TO TEXT',
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF482880),
              Color(0xFF0072FF),
              Color(0xFF00C6FF),
              Color(0xFFB2F7EF),
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      _translatedText,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (_) => _handleTapStart(),
              onTapUp: (_) => _handleTapEnd(),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                child: Icon(Icons.touch_app, color: Colors.white, size: 45),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: _handleEndCharacter,
                  child: Text('End Character', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                ),
                SizedBox(width: 25), // Space between the buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: _handleSpace,
                  child: Text('Add Space', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

