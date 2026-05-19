import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/features/home/data/models/about_me_model.dart';

class AboutMeCard extends StatefulWidget {
  final AboutMeStrengthModel strength;

  const AboutMeCard({
    super.key,
    required this.strength,
  });

  @override
  State<AboutMeCard> createState() => _AboutMeCardState();
}

class _AboutMeCardState extends State<AboutMeCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: ColorsPalette.card,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            else
              BoxShadow(
                color: ColorsPalette.shadow.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.strength.icon, color: ColorsPalette.primary, size: 32),
            const SizedBox(height: 16),
            Text(
              widget.strength.title,
              style: typography.bodyLargeBold.copyWith(
                color: ColorsPalette.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.strength.description,
              style: typography.bodyMediumRegular.copyWith(
                color: ColorsPalette.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
