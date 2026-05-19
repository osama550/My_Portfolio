import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class SkillChip extends StatefulWidget {
  final String name;

  const SkillChip({super.key, required this.name});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered
              ? ColorsPalette.primary
              : ColorsPalette.scaffoldBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
            width: 1.0,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          widget.name,
          style: typography.bodyMediumBold.copyWith(
            color: _isHovered
                ? ColorsPalette.textWhite
                : ColorsPalette.textPrimary,
            fontSize: context.isMobile ? 12 : 14,
          ),
        ),
      ),
    );
  }
}
