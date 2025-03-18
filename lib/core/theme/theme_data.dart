import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'button_theme.dart';
import 'input_decoration_theme.dart';
import 'text_theme.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.secondaryContainer,
  disabledColor: AppColors.secondary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.elevationLevel(ElevationType.level0),
    foregroundColor: AppColors.secondary,
    titleTextStyle: const TextStyle(
      color: AppColors.secondary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.secondary,
      size: 24,
    ),
  ),
  textTheme: TextThemeData.textThemeMaterial3(),
  elevatedButtonTheme: IButtonTheme.elevatedThemeData(),
  outlinedButtonTheme: IButtonTheme.outlinedTHemeData(),
  textButtonTheme: IButtonTheme.textButtonThemeData(),
  inputDecorationTheme: IInputDecorationTheme.primary(),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  iconTheme: IconThemeData(
    color: AppColors.elevationLevel(ElevationType.level15),
    size: 24,
  ),
);
