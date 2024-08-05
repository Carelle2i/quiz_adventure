import 'package:flutter/material.dart';

class DrawDottedhorizontalline extends CustomPainter {
  final Paint _paint;
  DrawDottedhorizontalline() : _paint = Paint() {
    _paint.color = Colors.grey.shade400; 
    _paint.strokeWidth = 2; 
    _paint.strokeCap = StrokeCap.square; 
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}