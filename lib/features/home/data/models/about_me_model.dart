import 'package:flutter/material.dart';

class AboutMeStrengthModel {
  final IconData icon;
  final String title;
  final String description;

  const AboutMeStrengthModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class AboutMeModel {
  final List<String> paragraphs;
  final List<AboutMeStrengthModel> strengths;

  const AboutMeModel({
    required this.paragraphs,
    required this.strengths,
  });
}

const AboutMeModel aboutMeData = AboutMeModel(
  paragraphs: [
    'I’m a Flutter Developer with 2+ years of experience building scalable SaaS products across mobile and web. I\'m passionate about translating complex business requirements into elegant, high-performance applications that users love.',
    'I specialize in Clean Architecture, BLoC state management, and modular system design to ensure codebases remain clean, scalable, and easy to maintain. I have a proven track record of delivering enterprise-grade mobile and web solutions with robust architectures.',
    'I’m deeply committed to writing testable, maintainable code using SOLID principles and Design Patterns, delivering stunning apps for both iOS and Android from a single codebase. I love collaborating on modern tech stacks and bringing scalable products to life.',
  ],
  strengths: [
    AboutMeStrengthModel(
      icon: Icons.smartphone_rounded,
      title: 'Mobile First',
      description: 'Cross-platform apps for iOS & Android',
    ),
    AboutMeStrengthModel(
      icon: Icons.code_rounded,
      title: 'Clean Code',
      description: 'Maintainable, scalable architecture',
    ),
    AboutMeStrengthModel(
      icon: Icons.palette_outlined,
      title: 'UI/UX Focus',
      description: 'Beautiful, intuitive interfaces',
    ),
    AboutMeStrengthModel(
      icon: Icons.bolt_rounded,
      title: 'Performance',
      description: 'Optimized for speed & efficiency',
    ),
  ],
);
