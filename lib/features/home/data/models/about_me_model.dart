class AboutMeModel {
  final List<String> paragraphs;
  final String education;

  const AboutMeModel({required this.paragraphs, required this.education});
}

const AboutMeModel aboutMeData = AboutMeModel(
  paragraphs: [
    'I’m a Flutter developer with 2+ years building mobile and web apps: a multi-tenant SaaS platform for restaurants, salons, chalets and car showrooms, plus the MVP of an AI-powered healthcare app.',
    'I structure features with Clean Architecture, SOLID and BLoC/Cubit, and cover the details users feel: offline-first storage, real-time updates, deep links and KNET payments. I’m also building a German learning app on Supabase, with a companion web admin dashboard.',
  ],
  education:
      'B.Sc. Computer Science, Zagazig University — Faculty of Computers and Information, 2019–2023.',
);
