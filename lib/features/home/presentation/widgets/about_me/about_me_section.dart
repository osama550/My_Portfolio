import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/home/data/models/about_me_model.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ResponsiveGrid(
      minItemWidth: 320,
      spacing: context.fluid(24, 5, 64),
      children: [
        const HeaderTitleSections(
          eyebrow: 'About me',
          title: 'Structure first, details always.',
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final paragraph in aboutMeData.paragraphs) ...[
                Text(
                  paragraph,
                  style: TextStyle(
                    fontSize: 16.5,
                    height: 1.7,
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: colors.border)),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.7,
                      color: colors.textSecondary,
                    ),
                    children: [
                      TextSpan(
                        text: 'Education\n',
                        style: TextStyle(
                          color: colors.heading,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: aboutMeData.education),
                    ],
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
