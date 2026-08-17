import 'package:evently/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightMain,
        secondary: AppColors.lightMain,
        surface: AppColors.lightInputs,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSurface: AppColors.disable,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.lightMainText),
        bodyMedium: TextStyle(color: AppColors.lightSecText),
        titleLarge: TextStyle(color: AppColors.lightMainText),
      ),
      dividerColor: AppColors.lightStroke,
      disabledColor: AppColors.disable,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightInputs,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightStroke),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkMain,
        secondary: AppColors.darkMain,
        surface: AppColors.darkInputs,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSurface: AppColors.darkMainText,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkMainText),
        bodyMedium: TextStyle(color: AppColors.darkSecText),
        titleLarge: TextStyle(color: AppColors.darkMainText),
      ),
      dividerColor: AppColors.darkStroke,
      disabledColor: AppColors.disable,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputs,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkStroke),
        ),
      ),
    );
  }
}
