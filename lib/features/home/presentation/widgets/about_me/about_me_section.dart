import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: typography.h3Bold.copyWith(color: ColorsPalette.primary),
            ),
            const SizedBox(height: 8),
            Container(
              width: 70,
              height: 4,
              decoration: BoxDecoration(
                color: ColorsPalette.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // About Me Description Paragraphs
        Text(
          'I’m a Flutter Developer with 2+ years of experience building scalable SaaS products across mobile and web. I\'m passionate about translating complex business requirements into elegant, high-performance applications that users love.',
          style: typography.bodyLargeRegular.copyWith(
            color: ColorsPalette.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'I specialize in Clean Architecture, BLoC state management, and modular system design to ensure codebases remain clean, scalable, and easy to maintain. I have a proven track record of delivering enterprise-grade mobile and web solutions with robust architectures.',
          style: typography.bodyLargeRegular.copyWith(
            color: ColorsPalette.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'I’m deeply committed to writing testable, maintainable code using SOLID principles and Design Patterns, delivering stunning apps for both iOS and Android from a single codebase. I love collaborating on modern tech stacks and bringing scalable products to life.',
          style: typography.bodyLargeRegular.copyWith(
            color: ColorsPalette.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),

        // Responsive Grid/List of Cards
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutMeCard(
                    icon: Icons.smartphone_rounded,
                    title: 'Mobile First',
                    description: 'Cross-platform apps for iOS & Android',
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AboutMeCard(
                    icon: Icons.code_rounded,
                    title: 'Clean Code',
                    description: 'Maintainable, scalable architecture',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AboutMeCard(
                    icon: Icons.palette_outlined,
                    title: 'UI/UX Focus',
                    description: 'Beautiful, intuitive interfaces',
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: AboutMeCard(
                    icon: Icons.bolt_rounded,
                    title: 'Performance',
                    description: 'Optimized for speed & efficiency',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AboutMeCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const AboutMeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<AboutMeCard> createState() => _AboutMeCardState();
}

class _AboutMeCardState extends State<AboutMeCard> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: ColorsPalette.primary, size: 32),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: typography.bodyLargeBold.copyWith(
                color: ColorsPalette.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: typography.bodyMediumRegular.copyWith(
                color: ColorsPalette.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
