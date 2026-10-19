import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/widgets/app_button.dart';
import 'package:my_portfolio/core/widgets/theme_toggle_button.dart';

import 'brand_logo.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> navItems;
  final ValueListenable<int> activeIndex;
  final ValueChanged<int> onNavItemTap;
  final VoidCallback onHireMePressed;

  const ResponsiveAppBar({
    super.key,
    required this.navItems,
    required this.activeIndex,
    required this.onNavItemTap,
    required this.onHireMePressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final wide = context.isWideNav;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.fluid(16, 4, 40),
        16,
        context.fluid(16, 4, 40),
        0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
            decoration: BoxDecoration(
              color: colors.navBackground,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colors.borderStrong),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BrandLogo(onTap: () => onNavItemTap(0)),
                if (wide)
                  Row(
                    children: [
                      ValueListenableBuilder<int>(
                        valueListenable: activeIndex,
                        builder: (context, active, _) => Row(
                          children: [
                            for (var i = 0; i < navItems.length; i++)
                              _NavLink(
                                label: navItems[i],
                                active: i == active,
                                onTap: () => onNavItemTap(i),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      AppButton(
                        label: 'Hire Me',
                        trailingIcon: Icons.arrow_forward_rounded,
                        compact: true,
                        onPressed: onHireMePressed,
                      ),
                      const SizedBox(width: 8),
                      const ThemeToggleButton(),
                    ],
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ThemeToggleButton(),
                      const SizedBox(width: 8),
                      Semantics(
                        button: true,
                        label: 'Menu',
                        child: GestureDetector(
                          onTap: () => Scaffold.of(context).openEndDrawer(),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: colors.background,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: colors.border),
                            ),
                            child: Icon(
                              Icons.menu_rounded,
                              size: 20,
                              color: colors.heading,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = widget.active
        ? colors.accent
        : (_hovered ? colors.heading : colors.textSecondary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: widget.active ? colors.accentTint : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
