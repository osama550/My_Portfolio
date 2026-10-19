import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';

class SocialLinks extends StatelessWidget {
  final VoidCallback? onGithubPressed;
  final VoidCallback? onLinkedinPressed;
  final VoidCallback? onEmailPressed;

  const SocialLinks({
    super.key,
    this.onGithubPressed,
    this.onLinkedinPressed,
    this.onEmailPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'CONNECT',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.32,
            color: colors.textHint,
          ),
        ),
        Container(width: 32, height: 1, color: colors.borderStrong),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialButton(
              label: 'GitHub',
              onTap: onGithubPressed,
              builder: (color) => SvgPicture.asset(
                'assets/icons/github.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 10),
            _SocialButton(
              label: 'LinkedIn',
              onTap: onLinkedinPressed,
              builder: (color) => SvgPicture.asset(
                'assets/icons/linkedin.svg',
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 10),
            _SocialButton(
              label: 'Email',
              onTap: onEmailPressed,
              builder: (color) =>
                  Icon(Icons.mail_outline_rounded, size: 20, color: color),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final Widget Function(Color color) builder;

  const _SocialButton({
    required this.label,
    required this.onTap,
    required this.builder,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _hovered ? colors.accent : colors.border,
              ),
            ),
            child: Center(
              child: widget.builder(
                _hovered ? colors.accent : colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
