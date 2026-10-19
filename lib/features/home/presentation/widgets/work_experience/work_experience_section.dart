import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';

import '../../../data/models/work_experience_model.dart';
import 'experience_card.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTitleSections(
          eyebrow: 'History',
          title: 'Professional experience',
        ),
        const SizedBox(height: 36),
        Stack(
          children: [
            Positioned(
              left: 11,
              top: 40,
              bottom: 40,
              width: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [colors.accent, colors.borderStrong],
                    stops: [0, 0.4],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44),
              child: Column(
                children: [
                  for (var i = 0; i < workExperiences.length; i++) ...[
                    if (i > 0) const SizedBox(height: 16),
                    ExperienceCard(
                      experience: workExperiences[i],
                      isCurrent: i == 0,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
