class WorkExperienceModel {
  final String company;
  final String role;
  final String period;
  final String location;
  final List<String> bullets;
  final List<String> tags;

  const WorkExperienceModel({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.bullets,
    required this.tags,
  });
}

const List<WorkExperienceModel> workExperiences = [
  WorkExperienceModel(
    company: 'Barq Solutions',
    role: 'Flutter Developer',
    period: '2024 — Present',
    location: 'Kuwait · Remote',
    tags: [
      'BLoC',
      'WebSockets',
      'Maps',
      'REST APIs',
      'Push Notifications',
      'KNET',
      'Offline-First',
      'Remote Config',
      'Unit Testing',
    ],
    bullets: [
      'Develop and maintain Flutter mobile and web apps for a multi-tenant SaaS platform serving restaurants, salons, chalets and car showrooms.',
      'Structure features with Clean Architecture and BLoC/Cubit, keeping presentation, domain and data layers separate.',
      'Integrate REST APIs, WebSockets, Firebase, push notifications, Google Maps, deep linking and KNET payments.',
      'Implement remote configuration and feature flags so UI and business behavior change without app releases.',
      'Implement offline-first persistence with Hive for reliable local data access.',
      'Write unit tests for business logic and state management.',
    ],
  ),
  WorkExperienceModel(
    company: 'Hirsto',
    role: 'Flutter Developer',
    period: '09/2025 — 01/2026',
    location: 'Dubai · Freelance',
    tags: [
      'Healthcare',
      'Clean Architecture',
      'BLoC',
      'GoRouter',
      'ElevenLabs',
      'Zego Cloud',
    ],
    bullets: [
      'Built the MVP of an AI-powered healthcare app using Flutter, Clean Architecture, BLoC and GoRouter.',
      'Integrated ElevenLabs for speech processing and Zego Cloud for AI voice and video consultations.',
      'Developed health-tracking, medical report processing and family medical-record sharing modules backed by REST APIs.',
    ],
  ),
  WorkExperienceModel(
    company: 'Dubisign',
    role: 'Flutter Developer Intern',
    period: '11/2023 — 02/2024',
    location: 'Mansoura · On-site',
    tags: ['Flutter Web', 'Responsive UI', 'REST APIs', 'Figma'],
    bullets: [
      'Translated Figma designs into responsive Flutter Web interfaces built from reusable components.',
      'Integrated REST APIs and optimized network calls to reduce redundant requests and data consumption.',
      'Worked with senior developers to refactor state handling and reduce unnecessary widget rebuilds.',
    ],
  ),
];
