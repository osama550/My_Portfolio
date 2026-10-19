import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/theme/app_colors.dart';
import 'package:my_portfolio/core/theme/app_typography.dart';
import 'package:my_portfolio/core/theme/breakpoints.dart';
import 'package:my_portfolio/core/theme/color.dart';

class AppTheme {
  static ThemeData light(DeviceType deviceType) =>
      _build(deviceType, Brightness.light, AppColors.light);

  static ThemeData dark(DeviceType deviceType) =>
      _build(deviceType, Brightness.dark, AppColors.dark);

  static ThemeData _build(
    DeviceType deviceType,
    Brightness brightness,
    AppColors colors,
  ) {
    final typography = switch (deviceType) {
      DeviceType.mobile => AppTypography.mobile,
      DeviceType.tablet => AppTypography.tablet,
      DeviceType.desktop => AppTypography.desktop,
    };

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: ColorsPalette.primary,
          brightness: brightness,
        ).copyWith(
          primary: colors.accent,
          secondary: colors.accent,
          onPrimary: ColorsPalette.onPrimary,
          surface: colors.surface,
          onSurface: colors.textPrimary,
          error: ColorsPalette.error,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      extensions: [typography, colors],
      primaryColor: ColorsPalette.primary,
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.surface,
      dividerColor: colors.border,
      shadowColor: colors.shadow,
      hintColor: colors.textHint,
      highlightColor: colors.accentTint,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colors.surface,
        foregroundColor: colors.textPrimary,
        centerTitle: true,
        titleTextStyle: typography.h5Bold.copyWith(color: colors.textPrimary),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.surface),
      iconTheme: IconThemeData(color: colors.accent, size: 22),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shadowColor: colors.shadow,
          backgroundColor: ColorsPalette.primary,
          foregroundColor: ColorsPalette.onPrimary,
          disabledBackgroundColor: colors.surfaceRaised,
          disabledForegroundColor: colors.textHint,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.accent,
          textStyle: typography.bodySmallBold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        hintStyle: typography.bodyMediumMedium.copyWith(color: colors.textHint),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.accent, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: colors.border),
        ),
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        _textTheme(typography, colors),
      ),
    );
  }

  static TextTheme _textTheme(AppTypography t, AppColors c) {
    return TextTheme(
      displayLarge: t.h1Bold.copyWith(color: c.textPrimary),
      displayMedium: t.h2Bold.copyWith(color: c.textPrimary),
      displaySmall: t.h3Bold.copyWith(color: c.textPrimary),
      headlineLarge: t.h4Bold.copyWith(color: c.textPrimary),
      headlineMedium: t.h5Bold.copyWith(color: c.textPrimary),
      headlineSmall: t.h6Bold.copyWith(color: c.textPrimary),
      titleLarge: t.bodyXLargeBold.copyWith(color: c.textPrimary),
      titleMedium: t.bodyXLargeSemiBold.copyWith(color: c.textPrimary),
      titleSmall: t.bodyLargeBold.copyWith(color: c.textPrimary),
      bodyLarge: t.bodyLargeMedium.copyWith(color: c.textSecondary),
      bodyMedium: t.bodyMediumBold.copyWith(color: c.textSecondary),
      bodySmall: t.bodySmallBold.copyWith(color: c.textSecondary),
      labelLarge: t.bodyXSmallBold.copyWith(color: c.textSecondary),
      labelMedium: t.bodyXSmallMedium.copyWith(color: c.textSecondary),
      labelSmall: t.bodyXSmallRegular.copyWith(color: c.textHint),
    );
  }
}
