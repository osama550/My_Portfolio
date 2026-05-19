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
  TechnicalSkillModel(
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
  TechnicalSkillModel(
    title: 'State Management & Storage',
    icon: Icons.storage_rounded,
    skills: ['Hive', 'SharedPreferences', 'FlutterSecureStorage'],
  ),
  TechnicalSkillModel(
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
  TechnicalSkillModel(
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
  TechnicalSkillModel(
    title: 'Computer Science & Problem Solving',
    icon: Icons.psychology_outlined,
    skills: ['Data Structures', 'Algorithms', 'Problem Solving'],
  ),
];
