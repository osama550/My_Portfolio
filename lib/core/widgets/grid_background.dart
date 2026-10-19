import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

/// Draws a faint square grid behind [child], anchored at the top center.
class GridBackground extends StatelessWidget {
  const GridBackground({
    super.key,
    required this.child,
    this.cell = 64,
    this.opacity = 0.035,
  });

  final Widget child;
  final double cell;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(
        cell: cell,
        opacity: opacity,
        color: context.colors.gridLine,
      ),
      child: child,
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.cell,
    required this.opacity,
    required this.color,
  });

  final double cell;
  final double opacity;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: opacity)
      ..strokeWidth = 1;
    for (var x = (size.width / 2) % cell; x <= size.width; x += cell) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y <= size.height; y += cell) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.cell != cell || old.opacity != opacity || old.color != color;
}
