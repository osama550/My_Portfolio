import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/features/home/data/models/about_me_model.dart';

import 'about_me_card.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Align(
          child: HeaderTitleSections(
            title1: 'About ',
            title2: 'Me',
            subtitle: 'Get to know me better',
          ),
        ),
        const SizedBox(height: 32),

        // About Me Description Paragraphs
        ...aboutMeData.paragraphs.asMap().entries.map(
          (entry) {
            final index = entry.key;
            final paragraph = entry.value;
            final isLast = index == aboutMeData.paragraphs.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 48.0 : 24.0),
              child: Text(
                paragraph,
                style: typography.bodyLargeRegular.copyWith(
                  color: ColorsPalette.textSecondary,
                  height: 1.6,
                ),
              ),
            );
          },
        ),

        // Responsive Grid/List of Cards
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutMeCard(
                    strength: aboutMeData.strengths[0],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AboutMeCard(
                    strength: aboutMeData.strengths[1],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutMeCard(
                    strength: aboutMeData.strengths[2],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AboutMeCard(
                    strength: aboutMeData.strengths[3],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
