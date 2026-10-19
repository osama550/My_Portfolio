import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/app_button.dart';
import 'package:my_portfolio/core/widgets/mono_tag.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_image_carousel.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool featured;

  const ProjectCard({super.key, required this.project, this.featured = false});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final project = widget.project;
    final featured = widget.featured;
    final inset = featured ? 14.0 : 12.0;
    final tags = featured ? project.tags : project.tags.take(4).toList();
    final detailPadding = featured
        ? EdgeInsets.all(context.fluid(20, 3, 28))
        : const EdgeInsets.fromLTRB(14, 6, 14, 14);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(featured ? 22 : 20),
          border: Border.all(
            color: _isHovered ? colors.borderHover : colors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(inset, inset, inset, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(featured ? 14 : 12),
                child: ColoredBox(
                  color: colors.surfaceMuted,
                  child: project.inDevelopment
                      ? const _InDevelopmentBanner()
                      : ProjectImageCarousel(images: project.images),
                ),
              ),
            ),
            Padding(
              padding: detailPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        project.categoryIcon,
                        size: 14,
                        color: colors.accent,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          project.category,
                          style: AppFonts.mono(
                            size: 11.5,
                            color: colors.textHint,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    project.title,
                    style: TextStyle(
                      fontSize: featured ? 26 : 20,
                      fontWeight: FontWeight.w700,
                      height: featured ? 1.15 : 1.25,
                      letterSpacing: featured ? -0.39 : 0,
                      color: colors.heading,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: featured ? 15.5 : 14.5,
                      height: 1.6,
                      color: featured ? colors.textSecondary : colors.textMuted,
                    ),
                  ),
                  if (project.bullets.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    for (final bullet in project.bullets)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '—',
                              style: TextStyle(
                                fontSize: 14.5,
                                height: 1.5,
                                color: colors.accent,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                bullet,
                                style: TextStyle(
                                  fontSize: 14.5,
                                  height: 1.5,
                                  color: colors.textMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [for (final tag in tags) MonoTag(tag)],
                  ),
                  if (_links(project).isNotEmpty) ...[
                    const SizedBox(height: 22),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _links(project),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _links(ProjectModel project) {
    Widget link(String label, String url) => AppButton(
      label: label,
      trailingIcon: Icons.north_east_rounded,
      style: AppButtonStyle.outlined,
      compact: true,
      onPressed: () => launchExternalUrl(url),
    );

    return [
      if (project.googlePlayUrl != null)
        link('Google Play', project.googlePlayUrl!),
      if (project.appStoreUrl != null) link('App Store', project.appStoreUrl!),
      if (project.webUrl != null) link('Web app', project.webUrl!),
      if (project.githubUrl != null) link('Source code', project.githubUrl!),
    ];
  }
}

class _InDevelopmentBanner extends StatelessWidget {
  const _InDevelopmentBanner();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction_rounded, size: 44, color: colors.accent),
          const SizedBox(height: 12),
          Text(
            'Under development',
            style: AppFonts.mono(size: 13, color: colors.textHint),
          ),
        ],
      ),
    );
  }
}
