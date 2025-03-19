import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class TextThemeData {
  static TextTheme textThemeMaterial3() {
    return TextTheme(
      headlineLarge: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 30,
        color: AppColors.backdrop,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleLarge: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleMedium: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      titleSmall: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelLarge: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelMedium: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      labelSmall: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.5,
        color: AppColors.backdrop,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.backdrop,
      ),
      bodySmall: GoogleFonts.nunito(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppColors.backdrop,
      ),
    );
  }
}
