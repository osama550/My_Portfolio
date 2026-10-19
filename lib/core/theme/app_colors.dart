import 'package:flutter/material.dart';

/// Theme-dependent colors. Brand colors that never change live in
/// `ColorsPalette`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceMuted,
    required this.heading,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textHint,
    required this.border,
    required this.borderStrong,
    required this.borderHover,
    required this.tag,
    required this.tagText,
    required this.chipText,
    required this.navBackground,
    required this.gridLine,
    required this.accent,
    required this.accentTint,
    required this.shadow,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color surfaceMuted;
  final Color heading;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textHint;
  final Color border;
  final Color borderStrong;
  final Color borderHover;
  final Color tag;
  final Color tagText;
  final Color chipText;
  final Color navBackground;
  final Color gridLine;

  /// Brand cyan, darkened in light mode so text and icons stay legible.
  final Color accent;
  final Color accentTint;
  final Color shadow;

  static const dark = AppColors(
    background: Color(0xFF0B0B0C),
    surface: Color(0xFF141416),
    surfaceRaised: Color(0xFF1B1C1F),
    surfaceMuted: Color(0xFF1D1E21),
    heading: Color(0xFFFFFFFF),
    textPrimary: Color(0xFFF2F1EE),
    textSecondary: Color(0xFFB9B7B1),
    textMuted: Color(0xFFA9A7A1),
    textHint: Color(0xFF9A9892),
    border: Color(0xFF26272B),
    borderStrong: Color(0xFF2F3035),
    borderHover: Color(0xFF3D3E44),
    tag: Color(0xFF1F2023),
    tagText: Color(0xFFD8D6D0),
    chipText: Color(0xFFECEBE7),
    navBackground: Color(0xD1101012),
    gridLine: Color(0xFFFFFFFF),
    accent: Color(0xFF2BBCFD),
    accentTint: Color(0x1F2BBCFD),
    shadow: Color(0x59000000),
  );

  static const light = AppColors(
    background: Color(0xFFF6F7F9),
    surface: Color(0xFFFFFFFF),
    surfaceRaised: Color(0xFFF1F3F6),
    surfaceMuted: Color(0xFFEBEEF2),
    heading: Color(0xFF0B0B0C),
    textPrimary: Color(0xFF14151A),
    textSecondary: Color(0xFF4A4D57),
    textMuted: Color(0xFF5E626C),
    textHint: Color(0xFF727683),
    border: Color(0xFFE3E5EA),
    borderStrong: Color(0xFFD3D7DF),
    borderHover: Color(0xFFB4BAC6),
    tag: Color(0xFFF1F3F6),
    tagText: Color(0xFF3A3D46),
    chipText: Color(0xFF23252B),
    navBackground: Color(0xD1FFFFFF),
    gridLine: Color(0xFF000000),
    accent: Color(0xFF0A7DB3),
    accentTint: Color(0x1A0A7DB3),
    shadow: Color(0x1A000000),
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceRaised,
    Color? surfaceMuted,
    Color? heading,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textHint,
    Color? border,
    Color? borderStrong,
    Color? borderHover,
    Color? tag,
    Color? tagText,
    Color? chipText,
    Color? navBackground,
    Color? gridLine,
    Color? accent,
    Color? accentTint,
    Color? shadow,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      heading: heading ?? this.heading,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textHint: textHint ?? this.textHint,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      borderHover: borderHover ?? this.borderHover,
      tag: tag ?? this.tag,
      tagText: tagText ?? this.tagText,
      chipText: chipText ?? this.chipText,
      navBackground: navBackground ?? this.navBackground,
      gridLine: gridLine ?? this.gridLine,
      accent: accent ?? this.accent,
      accentTint: accentTint ?? this.accentTint,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      background: l(background, other.background),
      surface: l(surface, other.surface),
      surfaceRaised: l(surfaceRaised, other.surfaceRaised),
      surfaceMuted: l(surfaceMuted, other.surfaceMuted),
      heading: l(heading, other.heading),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textMuted: l(textMuted, other.textMuted),
      textHint: l(textHint, other.textHint),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      borderHover: l(borderHover, other.borderHover),
      tag: l(tag, other.tag),
      tagText: l(tagText, other.tagText),
      chipText: l(chipText, other.chipText),
      navBackground: l(navBackground, other.navBackground),
      gridLine: l(gridLine, other.gridLine),
      accent: l(accent, other.accent),
      accentTint: l(accentTint, other.accentTint),
      shadow: l(shadow, other.shadow),
    );
  }
}
