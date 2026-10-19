import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

enum AppButtonStyle { filled, outlined }

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.trailingIcon,
    this.style = AppButtonStyle.filled,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? trailingIcon;
  final AppButtonStyle style;
  final bool compact;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final filled = widget.style == AppButtonStyle.filled;
    final fontSize = widget.compact ? 14.0 : 16.0;
    final foreground = filled
        ? ColorsPalette.onPrimary
        : (_hovered ? colors.accent : colors.heading);

    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(
              0,
              filled && _hovered ? -2 : 0,
              0,
            ),
            constraints: BoxConstraints(minHeight: widget.compact ? 44 : 52),
            padding: EdgeInsets.symmetric(
              horizontal: widget.compact ? 16 : (filled ? 26 : 22),
              vertical: widget.compact ? 10 : 15,
            ),
            decoration: BoxDecoration(
              color: filled
                  ? (_hovered
                        ? ColorsPalette.primaryLight
                        : ColorsPalette.primary)
                  : colors.surface,
              borderRadius: BorderRadius.circular(12),
              border: filled
                  ? null
                  : Border.all(
                      color: _hovered ? colors.accent : colors.borderStrong,
                    ),
              boxShadow: filled && !widget.compact
                  ? [
                      BoxShadow(
                        color: ColorsPalette.primary.withValues(alpha: 0.25),
                        blurRadius: 28,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: filled ? FontWeight.w700 : FontWeight.w600,
                      color: foreground,
                    ),
                  ),
                ),
                if (widget.trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    widget.trailingIcon,
                    size: fontSize + 2,
                    color: filled ? ColorsPalette.onPrimary : colors.accent,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
