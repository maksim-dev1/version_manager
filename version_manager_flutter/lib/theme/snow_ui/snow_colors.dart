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
    // Основной цвет приложения (кнопки, активные элементы)
    primary: SnowColors.blue,
    // Текст/иконки на primary цвете
    onPrimary: SnowColors.white100,
    // Контейнеры с primary контентом (менее заметные элементы)
    primaryContainer: SnowColors.light,
    // Текст/иконки на primaryContainer
    onPrimaryContainer: SnowColors.black100,
    // Вторичный цвет (FAB, чипсы, переключатели)
    secondary: SnowColors.purple,
    // Текст/иконки на secondary цвете
    onSecondary: SnowColors.white100,
    // Контейнеры с secondary контентом
    secondaryContainer: SnowColors.purple50,
    // Текст/иконки на secondaryContainer
    onSecondaryContainer: SnowColors.black80,
    // Третичный цвет (акценты, выделения)
    tertiary: SnowColors.greenA,
    // Текст/иконки на tertiary цвете
    onTertiary: SnowColors.white100,
    // Контейнеры с tertiary контентом
    tertiaryContainer: SnowColors.white5,
    // Текст/иконки на tertiaryContainer
    onTertiaryContainer: SnowColors.black80,
    // Цвет ошибок (предупреждения, критические действия)
    error: SnowColors.red,
    // Текст/иконки на error цвете
    onError: SnowColors.white100,
    // Контейнеры с error контентом
    errorContainer: Color(0xFFFFE5E5),
    // Текст/иконки на errorContainer
    onErrorContainer: Color(0xFF8B0000),
    // Основной фон поверхностей (карточки, диалоги)
    surface: SnowColors.white100,
    // Текст/иконки на surface
    onSurface: SnowColors.black100,
    // Приподнятые поверхности (app bar, bottom sheets)
    surfaceContainerHighest: SnowColors.white5,
    // Второстепенный текст/иконки на поверхностях
    onSurfaceVariant: SnowColors.black40,
    // Границы элементов (borders, dividers)
    outline: SnowColors.black20,
    // Более тонкие границы
    outlineVariant: SnowColors.black10,
    // Тени элементов
    shadow: SnowColors.black100,
    // Затемнение фона (модальные окна)
    scrim: SnowColors.black100,
    // Инверсный фон (для dark mode элементов в light theme)
    inverseSurface: SnowColors.backgroundDark1,
    // Текст на inverseSurface
    onInverseSurface: SnowColors.white100,
    // Инверсный primary цвет
    inversePrimary: SnowColors.blue,
    // Оттенок для поверхностей с primary акцентом
    surfaceTint: SnowColors.blue,
  );
}

/// SnowUI Dark ColorScheme
ColorScheme snowUIDarkColorScheme() {
  return ColorScheme(
    brightness: Brightness.dark,
    // Основной цвет приложения (кнопки, активные элементы)
    primary: SnowColors.blue,
    // Текст/иконки на primary цвете
    onPrimary: SnowColors.white100,
    // Контейнеры с primary контентом (менее заметные элементы)
    primaryContainer: SnowColors.backgroundDark3,
    // Текст/иконки на primaryContainer
    onPrimaryContainer: SnowColors.white100,
    // Вторичный цвет (FAB, чипсы, переключатели)
    secondary: SnowColors.purple,
    // Текст/иконки на secondary цвете
    onSecondary: SnowColors.white100,
    // Контейнеры с secondary контентом
    secondaryContainer: SnowColors.backgroundDark3,
    // Текст/иконки на secondaryContainer
    onSecondaryContainer: SnowColors.white80,
    // Третичный цвет (акценты, выделения)
    tertiary: SnowColors.greenA,
    // Текст/иконки на tertiary цвете
    onTertiary: SnowColors.white100,
    // Контейнеры с tertiary контентом
    tertiaryContainer: SnowColors.backgroundDark3,
    // Текст/иконки на tertiaryContainer
    onTertiaryContainer: SnowColors.white80,
    // Цвет ошибок (предупреждения, критические действия)
    error: SnowColors.red,
    // Текст/иконки на error цвете
    onError: SnowColors.white100,
    // Контейнеры с error контентом
    errorContainer: SnowColors.backgroundDark3,
    // Текст/иконки на errorContainer
    onErrorContainer: SnowColors.red,
    // Основной фон поверхностей (карточки, диалоги)
    surface: SnowColors.backgroundDark1,
    // Текст/иконки на surface
    onSurface: SnowColors.white100,
    // Приподнятые поверхности (app bar, bottom sheets)
    surfaceContainerHighest: SnowColors.backgroundDark2,
    // Второстепенный текст/иконки на поверхностях
    onSurfaceVariant: SnowColors.white40,
    // Границы элементов (borders, dividers)
    outline: SnowColors.backgroundDark4,
    // Более тонкие границы
    outlineVariant: SnowColors.backgroundDark3,
    // Тени элементов
    shadow: SnowColors.black100,
    // Затемнение фона (модальные окна)
    scrim: SnowColors.black100,
    // Инверсный фон (для light mode элементов в dark theme)
    inverseSurface: SnowColors.white100,
    // Текст на inverseSurface
    onInverseSurface: SnowColors.black100,
    // Инверсный primary цвет
    inversePrimary: SnowColors.blue,
    // Оттенок для поверхностей с primary акцентом
    surfaceTint: SnowColors.blue,
  );
}
