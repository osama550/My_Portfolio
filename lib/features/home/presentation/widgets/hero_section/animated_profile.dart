import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';

import 'floating_badge.dart';
import 'tech_grid_painter.dart';

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
      DeviceType.desktop => 500.0,
      DeviceType.tablet => 450.0,
      DeviceType.mobile => 350.0,
    };

    final double imageSize = switch (deviceType) {
      DeviceType.desktop => 280.0,
      DeviceType.tablet => 250.0,
      DeviceType.mobile => 200.0,
    };

    final double badge1Top = switch (deviceType) {
      DeviceType.desktop => 65.0,
      DeviceType.tablet => 55.0,
      DeviceType.mobile => 35.0,
    };

    final double badge1Right = switch (deviceType) {
      DeviceType.desktop => 0.0,
      DeviceType.tablet => 0.0,
      DeviceType.mobile => 0.0,
    };

    final double badge2Bottom = switch (deviceType) {
      DeviceType.desktop => 70.0,
      DeviceType.tablet => 55.0,
      DeviceType.mobile => 35.0,
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
                  painter: TechGridPainter(
                    color: ColorsPalette.primary,
                    imageSize: imageSize,
                  ),
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
                          image: AssetImage('assets/images/my_image3.webp'),
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
