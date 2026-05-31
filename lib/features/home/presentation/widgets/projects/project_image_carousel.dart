
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'project_gallery_viewer.dart';

class ProjectImageCarousel extends StatefulWidget {
  final List<String> images;

  const ProjectImageCarousel({super.key, required this.images});

  @override
  State<ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<ProjectImageCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: 250,
        decoration: BoxDecoration(
          color: ColorsPalette.border.withValues(alpha: 0.2),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: const Center(
          child: Icon(
            Icons.image_not_supported_rounded,
            size: 48,
            color: ColorsPalette.textHint,
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // The Carousel Image Slider
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.images.length,
            options: CarouselOptions(
              height: 280,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              final imagePath = widget.images[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectGalleryViewer(
                        images: widget.images,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsPalette.primary.withValues(alpha: 0.02),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.broken_image_rounded,
                                size: 40,
                                color: ColorsPalette.textHint,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Failed to load image',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsPalette.textSecondary.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),

          // Custom Page Indicator Overlay
          Positioned(
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: ColorsPalette.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    final isSelected = _currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      height: 5.0,
                      width: isSelected ? 14.0 : 5.0,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorsPalette.primary
                            : ColorsPalette.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          // Left Navigation Chevron (animated opacity based on hover state)
          Positioned(
            left: 12,
            top: 0,
            bottom: 0,
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isHovered ? 1.0 : 0.0,
                child: _buildNavigationButton(
                  icon: Icons.chevron_left_rounded,
                  onPressed: () => _carouselController.previousPage(),
                ),
              ),
            ),
          ),

          // Right Navigation Chevron (animated opacity based on hover state)
          Positioned(
            right: 12,
            top: 0,
            bottom: 0,
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isHovered ? 1.0 : 0.0,
                child: _buildNavigationButton(
                  icon: Icons.chevron_right_rounded,
                  onPressed: () => _carouselController.nextPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: ColorsPalette.white.withValues(alpha: 0.85),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ColorsPalette.black.withValues(alpha: 0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onPressed,
          child: Icon(icon, size: 24, color: ColorsPalette.textPrimary),
        ),
      ),
    );
  }
}
