import 'package:flutter/material.dart';

class BadgeDivider extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double thickness;
  final double indent;

  const BadgeDivider({
    super.key,
    this.icon = Icons.code, // Default to the code icon from your image
    this.color,
    this.thickness = 1.0,
    this.indent = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    // Fallback to primary color if no color is provided
    final themeColor = color ?? Theme.of(context).primaryColor;

    return Row(
      children: [
        // Left fading line
        Expanded(
          child: Container(
            height: thickness,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [themeColor.withValues(alpha: 0.0), themeColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),

        // Central Badge Space
        Padding(
          padding: EdgeInsets.symmetric(horizontal: indent),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // The Diamond Background
              Transform.rotate(
                angle: 0.785398, // 45 degrees in radians
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: themeColor.withValues(
                      alpha: 0.05,
                    ), // Light background tint
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // Slightly rounded corners
                    border: Border.all(
                      color: themeColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                ),
              ),
              // The Icon in the center (unrotated)
              Icon(icon, color: themeColor, size: 18),
            ],
          ),
        ),

        // Right fading line
        Expanded(
          child: Container(
            height: thickness,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [themeColor, themeColor.withValues(alpha: 0.0)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
