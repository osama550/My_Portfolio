import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class HeaderTitleSections extends StatelessWidget {
  const HeaderTitleSections({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final titleSize = context.fluid(30, 4.4, 44);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.44,
            color: colors.accent,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w700,
            height: 1.1,
            letterSpacing: -titleSize * 0.025,
            color: colors.textPrimary,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              subtitle!,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: colors.textMuted,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
