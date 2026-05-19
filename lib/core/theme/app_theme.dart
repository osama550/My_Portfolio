import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/app_typography.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';

class AppTheme {
  static ThemeData theme(DeviceType deviceType) {
    final typography = switch (deviceType) {
      DeviceType.mobile => AppTypography.mobile,
      DeviceType.tablet => AppTypography.tablet,
      DeviceType.desktop => AppTypography.desktop,
    };

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      extensions: [typography],
      primaryColor: ColorsPalette.primary,
      scaffoldBackgroundColor: ColorsPalette.scaffoldBackground,
      cardColor: ColorsPalette.card,
      dividerColor: ColorsPalette.divider,
      shadowColor: ColorsPalette.shadow,
      hintColor: ColorsPalette.textHint,
      highlightColor: ColorsPalette.primaryLight,
      colorScheme: const ColorScheme.light(
        primary: ColorsPalette.primary,
        secondary: ColorsPalette.primary,
        surface: ColorsPalette.surface,
        error: ColorsPalette.error,
        onPrimary: Colors.white,
        onSurface: ColorsPalette.textPrimary,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: ColorsPalette.surface,
        foregroundColor: ColorsPalette.textPrimary,
        centerTitle: true,
        titleTextStyle: typography.h5Bold.copyWith(
          color: ColorsPalette.textPrimary,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorsPalette.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsPalette.surface,
      ),
      iconTheme: const IconThemeData(color: ColorsPalette.primary, size: 22),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shadowColor: ColorsPalette.shadow,
          backgroundColor: ColorsPalette.primary,
          foregroundColor: ColorsPalette.textWhite,
          disabledBackgroundColor: Color(0xFFE2E8F0),
          disabledForegroundColor: Color(0xFF94A3B8),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsPalette.primary,
          textStyle: typography.bodySmallBold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: typography.bodyMediumMedium.copyWith(
          color: ColorsPalette.textHint,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ColorsPalette.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorsPalette.primary,
            width: 1.5,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: ColorsPalette.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: ColorsPalette.border),
        ),
      ),
      textTheme: textTheme(typography),
    );
  }

  static TextTheme textTheme(AppTypography typography) {
    return TextTheme(
      displayLarge: typography.h1Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      displayMedium: typography.h2Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      displaySmall: typography.h3Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      headlineLarge: typography.h4Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      headlineMedium: typography.h5Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      headlineSmall: typography.h6Bold.copyWith(
        color: ColorsPalette.textPrimary,
      ),

      titleLarge: typography.bodyXLargeBold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      titleMedium: typography.bodyXLargeSemiBold.copyWith(
        color: ColorsPalette.textPrimary,
      ),
      titleSmall: typography.bodyLargeBold.copyWith(
        color: ColorsPalette.textPrimary,
      ),

      bodyLarge: typography.bodyLargeMedium.copyWith(
        color: ColorsPalette.textSecondary,
      ),
      bodyMedium: typography.bodyMediumBold.copyWith(
        color: ColorsPalette.textSecondary,
      ),
      bodySmall: typography.bodySmallBold.copyWith(
        color: ColorsPalette.textSecondary,
      ),

      labelLarge: typography.bodyXSmallBold.copyWith(
        color: ColorsPalette.textSecondary,
      ),
      labelMedium: typography.bodyXSmallMedium.copyWith(
        color: ColorsPalette.textSecondary,
      ),
      labelSmall: typography.bodyXSmallRegular.copyWith(
        color: ColorsPalette.textHint,
      ),
    );
  }
}
