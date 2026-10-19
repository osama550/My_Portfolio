import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class IntroRichText extends StatelessWidget {
  const IntroRichText({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.fluid(40, 6.4, 72);
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w800,
          height: 1.02,
          letterSpacing: -size * 0.035,
          color: colors.textPrimary,
        ),
        children: [
          const TextSpan(text: 'Flutter apps for '),
          TextSpan(
            text: 'real-time, multi-tenant products.',
            style: TextStyle(
              color: colors.accent,
              decoration: TextDecoration.underline,
              decorationThickness: 3,
              decorationColor: colors.accent.withValues(alpha: 0.35),
            ),
          ),
        ],
      ),
    );
  }
}
