import 'package:flutter/material.dart';

import 'app_colors.dart';

class IInputDecorationTheme {
  static InputDecorationTheme primary() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.elevationLevel(ElevationType.level5), width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      suffixIconColor: AppColors.elevationLevel(ElevationType.level8),
      prefixIconColor: AppColors.elevationLevel(ElevationType.level8),
      iconColor: AppColors.elevationLevel(ElevationType.level8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    );
  }
}
