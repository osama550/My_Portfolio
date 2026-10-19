import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = projectsList.where((p) => p.featured).toList();
    final compact = projectsList.where((p) => !p.featured).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTitleSections(
          eyebrow: 'Portfolio',
          title: 'Selected work',
          subtitle:
              'Production apps across booking, ordering and healthcare — what each one needed and what I built.',
        ),
        const SizedBox(height: 36),
        ResponsiveGrid(
          minItemWidth: 440,
          children: [
            for (final p in featured) ProjectCard(project: p, featured: true),
          ],
        ),
        const SizedBox(height: 20),
        ResponsiveGrid(
          minItemWidth: 300,
          children: [for (final p in compact) ProjectCard(project: p)],
        ),
      ],
    );
  }
}
