import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<String> bullets;
  final bool featured;
  final bool inDevelopment;
  final List<String> tags;
  final String imagePathPrefix;
  final String imageExtension;
  final int imageCount;
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
    this.featured = false,
    this.inDevelopment = false,
    required this.tags,
    required this.imagePathPrefix,
    required this.imageExtension,
    required this.imageCount,
    required this.categoryIcon,
    this.googlePlayUrl,
    this.appStoreUrl,
    this.webUrl,
    this.githubUrl,
  });

  /// Programmatically generates the sequential list of image assets
  List<String> get images => List.generate(
    imageCount,
    (index) => '$imagePathPrefix${index + 1}$imageExtension',
  );
}

const List<ProjectModel> projectsList = [
  ProjectModel(
    id: 'shalehi',
    featured: true,
    category: 'CHALET RENTAL & BOOKING · MOBILE + WEB',
    title: 'Shalehi App',
    description:
        'Shalehi is a chalet booking and reservation app that enables users to discover, reserve, and manage chalet bookings seamlessly through an immersive mobile experience.',
    categoryIcon: Icons.house_rounded,
    imagePathPrefix: 'assets/images/shalehi/',
    imageExtension: '.webp',
    imageCount: 22,
    googlePlayUrl:
        'https://play.google.com/store/apps/details?id=com.app.shalehi&pcampaignid=web_share',
    appStoreUrl:
        'https://apps.apple.com/eg/app/shalehi-%D8%B4%D8%A7%D9%84%D9%8A%D9%87%D9%8A/id1371783469',
    webUrl: 'https://app.shalehi.com',
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'Firebase',
      'Google Maps',
      'KNET',
      'WebSockets',
      'Deep Linking',
      'Push Notifications',
    ],
    bullets: [
      'Developed chalet search, real-time availability, reservations and KNET payments.',
      'Built vendor-side booking management with WebSockets and push notifications for live updates.',
      'Connected customer and vendor workflows with REST APIs, Firebase and deep linking.',
    ],
  ),
  ProjectModel(
    id: 'hirsto',
    featured: true,
    category: 'HEALTHCARE · FREELANCE, DUBAI · 09/2025–01/2026',
    title: 'Hirsto Healthcare App',
    description:
        'Hirsto is an AI-powered healthcare app that lets users track health data, attend video and voice consultations, and manage personal and family medical records from a single application.',
    categoryIcon: Icons.health_and_safety_rounded,
    imagePathPrefix: 'assets/images/hirsto/',
    imageExtension: '.webp',
    imageCount: 31,
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
      'Developed health tracking, medical report processing and family record sharing on REST APIs.',
    ],
  ),
  ProjectModel(
    id: 'chalets_admin',
    category: 'VENDOR OPERATIONS · MOBILE + WEB',
    title: 'Chalet Management App',
    description:
        'Chalet Management is a real-time booking and reservation management app for chalet vendors, enabling seamless handling of reservations, order tracking, live status updates, and customer booking operations from a single platform.',
    categoryIcon: Icons.admin_panel_settings_rounded,
    imagePathPrefix: 'assets/images/chalets_admin_booking/',
    imageExtension: '.webp',
    imageCount: 12,
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'WebSockets',
      'Push Notifications',
      'Responsive Design',
    ],
    bullets: [
      'Built vendor-side booking management for processing incoming reservations.',
      'Added booking status updates driven by WebSockets and push notifications.',
      'Delivered the vendor experience on both mobile and responsive web.',
    ],
  ),
  ProjectModel(
    id: 'salons',
    category: 'SALON BOOKING & E-COMMERCE',
    title: 'Salons App',
    description:
        'A comprehensive salon management and booking platform that allows users to seamlessly schedule appointments, select their preferred specialists, and choose convenient dates and times. It also features an integrated e-commerce section for users to explore and purchase beauty products directly.',
    categoryIcon: Icons.spa_rounded,
    imagePathPrefix: 'assets/images/salons/',
    imageExtension: '.webp',
    imageCount: 16,
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'Firebase',
      'Push Notifications',
      'Remote Config',
    ],
    bullets: [
      'Part of the BARQ multi-tenant SaaS platform, configured for salon businesses.',
      'Developed booking and ordering flows adapted to the salon vertical.',
      'Used remote configuration and feature flags to tailor UI and behavior without a release.',
    ],
  ),
  ProjectModel(
    id: 'tablet_catalog',
    category: 'OFFLINE CATALOG · TABLET',
    title: 'Tablet Catalog App',
    description:
        'A multi-business tablet catalog app designed for reliable offline usage. Users can explore categories, detailed items, and media galleries even without internet access. Built with an offline-first architecture using Hive, focusing on fast local data access, smooth performance, and uninterrupted usability.',
    categoryIcon: Icons.point_of_sale_rounded,
    imagePathPrefix: 'assets/images/tablet_catalog/',
    imageExtension: '.webp',
    imageCount: 25,
    tags: ['Offline-First', 'Hive', 'BLoC/Cubit', 'GoRouter', 'Localization'],
    bullets: [
      'Developed the tablet catalog for in-store product presentation.',
      'Implemented offline-first persistence with Hive for reliable local data access.',
      'Supported different product-display experiences per business type.',
    ],
  ),
  ProjectModel(
    id: 'resturants',
    category: 'FOOD ORDERING & DELIVERY',
    title: 'Restaurants App',
    description:
        'A modern restaurant platform designed to simplify dining and food ordering, enabling users to browse interactive menus, customize orders, and track delivery or pickup orders in real time through a seamless user experience.',
    categoryIcon: Icons.restaurant_rounded,
    imagePathPrefix: 'assets/images/resturants/',
    imageExtension: '.webp',
    imageCount: 14,
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'Firebase',
      'Google Maps',
      'Push Notifications',
      'Deep Linking',
    ],
    bullets: [
      'Part of the BARQ multi-tenant SaaS platform, configured for restaurants.',
      'Developed menu browsing, order customization and checkout flows.',
      'Integrated Google Maps, Firebase and push notifications for the ordering journey.',
    ],
  ),
  ProjectModel(
    id: 'cars_show_room',
    category: 'DIGITAL SHOWROOM · QR CATALOG',
    title: 'Cars Showroom App',
    description:
        'A digital car showroom experience that provides detailed vehicle specifications, high-quality imagery, and comprehensive details. It features a quick QR code scanning functionality that enables users to instantly access and compare multiple cars side-by-side.',
    categoryIcon: Icons.directions_car_rounded,
    imagePathPrefix: 'assets/images/cars_show_room/',
    imageExtension: '.webp',
    imageCount: 13,
    tags: [
      'BLoC/Cubit',
      'QR Scanner',
      'Deep Linking',
      'Push Notifications',
      'Remote Config',
    ],
    bullets: [
      'Part of the BARQ multi-tenant SaaS platform, configured for car showrooms.',
      'Built the product-display experience with detailed specs and imagery.',
      'Added QR scanning and deep links to open and compare vehicles side by side.',
    ],
  ),
  ProjectModel(
    id: 'german_learning',
    inDevelopment: true,
    category: 'EDUCATION · MOBILE + WEB ADMIN · IN DEVELOPMENT',
    title: 'German Learning Platform',
    description:
        'A German learning app with grammar materials, PDFs, audio, YouTube lessons and quizzes, plus a companion web admin dashboard for managing and publishing the learning content.',
    categoryIcon: Icons.school_rounded,
    imagePathPrefix: '',
    imageExtension: '',
    imageCount: 0,
    tags: [
      'Supabase',
      'BLoC/Cubit',
      'Authentication',
      'Quizzes',
      'Flutter Web',
    ],
    bullets: [
      'Developing grammar materials, PDFs, audio, YouTube lessons and quizzes.',
      'Integrating Supabase BaaS for authentication and educational content management.',
      'Building a web admin dashboard to manage and publish learning materials.',
    ],
  ),
];
