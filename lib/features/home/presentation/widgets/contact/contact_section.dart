import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/grid_background.dart';
import 'package:my_portfolio/core/widgets/responsive_grid.dart';
import 'package:my_portfolio/core/widgets/status_pill.dart';

import 'contact_link_tile.dart';

class ContactSection extends StatelessWidget {
  final VoidCallback onBackToTop;

  const ContactSection({super.key, required this.onBackToTop});

  static const _email = 'osamakamel758@gmail.com';
  static const _steps = [
    'Tell me about the app and your timeline',
    'I reply with questions or a plan',
    'We agree scope and start building',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final headlineSize = context.fluid(32, 5, 52);

    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: colors.border),
          ),
          child: Stack(
            children: [
              const Positioned(right: -80, top: -80, child: _Glow()),
              GridBackground(
                cell: 48,
                opacity: 0.03,
                child: Padding(
                  padding: EdgeInsets.all(context.fluid(28, 6, 64)),
                  child: ResponsiveGrid(
                    minItemWidth: 320,
                    spacing: context.fluid(28, 5, 56),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatusPill(
                            'Open to freelance & full-time',
                            background: colors.background,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: headlineSize,
                                fontWeight: FontWeight.w800,
                                height: 1.04,
                                letterSpacing: -headlineSize * 0.03,
                                color: colors.textPrimary,
                              ),
                              children: [
                                TextSpan(text: 'Have a Flutter project '),
                                TextSpan(
                                  text: 'in mind?',
                                  style: TextStyle(color: colors.accent),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 460),
                            child: Text(
                              'Send a short note on what you’re building — I’ll reply with questions or a plan.',
                              style: TextStyle(
                                fontSize: 16.5,
                                height: 1.65,
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 26),
                          for (var i = 0; i < _steps.length; i++)
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: i == _steps.length - 1 ? 0 : 12,
                              ),
                              child: _Step(number: i + 1, label: _steps[i]),
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _EmailCard(onTap: () => launchEmail(_email)),
                          const SizedBox(height: 12),
                          ResponsiveGrid(
                            minItemWidth: 140,
                            spacing: 12,
                            children: [
                              ContactLinkTile(
                                label: 'LinkedIn',
                                onTap: () => launchExternalUrl(
                                  'https://linkedin.com/in/osama-kamel-elsalamony',
                                ),
                              ),
                              ContactLinkTile(
                                label: 'GitHub',
                                onTap: () => launchExternalUrl(
                                  'https://github.com/osama550',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 4,
                            ),
                            child: Text(
                              'Cairo, Egypt · Remote-friendly',
                              style: AppFonts.mono(
                                size: 12.5,
                                color: colors.textHint,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 12,
          runSpacing: 12,
          children: [
            Text(
              '© ${DateTime.now().year} Osama Kamel · Cairo, Egypt',
              style: TextStyle(fontSize: 13, color: colors.textHint),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onBackToTop,
                child: Text(
                  'Back to top ↑',
                  style: TextStyle(fontSize: 13, color: colors.accent),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              ColorsPalette.primary.withValues(alpha: 0.22),
              Colors.transparent,
            ],
            stops: const [0, 0.7],
          ),
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final int number;
  final String label;

  const _Step({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.accent),
          ),
          child: Text('$number', style: AppFonts.mono(color: colors.accent)),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            label,
            style: TextStyle(fontSize: 14.5, color: colors.tagText),
          ),
        ),
      ],
    );
  }
}

class _EmailCard extends StatefulWidget {
  final VoidCallback onTap;

  const _EmailCard({required this.onTap});

  @override
  State<_EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<_EmailCard> {
  static const _copiedDuration = Duration(seconds: 2);

  bool _hovered = false;
  bool _copied = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _copy() async {
    await Clipboard.setData(const ClipboardData(text: ContactSection._email));
    if (!mounted) return;
    setState(() => _copied = true);
    _resetTimer?.cancel();
    _resetTimer = Timer(_copiedDuration, () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Email me at ${ContactSection._email}',
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (v) => setState(() => _hovered = v),
        onShowFocusHighlight: (v) => setState(() => _hovered = v),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onTap();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
            constraints: const BoxConstraints(minHeight: 72),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: _hovered
                  ? ColorsPalette.primaryLight
                  : ColorsPalette.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: ColorsPalette.primary.withValues(
                    alpha: _hovered ? 0.35 : 0,
                  ),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMAIL ME',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: ColorsPalette.onPrimary.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 2),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ContactSection._email,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: context.fluid(15, 2.4, 18),
                            fontWeight: FontWeight.w700,
                            color: ColorsPalette.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Tooltip(
                  message: _copied ? 'Copied!' : 'Copy email',
                  child: IconButton(
                    onPressed: _copy,
                    visualDensity: VisualDensity.compact,
                    color: ColorsPalette.onPrimary,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      child: Icon(
                        _copied ? Icons.check_rounded : Icons.copy_rounded,
                        key: ValueKey(_copied),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  offset: Offset(_hovered ? 0.25 : 0, 0),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    size: 22,
                    color: ColorsPalette.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
