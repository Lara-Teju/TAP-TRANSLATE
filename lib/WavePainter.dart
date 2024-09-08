import 'package:flutter/material.dart';
import 'dart:math';

class WavePainter extends CustomPainter {
  final Animation<double> animation;

  WavePainter(this.animation) : super(repaint: animation);

  final List<WaveConfig> waves = [
    WaveConfig(height: 22.0, color: Colors.tealAccent.withOpacity(0.6), baselineOffset: 0.12,speed_no:3),
    WaveConfig(height: 15.0, color: Colors.teal.withOpacity(0.4), baselineOffset: 0.17,speed_no: 4),
    WaveConfig(height: 20.0, color: Colors.indigoAccent.withOpacity(0.4), baselineOffset: 0.22,speed_no: 2),
    WaveConfig(height: 13.0, color: Colors.deepPurpleAccent.withOpacity(0.45), baselineOffset: 0.26,speed_no: 5),
    WaveConfig(height: 9.5, color: Colors.deepPurple.withOpacity(0.6), baselineOffset: 0.30,speed_no: 4)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (final wave in waves) {
      final Paint paint = Paint()
        ..color = wave.color
        ..style = PaintingStyle.fill;

      final Path path = Path();
      final double waveHeight = wave.height;
      final double baselineOffset = size.height * wave.baselineOffset; // Use baseline offset
      final double speed = wave.speed_no * pi;

      path.moveTo(0, baselineOffset);

      for (double i = 0; i <= size.width; i++) {
        double dx = i;
        double dy = baselineOffset + waveHeight * sin((i / size.width * 4 * pi) + (animation.value * speed));
        path.lineTo(dx, dy);
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class WaveConfig {
  final double height;
  final double baselineOffset; // New property for baseline offset
  final Color color;
  final double speed_no;

  WaveConfig({required this.height, required this.color, required this.baselineOffset,required this.speed_no});
}
