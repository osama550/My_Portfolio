import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

import 'intro_action_buttons.dart';
import 'intro_rich_text.dart';
import 'social_links.dart';
import 'welcome_badge.dart';

class HeroIntroText extends StatelessWidget {
  final VoidCallback? onViewProjectsPressed;
  final VoidCallback? onDownloadCVPressed;
  final VoidCallback? onGetInTouchPressed;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onLinkedinPressed;

  const HeroIntroText({
    super.key,
    this.onViewProjectsPressed,
    this.onDownloadCVPressed,
    this.onGetInTouchPressed,
    this.onGithubPressed,
    this.onLinkedinPressed,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;
    final isMobile = deviceType == DeviceType.mobile;
    final typography = context.typography;

    final align = isMobile
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = isMobile ? TextAlign.center : TextAlign.start;
    final wrapAlignment = isMobile ? WrapAlignment.center : WrapAlignment.start;
    final rowAlignment = isMobile
        ? MainAxisAlignment.center
        : MainAxisAlignment.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        const WelcomeBadge(),
        const SizedBox(height: 24),
        IntroRichText(textAlign: textAlign),
        const SizedBox(height: 18),
        Text(
          '2+ years building scalable mobile applications with Flutter & Clean Architecture. Experienced in BLoC/Cubit, real-time systems',
          textAlign: textAlign,
          style: typography.bodyLargeMedium.copyWith(
            color: ColorsPalette.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        IntroActionButtons(
          alignment: wrapAlignment,
          onViewProjectsPressed: onViewProjectsPressed,
          onDownloadCVPressed: onDownloadCVPressed,
          onGetInTouchPressed: onGetInTouchPressed,
        ),
        const SizedBox(height: 24),
        SocialLinks(
          alignment: rowAlignment,
          onGithubPressed: onGithubPressed,
          onLinkedinPressed: onLinkedinPressed,
        ),
      ],
    );
  }
}
