class ApproachModel {
  final String label;
  final String title;
  final String description;

  const ApproachModel({
    required this.label,
    required this.title,
    required this.description,
  });
}

const List<ApproachModel> approachItems = [
  ApproachModel(
    label: '01 / STRUCTURE',
    title: 'Clean Architecture + BLoC',
    description:
        'Separate presentation, domain and data layers with SOLID design keeps features isolated and testable.',
  ),
  ApproachModel(
    label: '02 / REAL-TIME',
    title: 'Live data',
    description:
        'WebSockets and push notifications for live order and booking updates.',
  ),
  ApproachModel(
    label: '03 / RESILIENCE',
    title: 'Offline-first',
    description:
        'Hive-backed local persistence so apps keep working with weak or no connectivity.',
  ),
  ApproachModel(
    label: '04 / CONTROL',
    title: 'Remote configuration',
    description:
        'Remote configuration and feature flags change UI and behavior without a new app release.',
  ),
];
