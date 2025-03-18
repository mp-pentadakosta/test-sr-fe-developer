import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum InputDecorationType { outline, underLine }

class IInputDecoration extends InputDecoration {
  const IInputDecoration({
    required super.hintText,
    required super.suffixIcon,
    // required Widget? prefixIcon,
    required super.border,
    required InputBorder? enableBorder,
    required super.suffixIconConstraints,
    required Color super.fillColor,
    required EdgeInsetsGeometry super.contentPadding,
    required super.hintStyle,
    required super.errorText,
  }) : super(
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: border,
          focusedBorder: border,
          counterText: '',
          // prefixIcon: prefixIcon,
          isDense: true,
          filled: true,
          // isCollapsed: true,
        );

  factory IInputDecoration.primary({
    required String? hintText,
    required String? errorText,
    required Widget? suffixIcon,
    required Widget? prefixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.elevationLevel(ElevationType.level15),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.elevationLevel(ElevationType.level15), width: 1),
        borderRadius: BorderRadius.circular(8.0),
      );
    }
    return IInputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: border,
      enableBorder: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      // prefixIcon: prefixIcon,
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
      hintStyle: const TextStyle(
        color: AppColors.backdrop,
      ),
    );
  }
}

class IInputDecorationSearch extends InputDecoration {
  const IInputDecorationSearch({
    required super.hintText,
    required super.suffixIcon,
    required super.border,
    required InputBorder? enableBorder,
    required super.suffixIconConstraints,
    required Color super.fillColor,
    required EdgeInsetsGeometry contentPadding,
    required super.errorText,
    required TextStyle hintStyle,
  }) : super(
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: enableBorder,
          errorBorder: border,
          focusedBorder: border,
          counterText: '',
          isDense: true,
          filled: true,
          hintStyle: hintStyle,
          contentPadding: contentPadding,
        );

  factory IInputDecorationSearch.search({
    required String? hintText,
    required String? errorText,
    required Widget? suffixIcon,
    BoxConstraints? suffixIconConstraints,
    required Color fillColor,
    double borderRadiusSize = 8.0,
    Color colorBorder = Colors.grey,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
  }) {
    InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(color: colorBorder, width: 1),
      borderRadius: BorderRadius.circular(borderRadiusSize),
    );
    if (inputDecorationType == InputDecorationType.underLine) {
      border = UnderlineInputBorder(
        borderSide: BorderSide(color: colorBorder, width: 1),
        borderRadius: BorderRadius.circular(borderRadiusSize),
      );
    }
    return IInputDecorationSearch(
      hintText: hintText,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      border: border,
      enableBorder: border,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIconConstraints: suffixIconConstraints,
      errorText: errorText,
      hintStyle: const TextStyle(
        color: AppColors.backdrop,
      ),
    );
  }
}
