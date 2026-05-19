import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/features/home/data/models/technical_skill_model.dart';
import 'skill_chip.dart';

class CategoryCard extends StatefulWidget {
  final TechnicalSkillModel category;

  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
        width: double.infinity,
        padding: const EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          color: ColorsPalette.card,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 10),
              )
            else
              BoxShadow(
                color: ColorsPalette.shadow.withValues(alpha: 0.02),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Title with Icon
            Row(
              children: [
                Icon(
                  widget.category.icon,
                  color: ColorsPalette.primary,
                  size: 26,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.category.title,
                    style: typography.bodyLargeBold.copyWith(
                      color: ColorsPalette.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Wrap containing all the Skill tags
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.category.skills
                  .map((skill) => SkillChip(name: skill))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
