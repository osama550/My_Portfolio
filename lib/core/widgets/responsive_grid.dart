import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Equal-width wrapping grid: as many columns as fit [minItemWidth], growing
/// to fill the row (like CSS `repeat(auto-fit, minmax(min, 1fr))`).
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    required this.minItemWidth,
    this.spacing = 20,
    this.runSpacing,
  });

  final List<Widget> children;
  final double minItemWidth;
  final double spacing;
  final double? runSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final fit = ((width + spacing) / (minItemWidth + spacing)).floor();
        final columns = math.max(1, math.min(fit, children.length));
        final itemWidth = (width - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing ?? spacing,
          children: [
            for (final child in children)
              SizedBox(width: itemWidth, child: child),
          ],
        );
      },
    );
  }
}
