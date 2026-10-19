import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/mono_tag.dart';

import '../../../data/models/work_experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final WorkExperienceModel experience;
  final bool isCurrent;

  const ExperienceCard({
    super.key,
    required this.experience,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final padding = context.fluid(22, 3, 32);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.border),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final when = _When(experience: experience);
              final details = _Details(experience: experience);
              if (constraints.maxWidth >= 560) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: when),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: details),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [when, const SizedBox(height: 14), details],
              );
            },
          ),
        ),
        Positioned(
          left: -44,
          top: 34,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCurrent ? ColorsPalette.primary : colors.background,
              border: Border.all(color: colors.accent, width: 2),
              boxShadow: [
                BoxShadow(color: colors.background, spreadRadius: 5),
                if (isCurrent)
                  const BoxShadow(color: ColorsPalette.primary, blurRadius: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _When extends StatelessWidget {
  final WorkExperienceModel experience;

  const _When({required this.experience});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: colors.accentTint,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            experience.period,
            style: AppFonts.mono(size: 12.5, color: colors.accent),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          experience.location,
          style: TextStyle(fontSize: 14, color: colors.textHint),
        ),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  final WorkExperienceModel experience;

  const _Details({required this.experience});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: colors.heading,
            ),
            children: [
              TextSpan(text: '${experience.role} '),
              TextSpan(
                text: 'at',
                style: TextStyle(
                  color: colors.textHint,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: ' ${experience.company}'),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              for (final bullet in experience.bullets)
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '—',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.55,
                          color: colors.accent,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          bullet,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.55,
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [for (final tag in experience.tags) MonoTag(tag)],
        ),
      ],
    );
  }
}
