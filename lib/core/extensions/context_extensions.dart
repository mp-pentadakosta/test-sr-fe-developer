import 'package:flutter/material.dart';

import '../shared/constant.dart';
import '../theme/app_colors.dart';

extension ISizeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  //=========== Typography =============
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  //======= Size =========
  MediaQueryData get iMediaQuery => MediaQuery.of(this);

  Size get iSize => MediaQuery.of(this).size;

  EdgeInsets get iPadding => MediaQuery.of(this).padding;

  double get padding0 => IConstant.padding / 2;

  double get padding1 => IConstant.padding * 1;

  double get padding2 => IConstant.padding * 2;

  double get padding3 => IConstant.padding * 3;

  double get padding4 => IConstant.padding * 4;

  double get padding5 => IConstant.padding * 5;

  double get padding6 => IConstant.padding * 6;

  double get padding7 => IConstant.padding * 7;

  double get padding8 => IConstant.padding * 8;

  double get padding9 => IConstant.padding * 9;

  double get padding10 => IConstant.padding * 10;

  double mQWidth(double number) => iSize.width * number;

  double mQHeight(double number) => iSize.height * number;

  double get deviceWidth => MediaQuery.of(this).size.shortestSide;

  bool get isTablet =>
      deviceWidth > 600 &&
      MediaQuery.of(this).orientation != Orientation.portrait;

  bool get isMobile => deviceWidth <= 600;

  Widget sbHeight(double? size) {
    return SizedBox(height: size ?? padding2);
  }

  Widget sbWidth(double? size) {
    return SizedBox(width: size ?? padding2);
  }

  Future<dynamic> goWithCallBack(Widget widget) async {
    return await Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  void successSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void errorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }
}
