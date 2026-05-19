import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_typography.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

import '../../../data/models/work_experience_model.dart';

class ExperienceCard extends StatefulWidget {
  final WorkExperienceModel experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final isMobile = context.isMobile;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: ColorsPalette.card,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: ColorsPalette.primary.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            else
              BoxShadow(
                color: ColorsPalette.shadow.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsive Header (Title, Company, Date, Location)
            if (isMobile)
              _buildMobileHeader(typography)
            else
              _buildDesktopHeader(typography),

            const SizedBox(height: 16),

            // Tech / Context Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.experience.tags
                  .map((tag) => _buildTag(tag, typography))
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Bullet Description Points
            ...widget.experience.bullets.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 8.0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: ColorsPalette.primary,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bullet,
                        style: typography.bodyMediumRegular.copyWith(
                          color: ColorsPalette.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopHeader(AppTypography typography) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.experience.role,
                style: typography.bodyXLargeBold.copyWith(
                  color: ColorsPalette.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: ColorsPalette.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.experience.period,
                  style: typography.bodyMediumMedium.copyWith(
                    color: ColorsPalette.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.experience.company,
                style: typography.bodyLargeBold.copyWith(
                  color: ColorsPalette.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: ColorsPalette.textHint,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.experience.location,
                  style: typography.bodyMediumRegular.copyWith(
                    color: ColorsPalette.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileHeader(AppTypography typography) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.experience.role,
          style: typography.bodyLargeBold.copyWith(
            color: ColorsPalette.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.experience.company,
          style: typography.bodyMediumBold.copyWith(
            color: ColorsPalette.primary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.calendar_today_rounded,
              size: 14,
              color: ColorsPalette.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              widget.experience.period,
              style: typography.bodyXSmallMedium.copyWith(
                color: ColorsPalette.textSecondary,
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.location_on_rounded,
              size: 14,
              color: ColorsPalette.textHint,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.experience.location,
                style: typography.bodyXSmallMedium.copyWith(
                  color: ColorsPalette.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String tag, AppTypography typography) {
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
}
