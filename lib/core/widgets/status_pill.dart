import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class StatusPill extends StatelessWidget {
  const StatusPill(
    this.label, {
    super.key,
    this.background,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  });

  final String label;
  final Color? background;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background ?? colors.surface,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: ColorsPalette.success,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: ColorsPalette.success, blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: AppFonts.mono(color: colors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
