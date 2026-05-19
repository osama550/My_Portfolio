import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class ContactItemTile extends StatefulWidget {
  final IconData icon;
  final String value;
  final VoidCallback? onTap;

  const ContactItemTile({
    super.key,
    required this.icon,
    required this.value,
    this.onTap,
  });

  @override
  State<ContactItemTile> createState() => _ContactItemTileState();
}

class _ContactItemTileState extends State<ContactItemTile> {
  bool _isHovered = false;

  bool get _isClickable => widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;

    final tileWidget = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      transform: _isHovered && _isClickable
          ? Matrix4.translationValues(0, -3, 0)
          : Matrix4.identity(),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: _isHovered && _isClickable
            ? ColorsPalette.primaryLight
            : ColorsPalette.card,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: _isHovered && _isClickable
              ? ColorsPalette.primary
              : ColorsPalette.border,
          width: 1.5,
        ),
        boxShadow: [
          if (_isHovered && _isClickable)
            BoxShadow(
              color: ColorsPalette.primary.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            )
          else
            const BoxShadow(
              color: Colors.transparent,
              blurRadius: 0,
              offset: Offset.zero,
            ),
        ],
      ),
      child: Row(
        children: [
          // Icon with animated color
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: _isHovered && _isClickable
                  ? ColorsPalette.primary.withValues(alpha: 0.1)
                  : ColorsPalette.scaffoldBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              color: _isHovered && _isClickable
                  ? ColorsPalette.primary
                  : ColorsPalette.textSecondary,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),

          // Value Text with animated style
          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: typography.bodyMediumBold.copyWith(
                color: _isHovered && _isClickable
                    ? ColorsPalette.primary
                    : ColorsPalette.textPrimary,
              ),
              child: Text(widget.value, overflow: TextOverflow.ellipsis),
            ),
          ),

          // Arrow icon on hover (only visible when clickable)
          if (_isClickable)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isHovered ? 1.0 : 0.0,
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: ColorsPalette.primary,
                size: 18,
              ),
            ),
        ],
      ),
    );

    if (!_isClickable) {
      return tileWidget;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(onTap: widget.onTap, child: tileWidget),
    );
  }
}
