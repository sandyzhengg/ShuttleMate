import 'package:flutter/material.dart';

class DashedCircularBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DashedCircularBorderPainter({required this.color, this.strokeWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 5;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double circumference = 2 * 3.141592653589793 * radius;
    double dashCount = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < dashCount; i++) {
      double startAngle = (i * (dashWidth + dashSpace)) / radius;
      double endAngle = startAngle + (dashWidth / radius);
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}