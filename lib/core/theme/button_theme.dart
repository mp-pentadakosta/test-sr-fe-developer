import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

class IButtonTheme {
  static ElevatedButtonThemeData elevatedThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          disabledBackgroundColor:
              AppColors.elevationLevel(ElevationType.level5),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          textStyle: TextThemeData.textThemeMaterial3().labelMedium,
          minimumSize: const Size(double.minPositive, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    );
  }

  static OutlinedButtonThemeData outlinedTHemeData() {
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
              elevation: 0,
              textStyle: TextThemeData.textThemeMaterial3().labelMedium,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              minimumSize: const Size(double.minPositive, 64),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)))
          .copyWith(side: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return const BorderSide(color: AppColors.secondary);
          }
          return const BorderSide(color: AppColors.primary);
        },
      )),
    );
  }

  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: TextThemeData.textThemeMaterial3().labelMedium,
        foregroundColor: AppColors.primary,
        minimumSize: const Size(double.minPositive, 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}
