import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_image_carousel.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: ColorsPalette.card,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.1),
                blurRadius: 24,
                offset: const Offset(0, 10),
              )
            else
              BoxShadow(
                color: ColorsPalette.shadow.withValues(alpha: 0.03),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Media Area with Carousel and Category Floating Badge
              Stack(
                children: [
                  ProjectImageCarousel(images: widget.project.images),

                  // Floating category icon badge in top-right
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: ColorsPalette.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorsPalette.black.withValues(alpha: 0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.project.categoryIcon,
                        color: ColorsPalette.primary,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),

              // Details Area
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.project.title,
                      style: typography.bodyXLargeBold.copyWith(
                        color: ColorsPalette.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      widget.project.description,
                      style: typography.bodyMediumRegular.copyWith(
                        color: ColorsPalette.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bullets Features list
                    ...widget.project.bullets.map(
                      (bullet) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 3.0, right: 8.0),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: ColorsPalette.primary,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                bullet,
                                style: typography.bodyMediumRegular.copyWith(
                                  color: ColorsPalette.textSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TECH STACK Header & Wrap tags
                    Text(
                      'TECH STACK',
                      style: typography.bodySmallBold.copyWith(
                        color: ColorsPalette.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags
                          .map((tag) => _buildTag(tag, typography))
                          .toList(),
                    ),
                    const SizedBox(height: 24),

                    // Action Buttons (conditionally rendered)
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        if (widget.project.googlePlayUrl != null)
                          _buildActionButton(
                            label: 'Google Play',
                            icon: Icons.play_arrow_rounded,
                            url: widget.project.googlePlayUrl!,
                            typography: typography,
                          ),
                        if (widget.project.appStoreUrl != null)
                          _buildActionButton(
                            label: 'App Store',
                            icon: Icons.apple_rounded,
                            url: widget.project.appStoreUrl!,
                            typography: typography,
                          ),
                        if (widget.project.webUrl != null)
                          _buildActionButton(
                            label: 'Website',
                            icon: Icons.language_rounded,
                            url: widget.project.webUrl!,
                            typography: typography,
                          ),
                        if (widget.project.githubUrl != null)
                          _buildActionButton(
                            label: 'Source Code',
                            icon: Icons.code_rounded,
                            url: widget.project.githubUrl!,
                            typography: typography,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String tag, var typography) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: ColorsPalette.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: typography.bodyXSmallBold.copyWith(color: ColorsPalette.primary),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required String url,
    required var typography,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorsPalette.primary.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsPalette.primary,
          foregroundColor: ColorsPalette.textWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => launchExternalUrl(url),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: ColorsPalette.textWhite),
            const SizedBox(width: 8),
            Text(
              label,
              style: typography.bodySmallBold.copyWith(
                color: ColorsPalette.textWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
