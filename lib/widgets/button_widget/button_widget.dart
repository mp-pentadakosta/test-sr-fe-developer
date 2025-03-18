import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/theme/app_colors.dart';

class IButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget? icon;
  final ButtonStyle? style;
  final ButtonType type;

  const IButton.elevated({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.labelStyle,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.icon,
  })  : type = ButtonType.elevated,
        style = null;

  const IButton.outlined({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.labelStyle,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.icon,
  })  : type = ButtonType.outlined,
        backgroundColor = null,
        style = null;

  const IButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.labelStyle,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.icon,
  })  : type = ButtonType.text,
        backgroundColor = null,
        style = null;

  const IButton.filled({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.labelStyle,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.icon,
  })  : type = ButtonType.filled,
        style = null;

  const IButton.small({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.labelStyle,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 6.0,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    this.icon,
  })  : type = ButtonType.small,
        style = null;

  @override
  Widget build(BuildContext context) {
    final Widget content = isLoading
        ? const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: labelStyle ??
                    context.bodyMedium?.copyWith(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          );

    switch (type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
            disabledBackgroundColor: backgroundColor?.withAlpha(30) ??
                AppColors.primary.withAlpha(50),
            padding: padding,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: content,
        );

      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(color: textColor ?? AppColors.primary),
          ),
          child: content,
        );

      case ButtonType.text:
        return TextButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: content,
        );

      case ButtonType.filled:
        return FilledButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
            padding: padding,
            minimumSize: const Size(64, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: content,
        );

      case ButtonType.small:
        return ElevatedButton(
          onPressed: isDisabled || isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
            padding: padding,
            minimumSize: const Size(50, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: content,
        );
    }
  }
}

enum ButtonType { elevated, outlined, text, filled, small }
