import 'package:flutter/material.dart';
import '../model/showcase_step.dart';

class HighlightPainter extends CustomPainter {
  final Rect rect;
  final ShowcaseShape shape;

  HighlightPainter(this.rect, this.shape);

  @override
  void paint(Canvas canvas, Size size) {
    final background = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path hole;

    if (shape == ShowcaseShape.circle) {
      hole = Path()..addOval(rect.inflate(12));
    } else {
      hole = Path()
        ..addRRect(
          RRect.fromRectAndRadius(rect.inflate(8), const Radius.circular(12)),
        );
    }

    final finalPath =
    Path.combine(PathOperation.difference, background, hole);

    canvas.drawPath(
      finalPath,
      Paint()..color = Colors.black.withOpacity(0.75),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
