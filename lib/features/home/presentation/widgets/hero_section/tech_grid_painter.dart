import 'dart:math' as math;

import 'package:flutter/material.dart';

class TechGridPainter extends CustomPainter {
  final Color color;
  final double imageSize;

  TechGridPainter({
    required this.color,
    required this.imageSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;
    final imageRadius = imageSize / 2;

    // Ensure the dashed circle and dots are always outside the image,
    // even if the container shrinks due to screen width constraints.
    final double orbit2Radius = math.max(maxRadius * 0.70, imageRadius + 24.0);

    // Concentric Orbit 1 (Solid, light)
    canvas.drawCircle(center, maxRadius * 0.45, paint);

    // Concentric Orbit 2 (Dashed, slightly more distinct)
    final dashPaint = Paint()
      ..color = color.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    _drawDashedCircle(canvas, center, orbit2Radius, dashPaint);

    // Concentric Orbit 3 (Solid, outer limit)
    canvas.drawCircle(center, math.max(maxRadius * 0.90, orbit2Radius + 15.0), paint);

    // Horizontal & Vertical Grid Lines
    final linePaint = Paint()
      ..color = color.withValues(alpha: 0.05)
      ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(0, center.dy),
      Offset(size.width, center.dy),
      linePaint,
    );
    canvas.drawLine(
      Offset(center.dx, 0),
      Offset(center.dx, size.height),
      linePaint,
    );

    // Dynamic Orbital dots for visual interest
    final dotPaint = Paint()
      ..color = color.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    // Node 1 (top right quadrant)
    final dot1 =
        center + Offset.fromDirection(-0.25 * math.pi, orbit2Radius);
    canvas.drawCircle(dot1, 8, glowPaint);
    canvas.drawCircle(dot1, 3.5, dotPaint);

    // Node 2 (bottom left quadrant)
    final dot2 =
        center + Offset.fromDirection(0.75 * math.pi, orbit2Radius);
    canvas.drawCircle(dot2, 8, glowPaint);
    canvas.drawCircle(dot2, 3.5, dotPaint);
  }

  void _drawDashedCircle(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint,
  ) {
    const int dashCount = 40;
    final double dashAngle = (2 * math.pi) / dashCount;
    for (int i = 0; i < dashCount; i++) {
      if (i % 2 == 0) {
        final double startAngle = i * dashAngle;

        final path = Path()
          ..addArc(
            Rect.fromCircle(center: center, radius: radius),
            startAngle,
            dashAngle,
          );
        canvas.drawPath(path, paint);
      }
    }
  }


  @override
  bool shouldRepaint(covariant TechGridPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.imageSize != imageSize;
  }
}
