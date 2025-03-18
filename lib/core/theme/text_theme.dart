import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextThemeData {
  static TextTheme textThemeMaterial3() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 30,
        // height: 2.6,
        color: AppColors.backdrop,
      ),
      headlineMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        // height: 3.2,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      headlineSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        // height: 1.6,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        // height: 1.6,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        // height: 1.6,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        // height: 1.6,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        // height: 32,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelSmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      bodyLarge: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        // height: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      bodyMedium: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        // height: 16,
        color: AppColors.backdrop,
      ),
      bodySmall: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        // height: 16,
        color: AppColors.backdrop,
      ),
    );
  }
}
