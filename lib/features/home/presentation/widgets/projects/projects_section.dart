import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTitleSections(
          eyebrow: 'Portfolio',
          title: 'Selected work',
          subtitle:
              'Booking, ordering, healthcare and education products — what each one needed and what I built.',
        ),
        const SizedBox(height: 36),
        for (var i = 0; i < projectsList.length; i++) ...[
          if (i > 0) const SizedBox(height: 28),
          ProjectCard(project: projectsList[i]),
        ],
      ],
    );
  }
}
