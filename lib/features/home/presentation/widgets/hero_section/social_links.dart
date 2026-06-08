import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/theme/color.dart';

class SocialLinks extends StatelessWidget {
  final MainAxisAlignment alignment;
  final VoidCallback? onGithubPressed;
  final VoidCallback? onLinkedinPressed;

  const SocialLinks({
    super.key,
    required this.alignment,
    this.onGithubPressed,
    this.onLinkedinPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        InkWell(
          onTap: onGithubPressed,
          borderRadius: BorderRadius.circular(100),
          child: SvgPicture.asset(
            "assets/icons/github.svg",
            width: 28,
            height: 28,
            colorFilter: const ColorFilter.mode(
              ColorsPalette.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 24),
        InkWell(
          onTap: onLinkedinPressed,
          borderRadius: BorderRadius.circular(100),
          child: SvgPicture.asset(
            "assets/icons/linkedin.svg",
            width: 24,
            height: 28,
            colorFilter: const ColorFilter.mode(
              ColorsPalette.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
