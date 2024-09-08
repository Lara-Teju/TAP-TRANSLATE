//text_to_morse_page.dart
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:audioplayers/audioplayers.dart';
import 'morse_converter.dart';

class TextToVibramorsePage extends StatefulWidget {
  @override
  _TextToVibramorsePageState createState() => _TextToVibramorsePageState();
}

class _TextToVibramorsePageState extends State<TextToVibramorsePage> {
  String inputText = '';
  bool isGlowing = false;
  double dotSize = 80.0;
  final int unit = 100; // Base unit in milliseconds
  final AudioPlayer audioPlayer = AudioPlayer();

  // Function to convert text to Morse code and trigger vibrations and sounds
  void convertTextToMorse() async {
    for (var char in inputText.toLowerCase().split('')) {
      if (char == ' ') {
        await Future.delayed(Duration(milliseconds: 7 * unit)); // Medium gap for spaces between words
      } else if (morseMap.containsKey(char)) {
        MorseCharacter currentMorseCharacter = morseMap[char]!;

        for (int i = 0; i < currentMorseCharacter.signals.length; i++) {
          if (currentMorseCharacter.signals[i] == 1) {
            setState(() {
              isGlowing = true;
              dotSize = 100.0;
            });
            Vibration.vibrate(duration: unit); // Dot vibration
            audioPlayer.play(AssetSource('assets/sounds/dot.mp3')); // Play dot sound
            await Future.delayed(Duration(milliseconds: unit));
          } else if (currentMorseCharacter.signals[i] == 2) {
            setState(() {
              isGlowing = true;
              dotSize = 150.0;
            });
            Vibration.vibrate(duration: 3 * unit); // Dash vibration
            audioPlayer.play(AssetSource('assets/sounds/dash.mp3')); // Play dash sound
            await Future.delayed(Duration(milliseconds: 3 * unit));
          }
          setState(() {
            isGlowing = false;
            dotSize = 50.0;
          });
          await Future.delayed(Duration(milliseconds: unit)); // Inter-element gap
        }
        await Future.delayed(Duration(milliseconds: 3 * unit)); // Short gap between letters
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TEXT TO MORSE',
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.purple, // Purple
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF482880), // Darker blue
                  Color(0xFF0072FF), // Indigo
                  Color(0xFF00C6FF), // Teal
                  Color(0xFFB2F7EF), // Light blue
                ],
                stops: [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Add space above the TextField
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        inputText = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: 'Enter text here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0, // Thickness of the border
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 5.0, // Thickness of the border
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 5.0, // Thickness of the border
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between TextField and button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Warm Orange
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: convertTextToMorse,
                  child: Text('Convert', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 25), // Space between button and AvatarGlow
                Expanded(
                  child: Center(
                    child: AvatarGlow(
                      endRadius: 170.0,
                      glowColor: Colors.redAccent,
                      animate: isGlowing,
                      duration: Duration(milliseconds: 500),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: dotSize,
                        height: dotSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(
                            color: Colors.red, // Border color
                            width: 5.0, // Thickness of the border
                          ),
                        ),
                      ),
                    ),
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
