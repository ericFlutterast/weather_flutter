import 'dart:math';

import 'package:flutter/material.dart';

class DegreesWidget extends StatelessWidget {
  final String currentTemp;
  final double size;
  final Color color;
  final Offset offset;

  const DegreesWidget({
    super.key,
    required this.currentTemp,
    required this.size,
    required this.color,
    this.offset = const Offset(0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentTemp,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w200,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        CustomPaint(
          painter: DegreesCircle(
            size: 20,
            width: 3,
            color: color,
            offset: offset,
          ),
        ),
      ],
    );
  }
}

class DegreesCircle extends CustomPainter {
  final Offset offset;
  final double size;
  final double width;
  final Color color;

  DegreesCircle({
    required this.color,
    required this.size,
    required this.width,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = width;

    canvas.drawArc(
      offset & Size(this.size, this.size),
      pi,
      pi * 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
