import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/utils/functions/cv_downloader.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/badge_divider.dart';
import 'package:my_portfolio/features/home/presentation/widgets/about_me/about_me_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/contact/contact_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/animated_profile.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/bouncing_arrow.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/hero_intro_text.dart';
import 'package:my_portfolio/features/home/presentation/widgets/projects/projects_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_app_bar.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_drawer.dart';
import 'package:my_portfolio/features/home/presentation/widgets/technical_skills/technical_skills_section.dart';
import 'package:my_portfolio/features/home/presentation/widgets/work_experience/work_experience_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _navItems = [
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Contact',
  ];

  final Map<String, GlobalKey> _sectionKeys = {
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _handleNavItemTap(int index) {
    final sectionName = _navItems[index];
    log('Navigate to section: $sectionName');
    final key = _sectionKeys[sectionName];
    if (key != null) {
      _scrollToSection(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;
    final isDesktop = deviceType == DeviceType.desktop;

    return Scaffold(
      appBar: ResponsiveAppBar(
        navItems: _navItems,
        onNavItemTap: _handleNavItemTap,
      ),
      endDrawer: context.isMobile
          ? ResponsiveDrawer(
              navItems: _navItems,
              onNavItemTap: _handleNavItemTap,
            )
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80.0 : 12.0,
              vertical: 40.0,
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: HeroIntroText(
                                onViewProjectsPressed: () {
                                  log('View Projects pressed');
                                },
                                onDownloadCVPressed: () async {
                                  await downloadAndSaveCV();
                                },
                                onGetInTouchPressed: () {
                                  final key = _sectionKeys['Contact'];
                                  if (key != null) {
                                    _scrollToSection(key);
                                  }
                                },
                                onGithubPressed: () async {
                                  await launchExternalUrl(
                                    'https://github.com/osama550',
                                  );
                                },
                                onLinkedinPressed: () async {
                                  await launchExternalUrl(
                                    'https://www.linkedin.com/in/osama-kamel-elsalamony',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 40),
                            const Expanded(
                              flex: 5,
                              child: Center(child: AnimatedProfileWidget()),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(child: AnimatedProfileWidget()),
                            const SizedBox(height: 48),
                            HeroIntroText(
                              onViewProjectsPressed: () {
                                log('View Projects pressed');
                              },
                              onDownloadCVPressed: () async {
                                await downloadAndSaveCV();
                              },
                              onGetInTouchPressed: () {
                                final key = _sectionKeys['Contact'];
                                if (key != null) {
                                  _scrollToSection(key);
                                }
                              },
                              onGithubPressed: () async {
                                await launchExternalUrl(
                                  'https://github.com/osama550',
                                );
                              },
                              onLinkedinPressed: () async {
                                await launchExternalUrl(
                                  'https://www.linkedin.com/in/osama-kamel-elsalamony',
                                );
                              },
                            ),
                          ],
                        ),
                  const SizedBox(height: 24),
                  BouncingArrow(
                    onTap: () {
                      final key = _sectionKeys['About'];
                      if (key != null) {
                        _scrollToSection(key);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  const BadgeDivider(),
                  const SizedBox(height: 60),
                  AboutMeSection(key: _sectionKeys['About']),
                  const SizedBox(height: 60),
                  const BadgeDivider(),
                  const SizedBox(height: 60),
                  TechnicalSkillsSection(key: _sectionKeys['Skills']),
                  const SizedBox(height: 60),
                  const BadgeDivider(),
                  const SizedBox(height: 60),
                  WorkExperienceSection(key: _sectionKeys['Experience']),
                  const SizedBox(height: 60),
                  const BadgeDivider(),
                  const SizedBox(height: 60),
                  ProjectsSection(key: _sectionKeys['Projects']),
                  const SizedBox(height: 60),
                  const BadgeDivider(),
                  const SizedBox(height: 60),
                  ContactSection(key: _sectionKeys['Contact']),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
