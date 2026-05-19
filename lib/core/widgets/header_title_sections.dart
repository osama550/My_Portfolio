import 'package:flutter/widgets.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class HeaderTitleSections extends StatelessWidget {
  const HeaderTitleSections({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle,
  });
  final String title1;
  final String title2;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: typography.h3Bold.copyWith(color: ColorsPalette.textPrimary),
            children: [
              TextSpan(text: title1),
              TextSpan(
                text: title2,
                style: typography.h3Bold.copyWith(color: ColorsPalette.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: typography.bodyLargeMedium.copyWith(
            color: ColorsPalette.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Container(
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            color: ColorsPalette.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
