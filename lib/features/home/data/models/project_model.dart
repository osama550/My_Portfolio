import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String description;
  final List<String> bullets;
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
    required this.description,
    required this.bullets,
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
    title: 'Shalehi App',
    description:
        'Shalehi is a chalet booking and reservation app that enables users to discover, reserve, and manage chalet bookings seamlessly through an immersive mobile experience.',
    categoryIcon: Icons.house_rounded,
    imagePathPrefix: 'assets/images/shalehi/',
    imageExtension: '.webp',
    imageCount: 22,
    // googlePlayUrl: 'https://play.google.com/store',
    // appStoreUrl: 'https://apps.apple.com/app-store',
    // webUrl: 'https://app.shalehi.com',
    tags: [
      'BLoC/Cubit',
      'REST APIs',
      'Firebase',
      'Google Maps',
      'KNET Gateway',
      'Deep Linking',
      'GoRouter',
      'Sentry',
      'Localization',
      'Push Notifications',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'hirsto',
    title: 'Hirsto Healthcare App',
    description:
        'Hirsto is an all-in-one digital healthcare platform that enables users to monitor health data, attend video and voice medical consultations, interact with an AI health assistant, and securely manage personal and family medical records from a single application.',
    categoryIcon: Icons.health_and_safety_rounded,
    imagePathPrefix: 'assets/images/hirsto/',
    imageExtension: '.webp',
    imageCount: 31,
    // googlePlayUrl: 'https://play.google.com/store',
    // appStoreUrl: 'https://apps.apple.com/app-store',
    // webUrl: 'https://hirsto.com',
    tags: [
      'Clean Architecture',
      'BLoC/Cubit',
      'Voice AI (TTS/STT)',
      'ElevenLabs',
      'Zego Video SDK',
      'REST APIs',
      'GoRouter',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'chalets_admin',
    title: 'Chalet Management App',
    description:
        'Chalet Management is a real-time booking and reservation management app for chalet vendors, enabling seamless handling of reservations, order tracking, live status updates, and customer booking operations from a single platform.',
    categoryIcon: Icons.admin_panel_settings_rounded,
    imagePathPrefix: 'assets/images/chalets_admin_booking/',
    imageExtension: '.webp',
    imageCount: 12,
    tags: [
      'WebSockets',
      'REST APIs',
      'BLoC/Cubit',
      'Live Updates',
      'Vendor Dashboard',
      'Order Lifecycle',
      'Push Notifications',
      'Responsive Design',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'salons',
    title: 'Salons App',
    description:
        'A comprehensive salon management and booking platform that allows users to seamlessly schedule appointments, select their preferred specialists, and choose convenient dates and times. It also features an integrated e-commerce section for users to explore and purchase beauty products directly.',
    categoryIcon: Icons.spa_rounded,
    imagePathPrefix: 'assets/images/salons/',
    imageExtension: '.webp',
    imageCount: 16,
    tags: [
      'Appointment Booking',
      'E-commerce',
      'Firebase',
      'Push Notifications',
      'Deep Linking',
      'REST APIs',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'tablet_catalog',
    title: 'Tablet Catalog App',
    description:
        'A multi-business tablet catalog app designed for reliable offline usage. Users can explore categories, detailed items, and media galleries even without internet access. Built with an offline-first architecture using Hive, focusing on fast local data access, smooth performance, and uninterrupted usability.',
    categoryIcon: Icons.point_of_sale_rounded,
    imagePathPrefix: 'assets/images/tablet_catalog/',
    imageExtension: '.webp',
    imageCount: 25,
    tags: [
      'Offline-First',
      'Local Storage',
      'Hive',
      'Tablet UI',
      'BLoC/Cubit',
      'GoRouter',
      'Localization',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'resturants',
    title: 'Restaurants App',
    description:
        'A modern restaurant platform designed to simplify dining and food ordering, enabling users to browse interactive menus, customize orders, and track delivery or pickup orders in real time through a seamless user experience.',
    categoryIcon: Icons.restaurant_rounded,
    imagePathPrefix: 'assets/images/resturants/',
    imageExtension: '.webp',
    imageCount: 14,
    tags: [
      'Food Delivery',
      'Digital Menu',
      'Cart & Checkout',
      'Push Notifications',
      'Firebase',
      'Google Maps',
      'Deep Linking',
      'REST APIs',
    ],
    bullets: [],
  ),
  ProjectModel(
    id: 'cars_show_room',
    title: 'Cars Showroom App',
    description:
        'A digital car showroom experience that provides detailed vehicle specifications, high-quality imagery, and comprehensive details. It features a quick QR code scanning functionality that enables users to instantly access and compare multiple cars side-by-side.',
    categoryIcon: Icons.directions_car_rounded,
    imagePathPrefix: 'assets/images/cars_show_room/',
    imageExtension: '.webp',
    imageCount: 13,
    tags: [
      'QR Code Scanner',
      'Deep Linking',
      'Vehicle Comparison',
      'Interactive Catalog',
      'Deep Linking',
      'Push Notifications',
    ],
    bullets: [],
  ),
];
