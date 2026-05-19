import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/theme/color.dart';

class SocialContactButton extends StatefulWidget {
  final String svgAsset;
  final VoidCallback onTap;

  const SocialContactButton({
    super.key,
    required this.svgAsset,
    required this.onTap,
  });

  @override
  State<SocialContactButton> createState() => _SocialContactButtonState();
}

class _SocialContactButtonState extends State<SocialContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? Matrix4.diagonal3Values(1.1, 1.1, 1.0)
              : Matrix4.identity(),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _isHovered ? ColorsPalette.primary : ColorsPalette.card,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? ColorsPalette.primary : ColorsPalette.border,
              width: 1.5,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: ColorsPalette.primary.withValues(alpha: 0.25),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              else
                BoxShadow(
                  color: ColorsPalette.shadow.withValues(alpha: 0.02),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: SvgPicture.asset(
            widget.svgAsset,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              _isHovered ? ColorsPalette.textWhite : ColorsPalette.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
