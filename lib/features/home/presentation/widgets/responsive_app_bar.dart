import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> navItems;
  final Function(int) onNavItemTap;

  const ResponsiveAppBar({
    super.key,
    required this.navItems,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return AppBar(
      titleSpacing: 0,
      leadingWidth: 200,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12),
        child: RichText(
          text: TextSpan(
            style: context.typography.h5Bold.copyWith(fontFamily: 'Poppins'),
            children: const [
              TextSpan(
                text: '<',
                style: TextStyle(color: ColorsPalette.primary),
              ),
              TextSpan(
                text: 'Dev',
                style: TextStyle(color: ColorsPalette.primary),
              ),
              TextSpan(
                text: ' />',
                style: TextStyle(color: ColorsPalette.primary),
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (isMobile)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          )
        else
          ...navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _NavBarItem(title: item, onTap: () => onNavItemTap(index));
          }),
        if (!isMobile) const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? ColorsPalette.primaryLight : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.title,
            style: context.typography.bodyMediumBold.copyWith(
              color: _isHovered
                  ? ColorsPalette.primary
                  : ColorsPalette.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
