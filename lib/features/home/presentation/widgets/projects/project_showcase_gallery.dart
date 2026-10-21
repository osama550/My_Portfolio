import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_fonts.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/utils/extensions/context_extension.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_gallery_viewer.dart';

/// 16:9 showcase slides. Several slides get labeled tabs and hover chevrons;
/// tapping a slide opens the zoomable full-screen viewer.
class ProjectShowcaseGallery extends StatefulWidget {
  final String title;
  final List<ProjectShowcase> showcases;

  const ProjectShowcaseGallery({
    super.key,
    required this.title,
    required this.showcases,
  });

  @override
  State<ProjectShowcaseGallery> createState() => _ProjectShowcaseGalleryState();
}

class _ProjectShowcaseGalleryState extends State<ProjectShowcaseGallery> {
  static const _slideDuration = Duration(milliseconds: 450);
  static const _slideCurve = Curves.easeInOutCubic;

  late final CarouselSliderController _carouselController;
  late final ValueNotifier<int> _currentIndex;
  late final ValueNotifier<bool> _isHovered;
  late final Listenable _chevronState;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
    _currentIndex = ValueNotifier<int>(0);
    _isHovered = ValueNotifier<bool>(false);
    _chevronState = Listenable.merge([_currentIndex, _isHovered]);
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  void _openViewer(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectGalleryViewer(
          images: [for (final s in widget.showcases) s.image],
          initialIndex: index,
        ),
      ),
    );
  }

  Widget _slide(int index) {
    final showcase = widget.showcases[index];
    return _ShowcaseImage(
      image: showcase.image,
      semanticLabel: '${widget.title}: ${showcase.label}',
      onTap: () => _openViewer(index),
    );
  }

  /// Shown on hover only, and hidden at either end since slides don't loop.
  Widget _chevron({required bool next}) {
    return ListenableBuilder(
      listenable: _chevronState,
      builder: (context, child) {
        final index = _currentIndex.value;
        final canMove = next ? index < widget.showcases.length - 1 : index > 0;
        final visible = _isHovered.value && canMove;
        return IgnorePointer(
          ignoring: !visible,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: visible ? 1 : 0,
            child: child,
          ),
        );
      },
      child: _OverlayButton(
        icon: next ? Icons.chevron_right_rounded : Icons.chevron_left_rounded,
        tooltip: next ? 'Next slide' : 'Previous slide',
        onPressed: () => next
            ? _carouselController.nextPage(
                duration: _slideDuration,
                curve: _slideCurve,
              )
            : _carouselController.previousPage(
                duration: _slideDuration,
                curve: _slideCurve,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final showcases = widget.showcases;

    if (showcases.isEmpty) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: colors.surfaceMuted,
          child: Center(
            child: Icon(
              Icons.image_not_supported_rounded,
              size: 48,
              color: colors.textHint,
            ),
          ),
        ),
      );
    }

    final hasMany = showcases.length > 1;
    final media = ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: ColoredBox(
        color: colors.surfaceMuted,
        child: MouseRegion(
          onEnter: (_) => _isHovered.value = true,
          onExit: (_) => _isHovered.value = false,
          child: Stack(
            children: [
              if (hasMany)
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: showcases.length,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, _) => _currentIndex.value = index,
                  ),
                  itemBuilder: (context, index, _) => _slide(index),
                )
              else
                AspectRatio(aspectRatio: 16 / 9, child: _slide(0)),
              if (hasMany) ...[
                Positioned(
                  left: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(child: _chevron(next: false)),
                ),
                Positioned(
                  right: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(child: _chevron(next: true)),
                ),
              ],
              Positioned(
                right: 12,
                bottom: 12,
                child: _OverlayButton(
                  icon: Icons.open_in_full_rounded,
                  tooltip: 'View full screen',
                  iconSize: 18,
                  onPressed: () => _openViewer(_currentIndex.value),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!hasMany) return media;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        media,
        const SizedBox(height: 12),
        ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, current, _) => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < showcases.length; i++)
                _ShowcaseTab(
                  number: i + 1,
                  label: showcases[i].label,
                  selected: i == current,
                  onTap: () => _carouselController.animateToPage(
                    i,
                    duration: _slideDuration,
                    curve: _slideCurve,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ShowcaseImage extends StatelessWidget {
  final String image;
  final String semanticLabel;
  final VoidCallback onTap;

  const _ShowcaseImage({
    required this.image,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          semanticLabel: semanticLabel,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: child,
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.broken_image_rounded,
                    size: 40,
                    color: colors.textHint,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Failed to load image',
                    style: TextStyle(fontSize: 12, color: colors.textHint),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ShowcaseTab extends StatelessWidget {
  final int number;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ShowcaseTab({
    required this.number,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? colors.accentTint : colors.surface,
        shape: StadiumBorder(
          side: BorderSide(
            color: selected ? colors.accent : colors.borderStrong,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  number.toString().padLeft(2, '0'),
                  style: AppFonts.mono(
                    size: 11.5,
                    color: selected ? colors.accent : colors.textHint,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: selected ? colors.heading : colors.textMuted,
                    ),
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

class _OverlayButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final double iconSize;
  final VoidCallback onPressed;

  const _OverlayButton({
    required this.icon,
    required this.tooltip,
    this.iconSize = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      iconSize: iconSize,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        fixedSize: const Size.square(38),
        minimumSize: const Size.square(38),
        padding: EdgeInsets.zero,
        backgroundColor: ColorsPalette.white.withValues(alpha: 0.85),
        foregroundColor: ColorsPalette.onPrimary,
        elevation: 2,
        shadowColor: ColorsPalette.black.withValues(alpha: 0.3),
      ),
    );
  }
}
