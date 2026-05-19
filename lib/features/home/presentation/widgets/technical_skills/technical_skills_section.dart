import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/widgets/header_title_sections.dart';

import 'category_card.dart';
import 'skill_category.dart';

class TechnicalSkillsSection extends StatelessWidget {
  const TechnicalSkillsSection({super.key});

  static const List<SkillCategory> _categories = [
    SkillCategory(
      title: 'Mobile Development',
      icon: Icons.smartphone_rounded,
      skills: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'MVVM',
        'BLoC/Cubit',
        'GoRouter',
        'SOLID',
        'OOP',
        'Design Patterns',
      ],
    ),
    SkillCategory(
      title: 'Backend & Integration',
      icon: Icons.cloud_queue_rounded,
      skills: [
        'REST APIs',
        'Dio',
        'WebSockets',
        'Firebase',
        'Supabase',
        'Google Maps',
        'OneSignal',
        'Payment Gateways',
        'ElevenLabs',
      ],
    ),
    SkillCategory(
      title: 'State Management & Storage',
      icon: Icons.storage_rounded,
      skills: ['Hive', 'SharedPreferences', 'FlutterSecureStorage'],
    ),
    SkillCategory(
      title: 'Testing, DevOps & Tools',
      icon: Icons.construction_rounded,
      skills: [
        'Unit Testing',
        'Widget Testing',
        'Mockito',
        'Git',
        'GitHub Actions',
        'Jenkins',
        'Fastlane',
        'Sentry',
        'Postman',
        'Jira',
      ],
    ),
    SkillCategory(
      title: 'UI/UX & App Features',
      icon: Icons.palette_outlined,
      skills: [
        'Responsive Design',
        'Theming',
        'Localization',
        'Deep Linking',
        'Figma',
      ],
    ),
    SkillCategory(
      title: 'Computer Science & Problem Solving',
      icon: Icons.psychology_outlined,
      skills: ['Data Structures', 'Algorithms', 'Problem Solving'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceType;

    // Responsive grid layout based on screen width/device type
    Widget content;
    if (deviceType == DeviceType.desktop) {
      // 3 columns layout
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: _categories[0]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[2]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: _categories[1]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[4]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: _categories[3]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[5]),
              ],
            ),
          ),
        ],
      );
    } else if (deviceType == DeviceType.tablet) {
      // 2 columns layout
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: _categories[0]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[2]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[4]),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                CategoryCard(category: _categories[1]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[3]),
                const SizedBox(height: 24),
                CategoryCard(category: _categories[5]),
              ],
            ),
          ),
        ],
      );
    } else {
      // Mobile: 1 column layout
      content = Column(
        children: _categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CategoryCard(category: category),
              ),
            )
            .toList(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Title Header
        const HeaderTitleSections(
          title1: 'Technical ',
          title2: 'Skills',
          subtitle: 'Technologies I work with',
        ),
        const SizedBox(height: 48),

        // Categories & Skills Listing
        content,
      ],
    );
  }
}
