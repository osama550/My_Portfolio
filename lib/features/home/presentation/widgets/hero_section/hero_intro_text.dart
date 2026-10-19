import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/mono_tag.dart';
import 'package:my_portfolio/core/widgets/status_pill.dart';

import 'hero_stats.dart';
import 'intro_action_buttons.dart';
import 'intro_rich_text.dart';
import 'social_links.dart';

class HeroIntroText extends StatelessWidget {
  final VoidCallback? onViewProjectsPressed;
  final VoidCallback? onDownloadCVPressed;
  final VoidCallback? onGetInTouchPressed;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onLinkedinPressed;
  final VoidCallback? onEmailPressed;
  final VoidCallback? onShalehiPressed;

  const HeroIntroText({
    super.key,
    this.onViewProjectsPressed,
    this.onDownloadCVPressed,
    this.onGetInTouchPressed,
    this.onGithubPressed,
    this.onLinkedinPressed,
    this.onEmailPressed,
    this.onShalehiPressed,
  });

  static const _tags = [
    'Flutter',
    'Dart',
    'BLoC / Cubit',
    'Clean Architecture',
    'Firebase',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strong = TextStyle(
      color: colors.heading,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StatusPill('Flutter Developer at Barq Solutions · Remote'),
        const SizedBox(height: 24),
        const IntroRichText(),
        const SizedBox(height: 26),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: context.fluid(15.5, 1.8, 18),
                height: 1.7,
                color: colors.textSecondary,
              ),
              children: [
                TextSpan(
                  text:
                      'I’m Osama, a Flutter developer with 2+ years building booking, ordering and healthcare apps for mobile and web. I structure features with ',
                ),
                TextSpan(text: 'Clean Architecture', style: strong),
                TextSpan(text: ' and '),
                TextSpan(text: 'BLoC', style: strong),
                TextSpan(
                  text:
                      ' to keep code modular and testable, with real-time updates, offline-first storage and KNET payments.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final tag in _tags)
              MonoTag(
                tag,
                background: colors.surface,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6,
                ),
              ),
          ],
        ),
        const SizedBox(height: 32),
        IntroActionButtons(
          onViewProjectsPressed: onViewProjectsPressed,
          onDownloadCVPressed: onDownloadCVPressed,
          onGetInTouchPressed: onGetInTouchPressed,
        ),
        const SizedBox(height: 40),
        HeroStats(onShalehiPressed: onShalehiPressed),
        const SizedBox(height: 28),
        SocialLinks(
          onGithubPressed: onGithubPressed,
          onLinkedinPressed: onLinkedinPressed,
          onEmailPressed: onEmailPressed,
        ),
      ],
    );
  }
}
