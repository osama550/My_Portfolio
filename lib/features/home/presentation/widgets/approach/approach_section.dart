import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/content_container.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/features/home/data/models/approach_model.dart';

class ApproachSection extends StatelessWidget {
  const ApproachSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final vertical = context.fluid(32, 5, 52);

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.symmetric(horizontal: BorderSide(color: colors.border)),
      ),
      child: ContentContainer(
        top: vertical,
        bottom: vertical,
        child: ResponsiveGrid(
          minItemWidth: 230,
          spacing: 28,
          children: [
            for (final item in approachItems) _ApproachItem(item: item),
          ],
        ),
      ),
    );
  }
}

class _ApproachItem extends StatelessWidget {
  final ApproachModel item;

  const _ApproachItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.label,
          style: AppFonts.mono(color: colors.accent, letterSpacing: 0.72),
        ),
        const SizedBox(height: 10),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: 1.3,
            color: colors.heading,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.description,
          style: TextStyle(
            fontSize: 14.5,
            height: 1.6,
            color: colors.textMuted,
          ),
        ),
      ],
    );
  }
}
