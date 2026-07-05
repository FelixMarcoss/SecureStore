import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF051424);
  static const Color onBackground = Color(0xFFD4E4FA);

  static const Color surface = Color(0xFF051424);
  static const Color surfaceDim = Color(0xFF051424);
  static const Color surfaceBright = Color(0xFF2C3A4C);

  static const Color surfaceContainerLowest = Color(0xFF010F1F);
  static const Color surfaceContainerLow = Color(0xFF0D1C2D);
  static const Color surfaceContainer = Color(0xFF122131);
  static const Color surfaceContainerHigh = Color(0xFF1C2B3C);
  static const Color surfaceContainerHighest = Color(0xFF273647);

  static const Color onSurface = Color(0xFFD4E4FA);
  static const Color onSurfaceVariant = Color(0xFFC2C6D6);
  static const Color inverseSurface = Color(0xFFD4E4FA);
  static const Color inverseOnSurface = Color(0xFF233143);

  static const Color outline = Color(0xFF8C909F);
  static const Color outlineVariant = Color(0xFF424754);
  static const Color surfaceTint = Color(0xFFADC6FF);

  static const Color primary = Color(0xFFADC6FF);
  static const Color onPrimary = Color(0xFF002E6A);
  static const Color primaryContainer = Color(0xFF4D8EFF);
  static const Color onPrimaryContainer = Color(0xFF00285D);
  static const Color inversePrimary = Color(0xFF005AC2);

  static const Color secondary = Color(0xFFBEC6E0);
  static const Color onSecondary = Color(0xFF283044);
  static const Color secondaryContainer = Color(0xFF3F465C);
  static const Color onSecondaryContainer = Color(0xFFADB4CE);

  static const Color tertiary = Color(0xFFBCC7DE);
  static const Color onTertiary = Color(0xFF263143);
  static const Color tertiaryContainer = Color(0xFF8691A7);
  static const Color onTertiaryContainer = Color(0xFF1F2A3C);

  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color primaryFixed = Color(0xFFD8E2FF);
  static const Color primaryFixedDim = Color(0xFFADC6FF);
  static const Color onPrimaryFixed = Color(0xFF001A42);
  static const Color onPrimaryFixedVariant = Color(0xFF004395);

  static const Color secondaryFixed = Color(0xFFDAE2FD);
  static const Color secondaryFixedDim = Color(0xFFBEC6E0);
  static const Color onSecondaryFixed = Color(0xFF131B2E);
  static const Color onSecondaryFixedVariant = Color(0xFF3F465C);

  static const Color tertiaryFixed = Color(0xFFD8E3FB);
  static const Color tertiaryFixedDim = Color(0xFFBCC7DE);
  static const Color onTertiaryFixed = Color(0xFF111C2D);
  static const Color onTertiaryFixedVariant = Color(0xFF3C475A);

  static const Color surfaceVariant = Color(0xFF273647);
  
  // Custom theme semantic colors (safety/success)
  static const Color success = Color(0xFF4ADE80);
  static const Color successContainer = Color(0xFF052E16);
  static const Color onSuccessContainer = Color(0xFF86EFAC);

  // Warning/Priority alerts
  static const Color warning = Color(0xFFFDBA74);
  static const Color warningContainer = Color(0xFF431407);
}

class AppTypography {
  // Inter font represents Geist family styling
  static TextStyle headlineLg = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -24 * 0.02,
    color: AppColors.onSurface,
  );

  static TextStyle headlineMd = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -20 * 0.01,
    color: AppColors.onSurface,
  );

  static TextStyle headlineSm = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.onSurfaceVariant,
  );

  // JetBrains Mono represents Code style parameters
  static TextStyle labelMd = GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 12 * 0.05,
    color: AppColors.onSurface,
  );

  static TextStyle labelSm = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 12 / 10,
    letterSpacing: 10 * 0.05,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle headlineLgMobile = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    color: AppColors.onSurface,
  );
}

class AppRadius {
  static const double sm = 2.0;
  static const double standard = 4.0;
  static const double md = 6.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  static const double full = 9999.0;
}

class AppSpacing {
  static const double unit = 4.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double gutter = 12.0;
  static const double marginMobile = 16.0;
}

ThemeData getDarkTheme() {
  final darkBase = ThemeData.dark();
  return darkBase.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.dark(
      background: AppColors.background,
      onBackground: AppColors.onBackground,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceVariant: AppColors.surfaceVariant,
      onSurfaceVariant: AppColors.onSurfaceVariant,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
    ),
    textTheme: darkBase.textTheme.copyWith(
      headlineLarge: AppTypography.headlineLg,
      headlineMedium: AppTypography.headlineMd,
      headlineSmall: AppTypography.headlineSm,
      bodyLarge: AppTypography.bodyLg,
      bodyMedium: AppTypography.bodyMd,
      bodySmall: AppTypography.bodySm,
      labelLarge: AppTypography.labelMd,
      labelSmall: AppTypography.labelSm,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.outlineVariant,
      thickness: 1.0,
      space: 1.0,
    ),
  );
}
