import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

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
