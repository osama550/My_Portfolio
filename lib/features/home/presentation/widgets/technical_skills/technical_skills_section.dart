import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/features/home/data/models/technical_skill_model.dart';

import 'category_card.dart';

class TechnicalSkillsSection extends StatelessWidget {
  const TechnicalSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;

    // Responsive grid layout based on screen width/device type
    Widget content;
    if (deviceType == DeviceType.desktop) {
      // 3 columns layout
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: technicalSkills[0]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[2]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: technicalSkills[1]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[4]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: technicalSkills[3]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[5]),
              ],
            ),
          ),
        ],
      );
    } else if (deviceType == DeviceType.tablet) {
      // 2 columns layout
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: technicalSkills[0]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[2]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[4]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: technicalSkills[1]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[3]),
                const SizedBox(height: 24),
                CategoryCard(category: technicalSkills[5]),
              ],
            ),
          ),
        ],
      );
    } else {
      // Mobile: 1 column layout
      content = Column(
        children: technicalSkills
            .map(
              (category) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CategoryCard(category: category),
              ),
            )
            .toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Title Header
        const HeaderTitleSections(
          title1: 'Technical ',
          title2: 'Skills',
          subtitle: 'Technologies I work with',
        ),
        const SizedBox(height: 48),

        // Categories & Skills Listing
        content,
      ],
    );
  }
}
