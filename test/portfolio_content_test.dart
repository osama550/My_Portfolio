import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/features/home/data/models/project_model.dart';
import 'package:my_portfolio/features/home/data/models/work_experience_model.dart';

void main() {
  group('projectsList', () {
    test('lists the four projects in display order', () {
      expect(projectsList.map((p) => p.id), [
        'barq_platform',
        'shalehi',
        'hirsto',
        'german_learning',
      ]);
    });

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
  });

  group('showcases', () {
    test('every project has at least one showcase', () {
      for (final project in projectsList) {
        expect(project.showcases, isNotEmpty, reason: project.id);
      }
    });

    test('images sit directly in the asset folder declared in pubspec', () {
      for (final project in projectsList) {
        for (final image in project.images) {
          expect(File(image).parent.path, 'assets/images/projects');
        }
      }
    });

    test('image files exist on disk', () {
      for (final project in projectsList) {
        for (final image in project.images) {
          expect(File(image).existsSync(), isTrue, reason: image);
        }
      }
    });

    test('labels are unique within a project', () {
      for (final project in projectsList) {
        final labels = project.showcases.map((s) => s.label).toSet();
        expect(labels.length, project.showcases.length, reason: project.id);
      }
    });

    test('images keep the showcase order', () {
      final barq = projectsList.firstWhere((p) => p.id == 'barq_platform');
      expect(barq.images, [
        'assets/images/projects/barq_overview.webp',
        'assets/images/projects/barq_customer_app.webp',
        'assets/images/projects/barq_vendor_tablet.webp',
      ]);
    });
  });

  group('inDevelopment projects', () {
    test('only the German Learning Platform is in development', () {
      expect(projectsList.where((p) => p.inDevelopment).map((p) => p.id), [
        'german_learning',
      ]);
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
