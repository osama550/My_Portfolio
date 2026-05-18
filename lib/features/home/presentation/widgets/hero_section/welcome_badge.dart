import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class WelcomeBadge extends StatelessWidget {
  const WelcomeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsPalette.primaryLight,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        '👋 Welcome to my Portfolio',
        style: typography.bodySmallBold.copyWith(
          color: ColorsPalette.primary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
