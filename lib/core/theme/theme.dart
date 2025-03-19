import 'package:usv_hub_management/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 3 * AppTextSize.kTextSizeUnit,
        fontWeight: FontWeight.w300,
        color: AppColors.white,
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryFixed: AppColors.primaryFixed,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      tertiaryContainer: AppColors.tertiaryContainer,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondaryContainer: AppColors.secondaryContainer,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
    ),
    textTheme: darkTextTheme(),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(8.0),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primary.withValues(alpha: 0.5);
            }
            return AppColors.primary;
          },
        ),
        iconColor: WidgetStateProperty.all<Color>(
          AppColors.white,
        ),
      ),
    ),
  );
}

//darkTextTheme
TextTheme darkTextTheme() {
  return TextTheme(
    titleLarge: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 5 * AppTextSize.kTextSizeUnit,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
    titleMedium: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 4 * AppTextSize.kTextSizeUnit,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
    titleSmall: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 3 * AppTextSize.kTextSizeUnit,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
    bodyLarge: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 2 * AppTextSize.kTextSizeUnit,
        color: AppColors.white,
      ),
    ),
    bodyMedium: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 1.5 * AppTextSize.kTextSizeUnit,
        color: AppColors.white,
      ),
    ),
    bodySmall: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 1.25 * AppTextSize.kTextSizeUnit,
        color: AppColors.white,
      ),
    ),
    labelLarge: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 1 * AppTextSize.kTextSizeUnit,
        color: AppColors.grey,
      ),
    ),
    labelMedium: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 0.75 * AppTextSize.kTextSizeUnit,
        color: AppColors.grey,
      ),
    ),
    labelSmall: GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 0.5 * AppTextSize.kTextSizeUnit,
        color: AppColors.grey,
      ),
    ),
  );
}
