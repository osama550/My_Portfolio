import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';

import 'project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = Breakpoints.of(context);
    final isDesktop = deviceType == DeviceType.desktop;

    // Determine items per page based on responsiveness
    final int itemsPerPage = isDesktop ? 2 : 1;

    // Group projects into pages
    final List<List<ProjectModel>> pages = [];
    for (var i = 0; i < projectsList.length; i += itemsPerPage) {
      final end = (i + itemsPerPage > projectsList.length)
          ? projectsList.length
          : i + itemsPerPage;
      pages.add(projectsList.sublist(i, end));
    }

    // Safely clamp current page in case screen resizing changes the page count
    if (_currentPage >= pages.length) {
      _currentPage = pages.isEmpty ? 0 : pages.length - 1;
    }

    final hasMultiplePages = pages.length > 1;

    // Set height based on layout constraints to prevent clipping
    // final double viewportHeight = 850;
    final double viewportHeight = 750;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Header Title
        const HeaderTitleSections(
          title1: 'My ',
          title2: 'Projects',
          subtitle: 'Some of my outstanding works and digital creations',
        ),
        const SizedBox(height: 48),

        // Slider Area with PageView and Left/Right Floating Chevrons
        Stack(
          alignment: Alignment.center,
          children: [
            // PageView containing grouped cards
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hasMultiplePages ? 24.0 : 0.0,
              ),
              child: SizedBox(
                height: viewportHeight,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, pageIndex) {
                    final pageProjects = pages[pageIndex];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pageProjects.map((project) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: SizedBox(
                              height: viewportHeight,
                              child: ProjectCard(project: project),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),

            // Left Side Page Navigation Chevron (Only if multiple pages exist)
            if (hasMultiplePages)
              Positioned(
                left: 0,
                child: _buildSectionNavigationButton(
                  isDesktop: isDesktop,
                  icon: Icons.chevron_left_rounded,
                  isDisabled: _currentPage == 0,
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                ),
              ),

            // Right Side Page Navigation Chevron (Only if multiple pages exist)
            if (hasMultiplePages)
              Positioned(
                right: 0,
                child: _buildSectionNavigationButton(
                  isDesktop: isDesktop,
                  icon: Icons.chevron_right_rounded,
                  isDisabled: _currentPage == pages.length - 1,
                  onPressed: () {
                    if (_currentPage < pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  },
                ),
              ),
          ],
        ),

        const SizedBox(height: 24),

        // Custom Bottom Page Indicators (Sleek circular numbers or indicators)
        if (hasMultiplePages)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: List.generate(pages.length, (index) {
              final isSelected = _currentPage == index;
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsPalette.primary
                        : ColorsPalette.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? ColorsPalette.primary
                          : ColorsPalette.border,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? ColorsPalette.primary.withValues(alpha: 0.25)
                            : ColorsPalette.shadow.withValues(alpha: 0.02),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? ColorsPalette.textWhite
                            : ColorsPalette.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }

  Widget _buildSectionNavigationButton({
    required IconData icon,
    required bool isDisabled,
    required VoidCallback onPressed,
    required bool isDesktop,
  }) {
    return Container(
      width: isDesktop ? 48 : 32,
      height: isDesktop ? 48 : 32,
      decoration: BoxDecoration(
        color: isDisabled
            ? ColorsPalette.border.withValues(alpha: 0.5)
            : ColorsPalette.white,
        shape: BoxShape.circle,
        border: Border.all(color: ColorsPalette.border, width: 1),
        boxShadow: [
          if (!isDisabled)
            BoxShadow(
              color: ColorsPalette.black.withValues(alpha: 0.08),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: isDisabled ? null : onPressed,
          child: Icon(
            icon,
            size: 28,
            color: isDisabled
                ? ColorsPalette.textHint
                : ColorsPalette.textPrimary,
          ),
        ),
      ),
    );
  }
}
