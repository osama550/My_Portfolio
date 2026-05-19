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
    company: 'BARQ SOLUTIONS',
    role: 'Flutter Developer',
    period: '2024 – Present',
    location: 'Kuwait | Remote',
    tags: [
      'BLoC',
      'WebSockets',
      'Maps',
      'API',
      'Push Notifications',
      'Payment Gateways',
      'Offline-First',
      'Remote Config',
    ],
    bullets: [
      'Built and maintained a scalable multi-vertical SaaS platform (booking, ordering, and management systems) across mobile and web.',
      'Designed and maintained Clean Architecture with BLoC for scalable and modular codebases.',
      'Built real-time synchronization using Pusher WebSockets, improving system responsiveness.',
      'Developed a dynamic remote configuration system for UI and feature control without app releases.',
      'Integrated secure services including maps, payment gateways, and push notifications.',
      'Delivered offline-first capabilities with local caching for an uninterrupted user experience.',
    ],
  ),
  WorkExperienceModel(
    company: 'Hirsto',
    role: 'Flutter Developer',
    period: '09/2025 – 01/2026',
    location: 'Dubai | Freelance',
    tags: [
      'Healthcare Apps',
      'Voice AI',
      'Streaming Chat',
      'TTS/STT',
      'Video Calls',
      'Bloc',
      'API',
      'Clean Architecture',
    ],
    bullets: [
      'Developed a comprehensive healthcare ecosystem featuring AI-powered streaming chat, health metric tracking, and medical report generation.',
      'Integrated Zego for Video/Voice calls and ElevenLabs (TTS/STT) for voice-based interactions.',
    ],
  ),
  WorkExperienceModel(
    company: 'DUBISIGN',
    role: 'Flutter Developer Intern',
    period: '11/2023 – 02/2024',
    location: 'Mansoura | On-site',
    tags: [
      'Web Dashboard',
      'Responsive UI',
      'Dio',
      'Bloc',
      'Clean Architecture',
      'API',
    ],
    bullets: [
      'Translated Figma designs into responsive Flutter Web UI for a document management dashboard.',
      'Integrated REST APIs using Dio to handle data flow and improve backend communication.',
      'Built reusable UI components to ensure consistency and scalability across the dashboard.',
      'Optimized performance by improving rendering efficiency and reducing unnecessary API calls.',
    ],
  ),
];
