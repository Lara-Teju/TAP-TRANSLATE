import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedBackgroundPainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedBackgroundPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final double t = animation.value;

    // Draw animated shapes
    paint.color = Colors.teal.withOpacity(0.6);
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      100 + 50 * sin(t * 2 * pi),
      paint,
    );

    paint.color = Colors.lightBlueAccent.withOpacity(0.6);
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.7),
      100 + 50 * cos(t * 2 * pi),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
