import 'package:flutter/material.dart';

/// SnowUI Typography System
/// Font: Inter
/// Official sizes: 48, 24, 18, 14, 12 (Semibold + Regular)
class SnowTypography {
  SnowTypography._();

  static const String _fontFamily = 'Inter';

  // ============================================================
  // OFFICIAL SNOWUI TEXT STYLES
  // Only: 48, 24, 18, 14, 12
  // ============================================================

  /// 48 Semibold - Display / Hero
  static const TextStyle text48Semibold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 24 Semibold - Headings
  static const TextStyle text24Semibold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// 24 Regular - Headings
  static const TextStyle text24Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  /// 18 Semibold - Subheadings
  static const TextStyle text18Semibold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// 18 Regular - Subheadings
  static const TextStyle text18Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// 14 Semibold - Body / UI
  static const TextStyle text14Semibold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  /// 14 Regular - Body / UI
  static const TextStyle text14Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// 12 Semibold - Small text / Captions
  static const TextStyle text12Semibold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  /// 12 Regular - Small text / Captions
  static const TextStyle text12Regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // ============================================================
  // MATERIAL TEXT THEME MAPPING
  // Mapping SnowUI styles to Material Design
  // ============================================================

  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: text48Semibold.copyWith(color: colorScheme.onSurface),
      displayMedium: text48Semibold.copyWith(color: colorScheme.onSurface),
      displaySmall: text24Semibold.copyWith(color: colorScheme.onSurface),
      headlineLarge: text24Semibold.copyWith(color: colorScheme.onSurface),
      headlineMedium: text24Semibold.copyWith(color: colorScheme.onSurface),
      headlineSmall: text18Semibold.copyWith(color: colorScheme.onSurface),
      titleLarge: text18Semibold.copyWith(color: colorScheme.onSurface),
      titleMedium: text18Regular.copyWith(color: colorScheme.onSurface),
      titleSmall: text14Semibold.copyWith(color: colorScheme.onSurface),
      bodyLarge: text18Regular.copyWith(color: colorScheme.onSurface),
      bodyMedium: text14Regular.copyWith(color: colorScheme.onSurface),
      bodySmall: text12Regular.copyWith(color: colorScheme.onSurface),
      labelLarge: text14Semibold.copyWith(color: colorScheme.onSurface),
      labelMedium: text14Regular.copyWith(color: colorScheme.onSurface),
      labelSmall: text12Semibold.copyWith(color: colorScheme.onSurface),
    );
  }
}
