import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'experience_card.dart';
import '../../../data/models/work_experience_model.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Title Header
        const HeaderTitleSections(
          title1: 'Work ',
          title2: 'Experience',
          subtitle: 'My professional journey',
        ),
        const SizedBox(height: 48),

        // Timeline and Cards List
        Column(
          children: List.generate(workExperiences.length, (index) {
            final exp = workExperiences[index];
            final isLast = index == workExperiences.length - 1;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Timeline Graphic Column
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ), // Align dot with card title text
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: ColorsPalette.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorsPalette.primary.withValues(
                                alpha: 0.4,
                              ),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: isLast
                            ? const SizedBox.shrink()
                            : Container(width: 2, color: ColorsPalette.border),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24), // Gap between timeline and card
                  // Experience Card
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 32.0),
                      child: ExperienceCard(experience: exp),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
