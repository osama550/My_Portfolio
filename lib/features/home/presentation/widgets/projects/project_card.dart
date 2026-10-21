import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/app_button.dart';
import 'package:my_portfolio/core/widgets/mono_tag.dart';
import 'package:my_portfolio/core/widgets/status_pill.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_showcase_gallery.dart';

/// Full-width case study: showcase slides on top, then what the product is,
/// what I built and the stack.
class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final inset = context.fluid(10, 1.4, 14);
    return _HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(inset, inset, inset, 0),
            child: ProjectShowcaseGallery(
              title: project.title,
              showcases: project.showcases,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.fluid(20, 3, 32)),
            child: _ProjectDetails(project: project),
          ),
        ],
      ),
    );
  }
}

/// Owns the hover state so hovering never rebuilds the card's content.
class _HoverCard extends StatefulWidget {
  final Widget child;

  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _isHovered ? colors.borderHover : colors.border,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  final ProjectModel project;

  const _ProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final header = _Header(project: project);
    final description = Text(
      project.description,
      style: TextStyle(
        fontSize: 15.5,
        height: 1.6,
        color: colors.textSecondary,
      ),
    );
    final built = _Labeled(
      label: 'What I built',
      child: _Bullets(bullets: project.bullets),
    );
    final stack = _Labeled(
      label: 'Stack',
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [for (final tag in project.tags) MonoTag(tag)],
      ),
    );
    final links = _links(project);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 720) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header,
                    const SizedBox(height: 14),
                    description,
                    const SizedBox(height: 22),
                    stack,
                    if (links.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Wrap(spacing: 10, runSpacing: 10, children: links),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(flex: 4, child: built),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            const SizedBox(height: 14),
            description,
            const SizedBox(height: 22),
            built,
            const SizedBox(height: 20),
            stack,
            if (links.isNotEmpty) ...[
              const SizedBox(height: 22),
              Wrap(spacing: 10, runSpacing: 10, children: links),
            ],
          ],
        );
      },
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

class _Header extends StatelessWidget {
  final ProjectModel project;

  const _Header({required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final titleSize = context.fluid(22, 2.8, 28);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(project.categoryIcon, size: 14, color: colors.accent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                project.category,
                style: AppFonts.mono(size: 11.5, color: colors.textHint),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              project.title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
                height: 1.15,
                letterSpacing: -titleSize * 0.015,
                color: colors.heading,
              ),
            ),
            if (project.inDevelopment)
              const StatusPill(
                'In development',
                dotColor: ColorsPalette.warning,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
          ],
        ),
      ],
    );
  }
}

class _Labeled extends StatelessWidget {
  final String label;
  final Widget child;

  const _Labeled({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppFonts.mono(
            size: 11.5,
            color: colors.textHint,
            letterSpacing: 0.72,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _Bullets extends StatelessWidget {
  final List<String> bullets;

  const _Bullets({required this.bullets});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final bullet in bullets)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '—',
                  style: TextStyle(
                    fontSize: 14.5,
                    height: 1.55,
                    color: colors.accent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    bullet,
                    style: TextStyle(
                      fontSize: 14.5,
                      height: 1.55,
                      color: colors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
