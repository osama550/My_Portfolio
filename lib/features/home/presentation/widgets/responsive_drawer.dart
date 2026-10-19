import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';

import 'package:my_portfolio/core/widgets/theme_toggle_button.dart';

import 'brand_logo.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class ResponsiveDrawer extends StatelessWidget {
  final List<String> navItems;
  final ValueListenable<int> activeIndex;
  final ValueChanged<int> onNavItemTap;
  final VoidCallback onHireMePressed;

  const ResponsiveDrawer({
    super.key,
    required this.navItems,
    required this.activeIndex,
    required this.onNavItemTap,
    required this.onHireMePressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Drawer(
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BrandLogo(),
                  const ThemeToggleButton(),
                  IconButton(
                    tooltip: 'Close menu',
                    icon: Icon(
                      Icons.close_rounded,
                      color: colors.textSecondary,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ValueListenableBuilder<int>(
                  valueListenable: activeIndex,
                  builder: (context, active, _) => ListView.separated(
                    itemCount: navItems.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      final isActive = index == active;
                      return InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Navigator.of(context).pop();
                          onNavItemTap(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isActive
                                ? colors.accentTint
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            navItems[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isActive
                                  ? colors.accent
                                  : colors.textSecondary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onHireMePressed();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: ColorsPalette.primary,
                  foregroundColor: ColorsPalette.onPrimary,
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                child: const Text('Hire Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
