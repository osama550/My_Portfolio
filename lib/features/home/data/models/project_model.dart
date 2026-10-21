import 'package:flutter/material.dart';

/// One 16:9 showcase slide; [label] names it in the gallery tabs.
class ProjectShowcase {
  final String image;
  final String label;

  const ProjectShowcase({required this.image, required this.label});
}

class ProjectModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<String> bullets;
  final bool inDevelopment;
  final List<String> tags;
  final List<ProjectShowcase> showcases;
  final IconData categoryIcon;
  final String? googlePlayUrl;
  final String? appStoreUrl;
  final String? webUrl;
  final String? githubUrl;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.bullets,
    this.inDevelopment = false,
    required this.tags,
    required this.showcases,
    required this.categoryIcon,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.webUrl,
    this.githubUrl,
  });

  List<String> get images => [for (final s in showcases) s.image];
}

const List<ProjectModel> projectsList = [
  ProjectModel(
    id: 'barq_platform',
    category: 'MULTI-TENANT SAAS · MOBILE + WEB',
    title: 'BARQ Multi-Tenant SaaS Platform',
    description:
        'One codebase, four business workflows. A multi-tenant SaaS platform that runs restaurants, salons, chalets and car showrooms through three integrated apps: a customer app, a vendor app and an in-store tablet catalog.',
    categoryIcon: Icons.storefront_rounded,
    showcases: [
      ProjectShowcase(
        image: 'assets/images/projects/barq_overview.webp',
        label: 'Platform overview',
      ),
      ProjectShowcase(
        image: 'assets/images/projects/barq_customer_app.webp',
        label: 'Customer app',
      ),
      ProjectShowcase(
        image: 'assets/images/projects/barq_vendor_tablet.webp',
        label: 'Vendor app + tablet catalog',
      ),
    ],
    tags: [
      'Clean Architecture',
      'BLoC/Cubit',
      'Multi-Tenant',
      'Remote Config',
      'REST APIs',
      'WebSockets',
      'Hive',
      'Offline-First',
      'Google Maps',
      'QR Scanner',
    ],
    bullets: [
      'Developed features across three integrated apps: a customer app for bookings and orders, a vendor app for managing reservations and order statuses, and a tablet catalog for product presentation.',
      'Supported configurable workflows per business: menus, sizes and add-ons for restaurants, specialist and time-slot booking for salons, date-range reservations for chalets and side-by-side compare for car showrooms.',
      'Used remote configuration and feature flags to tailor UI and behavior for each business without app releases, with offline-first Hive persistence for the tablet catalog.',
    ],
  ),
  ProjectModel(
    id: 'shalehi',
    category: 'CHALET BOOKING · MOBILE + WEB',
    title: 'Shalehi Booking Platform',
    description:
        'A live chalet booking platform connecting guests and vendors: guests search chalets, check real-time availability and pay with KNET, while vendors manage incoming reservations as they happen.',
    categoryIcon: Icons.house_rounded,
    showcases: [
      ProjectShowcase(
        image: 'assets/images/projects/shalehi.webp',
        label: 'Customer + vendor apps',
      ),
    ],
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.app.shalehi&pcampaignid=web_share',
    appStoreUrl:
        'https://apps.apple.com/eg/app/shalehi-%D8%B4%D8%A7%D9%84%D9%8A%D9%87%D9%8A/id1371783469',
    webUrl: 'https://app.shalehi.com',
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'Firebase',
      'KNET',
      'WebSockets',
      'Push Notifications',
      'Deep Linking',
      'Google Maps',
    ],
    bullets: [
      'Developed chalet search, real-time availability, reservations and KNET payments.',
      'Built vendor-side booking management for processing incoming reservations and updating booking statuses, with WebSockets and push notifications for live updates.',
      'Integrated customer and vendor workflows using REST APIs, Firebase and deep linking across the booking journey.',
    ],
  ),
  ProjectModel(
    id: 'hirsto',
    category: 'HEALTHCARE · MOBILE',
    title: 'Hirsto Healthcare App',
    description:
        'An AI-powered healthcare app that lets users track health data, attend AI voice and video consultations, and manage personal and family medical records from a single app.',
    categoryIcon: Icons.health_and_safety_rounded,
    showcases: [
      ProjectShowcase(
        image: 'assets/images/projects/hirsto.webp',
        label: 'Healthcare app',
      ),
    ],
    tags: [
      'Clean Architecture',
      'BLoC/Cubit',
      'GoRouter',
      'REST APIs',
      'ElevenLabs',
      'Zego Cloud',
    ],
    bullets: [
      'Built the MVP with Flutter, Clean Architecture, BLoC and GoRouter.',
      'Integrated ElevenLabs for speech processing and Zego Cloud for AI voice and video consultations.',
      'Developed health tracking, medical report processing and family medical-record sharing modules backed by REST APIs.',
    ],
  ),
  ProjectModel(
    id: 'german_learning',
    inDevelopment: true,
    category: 'EDUCATION · MOBILE + WEB ADMIN',
    title: 'German Learning Platform',
    description:
        '“Lass uns Deutsch lernen”: a German learning app with grammar materials, PDFs, audio, YouTube lessons and quizzes, published by the teacher through a companion web admin dashboard.',
    categoryIcon: Icons.school_rounded,
    showcases: [
      ProjectShowcase(
        image: 'assets/images/projects/german_learning.webp',
        label: 'Learner app + teacher dashboard',
      ),
    ],
    tags: [
      'Supabase',
      'BLoC/Cubit',
      'Authentication',
      'PDF · Audio · YouTube',
      'Quizzes',
      'Flutter Web',
    ],
    bullets: [
      'Developing the learner app with grammar materials, PDFs, audio, YouTube lessons and quizzes.',
      'Integrating Supabase BaaS for authentication and educational content management.',
      'Building the companion web admin dashboard for managing and publishing learning materials.',
    ],
  ),
];
