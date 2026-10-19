import 'package:flutter/material.dart';

class TechnicalSkillModel {
  final String title;
  final IconData icon;
  final List<String> skills;

  const TechnicalSkillModel({
    required this.title,
    required this.icon,
    required this.skills,
  });
}

const List<TechnicalSkillModel> technicalSkills = [
  TechnicalSkillModel(
    title: 'Mobile & architecture',
    icon: Icons.smartphone_rounded,
    skills: [
      'Flutter',
      'Dart',
      'Clean Architecture',
      'MVVM',
      'BLoC/Cubit',
      'Provider',
      'Riverpod',
      'GoRouter',
      'SOLID',
      'OOP',
      'Design Patterns',
    ],
  ),
  TechnicalSkillModel(
    title: 'Integration',
    icon: Icons.cloud_queue_rounded,
    skills: [
      'REST APIs',
      'GraphQL',
      'Dio',
      'WebSockets',
      'Firebase',
      'Supabase',
      'Google Maps',
      'OneSignal',
      'KNET Payments',
      'ElevenLabs',
      'Zego Cloud',
    ],
  ),
  TechnicalSkillModel(
    title: 'Storage & concurrency',
    icon: Icons.storage_rounded,
    skills: [
      'Hive',
      'SharedPreferences',
      'Flutter Secure Storage',
      'Dart Isolates',
    ],
  ),
  TechnicalSkillModel(
    title: 'Testing & delivery',
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
  TechnicalSkillModel(
    title: 'UI & app features',
    icon: Icons.palette_outlined,
    skills: [
      'Responsive Design',
      'Theming',
      'Localization',
      'Deep Linking',
      'Figma',
      'Agile / Scrum',
    ],
  ),
  TechnicalSkillModel(
    title: 'Fundamentals',
    icon: Icons.psychology_outlined,
    skills: ['Data Structures', 'Algorithms', 'Problem Solving'],
  ),
];
