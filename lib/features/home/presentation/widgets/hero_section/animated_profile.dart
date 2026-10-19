import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
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
    final colors = context.colors;
    final chipFont = context.fluid(13, 1.6, 16);

    return AspectRatio(
      aspectRatio: 10 / 11,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _BackdropPainter(colors.borderStrong),
                ),
              ),
              Positioned(
                top: h * 0.02,
                left: w * 0.24,
                child: const _Dot(
                  size: 14,
                  color: ColorsPalette.success,
                  glow: true,
                ),
              ),
              Positioned(
                top: h * 0.02,
                left: w * 0.60,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorsPalette.info, width: 3),
                  ),
                ),
              ),
              Positioned(
                top: h * 0.20,
                right: w * 0.04,
                child: const _Dot(
                  size: 14,
                  color: ColorsPalette.error,
                  glow: true,
                ),
              ),
              Positioned(
                left: w * 0.10,
                right: w * 0.10,
                top: h * 0.06,
                bottom: h * 0.04,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: colors.surfaceRaised,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.borderStrong),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 60,
                        offset: Offset(0, 24),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/my_image3.webp',
                    fit: BoxFit.contain,
                    alignment: const Alignment(0, -0.3),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: h * 0.42,
                child: _Floating(
                  controller: _controller,
                  phase: 0,
                  child: _Bubble(fontSize: chipFont),
                ),
              ),
              Positioned(
                right: 0,
                top: h * 0.64,
                child: _Floating(
                  controller: _controller,
                  phase: 0.25,
                  child: const _ExperienceChip(),
                ),
              ),
              Positioned(
                left: w * 0.02,
                bottom: h * 0.06,
                child: _Floating(
                  controller: _controller,
                  phase: 0.5,
                  child: const _StackChip(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Applies a gentle vertical bob to [child].
class _Floating extends StatelessWidget {
  final AnimationController controller;
  final double phase;
  final Widget child;

  const _Floating({
    required this.controller,
    required this.phase,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        final dy = math.sin((controller.value + phase) * 2 * math.pi) * 5;
        return Transform.translate(offset: Offset(0, dy), child: child);
      },
    );
  }
}

class _Dot extends StatelessWidget {
  final double size;
  final Color color;
  final bool glow;

  const _Dot({required this.size, required this.color, this.glow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: glow ? [BoxShadow(color: color, blurRadius: 16)] : null,
      ),
    );
  }
}

const _chipShadow = [
  BoxShadow(color: Color(0x66000000), blurRadius: 24, offset: Offset(0, 8)),
];

class _Bubble extends StatelessWidget {
  final double fontSize;

  const _Bubble({required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 18, 10),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomRight: Radius.circular(18),
          bottomLeft: Radius.circular(4),
        ),
        border: Border.all(color: colors.borderStrong),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.accentTint,
              shape: BoxShape.circle,
            ),
            child: const Text('👋', style: TextStyle(fontSize: 19)),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hi, I’m Osama',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  color: colors.heading,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: fontSize - 3,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: colors.textHint,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceChip extends StatelessWidget {
  const _ExperienceChip();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 18, 8),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.borderStrong),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorsPalette.primaryLight, ColorsPalette.primary],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorsPalette.primary.withValues(alpha: 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              '2+',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
                color: ColorsPalette.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Years of',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: colors.textHint,
                ),
              ),
              Text(
                'Experience',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                  color: colors.heading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StackChip extends StatelessWidget {
  const _StackChip();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.borderStrong),
        boxShadow: _chipShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: ColorsPalette.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text('Flutter · Dart', style: AppFonts.mono(color: colors.heading)),
        ],
      ),
    );
  }
}

class _BackdropPainter extends CustomPainter {
  final Color ringColor;

  _BackdropPainter(this.ringColor);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.46);

    final glowRadius = size.width * 0.86 / 2;
    canvas.drawCircle(
      center,
      glowRadius,
      Paint()
        ..shader = RadialGradient(
          colors: [
            ColorsPalette.primary.withValues(alpha: 0.22),
            Colors.transparent,
          ],
          stops: const [0, 0.68],
        ).createShader(Rect.fromCircle(center: center, radius: glowRadius)),
    );

    final ringRadius = size.width * 1.12 / 2;
    final ring = Paint()
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const dash = 4.0;
    const gap = 4.0;
    final step = (dash + gap) / ringRadius;
    for (var a = 0.0; a < 2 * math.pi; a += step) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: ringRadius),
        a,
        dash / ringRadius,
        false,
        ring,
      );
    }
  }

  @override
  bool shouldRepaint(_BackdropPainter oldDelegate) =>
      oldDelegate.ringColor != ringColor;
}
