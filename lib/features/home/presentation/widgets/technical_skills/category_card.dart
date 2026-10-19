import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/data/models/technical_skill_model.dart';

import 'skill_chip.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class CategoryCard extends StatelessWidget {
  final TechnicalSkillModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: colors.textHint,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in category.skills) SkillChip(name: skill),
            ],
          ),
        ],
      ),
    );
  }
}
