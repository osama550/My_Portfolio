import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class HeroStats extends StatelessWidget {
  final VoidCallback? onShalehiPressed;

  const HeroStats({super.key, this.onShalehiPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.only(top: 28),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: ResponsiveGrid(
        minItemWidth: 150,
        spacing: 20,
        children: [
          const _Stat(value: '2+ yrs', label: Text('Flutter, mobile & web')),
          _Stat(
            value: 'Live app',
            label: Wrap(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onShalehiPressed,
                    child: Text(
                      'Shalehi',
                      style: TextStyle(color: colors.accent),
                    ),
                  ),
                ),
                const Text(' on Play & App Store'),
              ],
            ),
          ),
          const _Stat(
            value: 'Real-time',
            label: Text('WebSockets, offline-first'),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final Widget label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.52,
            color: colors.heading,
          ),
        ),
        const SizedBox(height: 2),
        DefaultTextStyle.merge(
          style: TextStyle(fontSize: 13, height: 1.4, color: colors.textHint),
          child: label,
        ),
      ],
    );
  }
}
