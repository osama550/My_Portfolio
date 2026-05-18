import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/color.dart';

class IntroActionButtons extends StatelessWidget {
  final WrapAlignment alignment;
  final VoidCallback? onViewProjectsPressed;
  final VoidCallback? onDownloadCVPressed;
  final VoidCallback? onGetInTouchPressed;

  const IntroActionButtons({
    super.key,
    required this.alignment,
    this.onViewProjectsPressed,
    this.onDownloadCVPressed,
    this.onGetInTouchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: alignment,
      children: [
        OutlinedButton.icon(
          onPressed: onViewProjectsPressed,
          label: const Text('View Projects'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            side: const BorderSide(
              color: ColorsPalette.primary,
              width: 1.5,
            ),
            foregroundColor: ColorsPalette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: onDownloadCVPressed,
          icon: const Icon(Icons.file_download_outlined),
          label: const Text('Download CV'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            side: const BorderSide(
              color: ColorsPalette.primary,
              width: 1.5,
            ),
            foregroundColor: ColorsPalette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: onGetInTouchPressed,
          label: const Text('Get In Touch'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            side: const BorderSide(
              color: ColorsPalette.primary,
              width: 1.5,
            ),
            foregroundColor: ColorsPalette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
