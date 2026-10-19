import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/app_button.dart';

class IntroActionButtons extends StatelessWidget {
  final VoidCallback? onViewProjectsPressed;
  final VoidCallback? onDownloadCVPressed;
  final VoidCallback? onGetInTouchPressed;

  const IntroActionButtons({
    super.key,
    this.onViewProjectsPressed,
    this.onDownloadCVPressed,
    this.onGetInTouchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppButton(
          label: 'Let’s Talk',
          trailingIcon: Icons.arrow_forward_rounded,
          onPressed: onGetInTouchPressed,
        ),
        AppButton(
          label: 'View Work',
          trailingIcon: Icons.north_east_rounded,
          style: AppButtonStyle.outlined,
          onPressed: onViewProjectsPressed,
        ),
        AppButton(
          label: 'Download CV',
          trailingIcon: Icons.file_download_outlined,
          style: AppButtonStyle.outlined,
          onPressed: onDownloadCVPressed,
        ),
      ],
    );
  }
}
