import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_typography.dart';

extension ThemeContextExtensions on BuildContext {
  AppTypography get typography {
    return Theme.of(this).extension<AppTypography>() ?? AppTypography.mobile;
  }

  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  /// Viewport-relative size clamped to [min, max] (CSS `clamp(min, vw, max)`).
  double fluid(double min, double vw, double max) =>
      (width * vw / 100).clamp(min, max).toDouble();
}
