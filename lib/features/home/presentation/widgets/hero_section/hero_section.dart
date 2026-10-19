import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/content_container.dart';
import 'package:my_portfolio/core/widgets/grid_background.dart';

import 'animated_profile.dart';
import 'hero_intro_text.dart';

class HeroSection extends StatelessWidget {
  final HeroIntroText intro;

  const HeroSection({super.key, required this.intro});

  @override
  Widget build(BuildContext context) {
    final gap = context.fluid(40, 5, 64);

    return GridBackground(
      child: ContentContainer(
        top: context.fluid(36, 6, 80),
        bottom: context.fluid(64, 9, 112),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final profile = Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: const AnimatedProfileWidget(),
              ),
            );

            if (constraints.maxWidth >= 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 11, child: intro),
                  SizedBox(width: gap),
                  Expanded(flex: 8, child: profile),
                ],
              );
            }
            return Column(
              children: [
                profile,
                SizedBox(height: gap),
                intro,
              ],
            );
          },
        ),
      ),
    );
  }
}
