import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';
import 'package:my_portfolio/features/home/data/models/work_experience_model.dart';

void main() {
  group('projectsList', () {
    test('has unique ids', () {
      final ids = projectsList.map((p) => p.id).toSet();
      expect(ids.length, projectsList.length);
    });

    test('every project has exactly 3 bullets', () {
      for (final project in projectsList) {
        expect(project.bullets.length, 3, reason: project.id);
      }
    });

    test('tags are not duplicated within a project', () {
      for (final project in projectsList) {
        expect(
          project.tags.toSet().length,
          project.tags.length,
          reason: project.id,
        );
      }
    });

    test('image paths are generated sequentially', () {
      final shalehi = projectsList.firstWhere((p) => p.id == 'shalehi');
      expect(shalehi.images.first, 'assets/images/shalehi/1.webp');
    });

    test('image paths end at imageCount', () {
      final shalehi = projectsList.firstWhere((p) => p.id == 'shalehi');
      expect(shalehi.images.last, 'assets/images/shalehi/22.webp');
    });
  });

  group('inDevelopment projects', () {
    test('have no screenshots', () {
      for (final project in projectsList.where((p) => p.inDevelopment)) {
        expect(project.images, isEmpty, reason: project.id);
      }
    });

    test('include the German Learning Platform', () {
      final german = projectsList.firstWhere((p) => p.id == 'german_learning');
      expect(german.inDevelopment, isTrue);
    });
  });

  group('workExperiences', () {
    test('every role has bullets and tags', () {
      for (final job in workExperiences) {
        expect(job.bullets, isNotEmpty, reason: job.company);
        expect(job.tags, isNotEmpty, reason: job.company);
      }
    });
  });
}
