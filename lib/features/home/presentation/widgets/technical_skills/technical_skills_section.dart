import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/home/data/models/technical_skill_model.dart';

import 'category_card.dart';

class TechnicalSkillsSection extends StatelessWidget {
  const TechnicalSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTitleSections(
          eyebrow: 'Toolkit',
          title: 'Technical skills',
        ),
        const SizedBox(height: 36),
        ResponsiveGrid(
          minItemWidth: 320,
          spacing: 16,
          children: [
            for (final category in technicalSkills)
              CategoryCard(category: category),
          ],
        ),
      ],
    );
  }
}
