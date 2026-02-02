import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'snow_colors.dart';
import 'snow_spacing.dart';
import 'snow_typography.dart';

/// SnowUI Theme Builder
class SnowTheme {
  SnowTheme._();

  /// Light Theme
  static ThemeData light() {
    final colorScheme = snowUILightColorScheme();
    final textTheme = SnowTypography.textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: 'Inter',

      // AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: SnowTypography.text18Semibold.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius12),
          side: BorderSide(color: colorScheme.outline, width: 1),
        ),
        color: colorScheme.surface,
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Filled Button
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing16,
            vertical: SnowSpacing.spacing8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SnowSpacing.spacing16,
          vertical: SnowSpacing.spacing12,
        ),
        hintStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        labelStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: SnowTypography.text14Regular,
        padding: const EdgeInsets.symmetric(
          horizontal: SnowSpacing.spacing12,
          vertical: SnowSpacing.spacing8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
        ),
      ),

      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius16),
        ),
        titleTextStyle: SnowTypography.text24Semibold.copyWith(
          color: colorScheme.onSurface,
        ),
        contentTextStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SnowRadius.radius16),
          ),
        ),
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: SnowColors.black80,
        contentTextStyle: SnowTypography.text14Regular.copyWith(
          color: SnowColors.white100,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Navigation Bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.all(
          SnowTypography.text12Semibold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Dark Theme
  static ThemeData dark() {
    final colorScheme = snowUIDarkColorScheme();
    final textTheme = SnowTypography.textTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: 'Inter',

      // AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: SnowTypography.text18Semibold.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius12),
          side: BorderSide(color: colorScheme.outline, width: 1),
        ),
        color: colorScheme.surfaceContainerHighest,
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Filled Button
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing20,
            vertical: SnowSpacing.spacing12,
          ),
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: SnowSpacing.spacing16,
            vertical: SnowSpacing.spacing8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SnowRadius.radius8),
          ),
          textStyle: SnowTypography.text14Semibold,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SnowSpacing.spacing16,
          vertical: SnowSpacing.spacing12,
        ),
        hintStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        labelStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.primaryContainer,
        labelStyle: SnowTypography.text14Regular,
        padding: const EdgeInsets.symmetric(
          horizontal: SnowSpacing.spacing12,
          vertical: SnowSpacing.spacing8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
        ),
      ),

      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius16),
        ),
        titleTextStyle: SnowTypography.text24Semibold.copyWith(
          color: colorScheme.onSurface,
        ),
        contentTextStyle: SnowTypography.text14Regular.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SnowRadius.radius16),
          ),
        ),
      ),

      // Snackbar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: SnowColors.backgroundDark3,
        contentTextStyle: SnowTypography.text14Regular.copyWith(
          color: SnowColors.white100,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SnowRadius.radius8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Navigation Bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primaryContainer,
        labelTextStyle: WidgetStateProperty.all(
          SnowTypography.text12Semibold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
