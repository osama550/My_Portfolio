import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class MonoTag extends StatelessWidget {
  const MonoTag(
    this.label, {
    super.key,
    this.background,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  });

  final String label;
  final Color? background;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background ?? colors.tag,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: colors.borderStrong),
      ),
      child: Text(label, style: AppFonts.mono(color: colors.tagText)),
    );
  }
}
