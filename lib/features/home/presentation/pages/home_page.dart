import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/utils/functions/cv_downloader.dart';
import 'package:my_portfolio/core/utils/functions/url_launcher.dart';
import 'package:my_portfolio/core/widgets/badge_divider.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/animated_profile.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/bouncing_arrow.dart';
import 'package:my_portfolio/features/home/presentation/widgets/hero_section/hero_intro_text.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_app_bar.dart';
import 'package:my_portfolio/features/home/presentation/widgets/responsive_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> _navItems = [
    'About',
    'Experience',
    'Skills',
    'Projects',
    'Contact',
  ];

  void _handleNavItemTap(BuildContext context, int index) {
    final sectionName = _navItems[index];
    log('Navigate to section: $sectionName');
    // TODO: Implement scroll-to-section logic (e.g., using ScrollController or GlobalKeys)
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;
    final isDesktop = deviceType == DeviceType.desktop;

    return Scaffold(
      appBar: ResponsiveAppBar(
        navItems: _navItems,
        onNavItemTap: (index) => _handleNavItemTap(context, index),
      ),
      endDrawer: context.isMobile
          ? ResponsiveDrawer(
              navItems: _navItems,
              onNavItemTap: (index) => _handleNavItemTap(context, index),
            )
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80.0 : 24.0,
              vertical: 40.0,
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isDesktop
                  ? Column(
                      children: [
                        Row(
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
                                  log('Get In Touch pressed');
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
                        ),
                        const SizedBox(height: 24),
                        BouncingArrow(
                          onTap: () {
                            log('Arrow pressed');
                          },
                        ),
                        const SizedBox(height: 24),
                        BadgeDivider(),
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
                            log('Get In Touch pressed');
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

                        const SizedBox(height: 24),
                        BouncingArrow(
                          onTap: () {
                            log('Arrow pressed');
                          },
                        ),
                        const SizedBox(height: 24),
                        BadgeDivider(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
