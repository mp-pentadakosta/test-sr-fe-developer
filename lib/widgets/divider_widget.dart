import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  final double? thickness;
  const DividerWidget({super.key, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.background,
      thickness: thickness ?? 10,
      height: thickness ?? 10,
    );
  }
}
