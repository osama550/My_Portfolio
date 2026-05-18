import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class AnimatedProfileWidget extends StatefulWidget {
  const AnimatedProfileWidget({super.key});

  @override
  State<AnimatedProfileWidget> createState() => _AnimatedProfileWidgetState();
}

class _AnimatedProfileWidgetState extends State<AnimatedProfileWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;

    // Responsive measurements
    final double containerSize = switch (deviceType) {
      DeviceType.desktop => 480.0,
      DeviceType.tablet => 390.0,
      DeviceType.mobile => 300.0,
    };

    final double imageSize = switch (deviceType) {
      DeviceType.desktop => 260.0,
      DeviceType.tablet => 210.0,
      DeviceType.mobile => 160.0,
    };

    final double badge1Top = switch (deviceType) {
      DeviceType.desktop => 55.0,
      DeviceType.tablet => 45.0,
      DeviceType.mobile => 25.0,
    };

    final double badge1Right = switch (deviceType) {
      DeviceType.desktop => 0.0,
      DeviceType.tablet => 0.0,
      DeviceType.mobile => 0.0,
    };

    final double badge2Bottom = switch (deviceType) {
      DeviceType.desktop => 65.0,
      DeviceType.tablet => 50.0,
      DeviceType.mobile => 30.0,
    };

    final double badge2Left = switch (deviceType) {
      DeviceType.desktop => 0.0,
      DeviceType.tablet => 0.0,
      DeviceType.mobile => 0.0,
    };

    return SizedBox(
      width: containerSize,
      height: containerSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Floating offsets (trigonometrically shifted to stay completely out of sync for hand-crafted quality)
          final double badge1Float =
              math.sin(_controller.value * 2 * math.pi) * 8.0;
          final double badge2Float =
              math.cos(_controller.value * 2 * math.pi) * 8.0;
          final double imageFloat =
              math.sin((_controller.value + 0.5) * 2 * math.pi) * 3.0;

          // Slowly rotating rotation value for the gradient halo aura
          final double rotationAngle = _controller.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // 1. Concentric circles/grid background
              Positioned.fill(
                child: CustomPaint(
                  painter: TechGridPainter(color: ColorsPalette.primary),
                ),
              ),

              // 2. Profile Image & Gradient Ring
              Transform.translate(
                offset: Offset(0, imageFloat),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer slowly rotating gradient ring
                    Transform.rotate(
                      angle: rotationAngle,
                      child: Container(
                        width: imageSize + 16,
                        height: imageSize + 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: [
                              ColorsPalette.primary,
                              ColorsPalette.success,
                              ColorsPalette.primaryLight,
                              ColorsPalette.primary,
                            ],
                            stops: [0.0, 0.4, 0.8, 1.0],
                          ),
                        ),
                      ),
                    ),
                    // Inner gap/ring border (solid background mask)
                    Container(
                      width: imageSize + 4,
                      height: imageSize + 4,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsPalette.scaffoldBackground,
                      ),
                    ),
                    // Main profile image
                    Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/my_image.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Floating Badge 1: 1.5+ YRS EXP
              Positioned(
                top: badge1Top,
                right: badge1Right,
                child: Transform.translate(
                  offset: Offset(0, badge1Float),
                  child: const FloatingBadge(
                    icon: Icons.workspace_premium_rounded,
                    title: '2+ YRS EXP',
                    iconColor: ColorsPalette.primary,
                    iconBgColor: ColorsPalette.primaryLight,
                  ),
                ),
              ),

              // 4. Floating Badge 2: Clean Arch
              Positioned(
                bottom: badge2Bottom,
                left: badge2Left,
                child: Transform.translate(
                  offset: Offset(0, badge2Float),
                  child: const FloatingBadge(
                    icon: Icons.layers_rounded,
                    title: 'Clean Arch',
                    iconColor: ColorsPalette.success,
                    iconBgColor: Color(0xFFDCFCE7), // Light success background
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FloatingBadge extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color iconBgColor;

  const FloatingBadge({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: ColorsPalette.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: ColorsPalette.border.withValues(alpha: 0.8),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsPalette.primary.withValues(alpha: 0.06),
            blurRadius: 16,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 16),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: typography.bodyXSmallBold.copyWith(
                  color: ColorsPalette.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TechGridPainter extends CustomPainter {
  final Color color;

  TechGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // Concentric Orbit 1 (Solid, light)
    canvas.drawCircle(center, maxRadius * 0.45, paint);

    // Concentric Orbit 2 (Dashed, slightly more distinct)
    final dashPaint = Paint()
      ..color = color.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    _drawDashedCircle(canvas, center, maxRadius * 0.70, dashPaint);

    // Concentric Orbit 3 (Solid, outer limit)
    canvas.drawCircle(center, maxRadius * 0.90, paint);

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
        center + Offset.fromDirection(-0.25 * math.pi, maxRadius * 0.70);
    canvas.drawCircle(dot1, 8, glowPaint);
    canvas.drawCircle(dot1, 3.5, dotPaint);

    // Node 2 (bottom left quadrant)
    final dot2 =
        center + Offset.fromDirection(0.75 * math.pi, maxRadius * 0.70);
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
