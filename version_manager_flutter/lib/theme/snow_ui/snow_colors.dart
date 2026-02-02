import 'package:flutter/material.dart';

/// SnowUI Color System - Official
/// Based on https://snowui.byewind.com/colors
class SnowColors {
  SnowColors._();

  // ============================================================
  // PRIMARY COLORS
  // ============================================================
  static const Color brand = Color(0xFF6C5CE7);
  static const Color blue = Color(0xFF0984E3);
  static const Color purple = Color(0xFFA29BFE);
  static const Color purple50 = Color(0xFFD5D0FE);
  static const Color light = Color(0xFFE8F4FF);

  // ============================================================
  // SECONDARY COLORS
  // ============================================================
  static const Color purpleA = Color(0xFF9B59B6);
  static const Color purpleB = Color(0xFFBB86FC);
  static const Color blueA = Color(0xFF3498DB);
  static const Color blueB = Color(0xFF5DADE2);
  static const Color greenA = Color(0xFF27AE60);
  static const Color greenB = Color(0xFF58D68D);
  static const Color yellow = Color(0xFFF39C12);
  static const Color red = Color(0xFFE74C3C);

  // ============================================================
  // BLACK & WHITE (100%, 80%, 40%, 20%, 10%, 5%)
  // ============================================================
  static const Color black100 = Color(0xFF000000);
  static const Color black80 = Color(0xFF333333);
  static const Color black40 = Color(0xFF999999);
  static const Color black20 = Color(0xFFCCCCCC);
  static const Color black10 = Color(0xFFE6E6E6);
  static const Color black5 = Color(0xFFF2F2F2);

  static const Color white100 = Color(0xFFFFFFFF);
  static const Color white80 = Color(0xFFFAFAFA);
  static const Color white40 = Color(0xFFF0F0F0);
  static const Color white20 = Color(0xFFE8E8E8);
  static const Color white10 = Color(0xFFE0E0E0);
  static const Color white5 = Color(0xFFF8F8F8);

  // ============================================================
  // BACKGROUND
  // ============================================================
  static const Color backgroundLight1 = Color(0xFFFFFFFF);
  static const Color backgroundLight2 = Color(0xFFFAFAFA);
  static const Color backgroundLight3 = Color(0xFFF5F5F5);
  static const Color backgroundLight4 = Color(0xFFF0F0F0);
  static const Color backgroundLight5 = Color(0xFFEBEBEB);
  static const Color backgroundLight6 = Color(0xFFE0E0E0);

  static const Color backgroundDark1 = Color(0xFF1C1C1E);
  static const Color backgroundDark2 = Color(0xFF2C2C2E);
  static const Color backgroundDark3 = Color(0xFF3A3A3C);
  static const Color backgroundDark4 = Color(0xFF48484A);
  static const Color backgroundDark5 = Color(0xFF636366);
  static const Color backgroundDark6 = Color(0xFF8E8E93);
}

/// SnowUI Light ColorScheme
ColorScheme snowUILightColorScheme() {
  return ColorScheme(
    brightness: Brightness.light,
    primary: SnowColors.blue,
    onPrimary: SnowColors.white100,
    primaryContainer: SnowColors.light,
    onPrimaryContainer: SnowColors.black100,
    secondary: SnowColors.purple,
    onSecondary: SnowColors.white100,
    secondaryContainer: SnowColors.purple50,
    onSecondaryContainer: SnowColors.black80,
    tertiary: SnowColors.greenA,
    onTertiary: SnowColors.white100,
    tertiaryContainer: SnowColors.white5,
    onTertiaryContainer: SnowColors.black80,
    error: SnowColors.red,
    onError: SnowColors.white100,
    errorContainer: Color(0xFFFFE5E5),
    onErrorContainer: Color(0xFF8B0000),
    surface: SnowColors.white100,
    onSurface: SnowColors.black100,
    surfaceContainerHighest: SnowColors.white5,
    onSurfaceVariant: SnowColors.black40,
    outline: SnowColors.black20,
    outlineVariant: SnowColors.black10,
    shadow: SnowColors.black100,
    scrim: SnowColors.black100,
    inverseSurface: SnowColors.backgroundDark1,
    onInverseSurface: SnowColors.white100,
    inversePrimary: SnowColors.blue,
    surfaceTint: SnowColors.blue,
  );
}

/// SnowUI Dark ColorScheme
ColorScheme snowUIDarkColorScheme() {
  return ColorScheme(
    brightness: Brightness.dark,
    primary: SnowColors.blue,
    onPrimary: SnowColors.white100,
    primaryContainer: SnowColors.backgroundDark3,
    onPrimaryContainer: SnowColors.white100,
    secondary: SnowColors.purple,
    onSecondary: SnowColors.white100,
    secondaryContainer: SnowColors.backgroundDark3,
    onSecondaryContainer: SnowColors.white80,
    tertiary: SnowColors.greenA,
    onTertiary: SnowColors.white100,
    tertiaryContainer: SnowColors.backgroundDark3,
    onTertiaryContainer: SnowColors.white80,
    error: SnowColors.red,
    onError: SnowColors.white100,
    errorContainer: SnowColors.backgroundDark3,
    onErrorContainer: SnowColors.red,
    surface: SnowColors.backgroundDark1,
    onSurface: SnowColors.white100,
    surfaceContainerHighest: SnowColors.backgroundDark2,
    onSurfaceVariant: SnowColors.white40,
    outline: SnowColors.backgroundDark4,
    outlineVariant: SnowColors.backgroundDark3,
    shadow: SnowColors.black100,
    scrim: SnowColors.black100,
    inverseSurface: SnowColors.white100,
    onInverseSurface: SnowColors.black100,
    inversePrimary: SnowColors.blue,
    surfaceTint: SnowColors.blue,
  );
}
