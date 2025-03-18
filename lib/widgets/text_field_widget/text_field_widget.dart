import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/extensions/context_extensions.dart';

import '../../core/theme/app_colors.dart';
import 'date_picker.dart';
import 'input_decoration.dart';
import 'text_input_formater.dart';

class ITextField extends StatelessWidget {
  final String label;
  final String note;
  final TextStyle? labelStyle;
  final bool fieldRequired;
  final Widget Function(BuildContext context) textFieldBuilder;

  const ITextField({
    super.key,
    required this.label,
    this.note = '',
    this.labelStyle,
    this.fieldRequired = false,
    required this.textFieldBuilder,
  });

  factory ITextField._template(
      {Key? key,
      required String label,
      String note = '',
      VoidCallback? onTap,
      TextInputType? keyboardType,
      bool autofocus = false,
      bool readOnly = false,
      String? Function(String?)? validator,
      TextInputAction? textInputAction,
      required TextEditingController? controller,
      int? maxLine = 1,
      int? maxLength,
      TextCapitalization textCapitalization = TextCapitalization.words,
      InputDecorationType inputDecorationType = InputDecorationType.outline,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      TextStyle? labelStyle,
      List<TextInputFormatter>? inputFormatters,
      TextAlign textAlign = TextAlign.start,
      InputDecoration? decoration,
      TextStyle? style,
      bool fieldRequired = false,
      bool obscureText = false}) {
    return ITextField(
      key: key,
      label: label,
      note: note,
      labelStyle: labelStyle,
      fieldRequired: fieldRequired,
      textFieldBuilder: (BuildContext context) {
        return TextFormField(
          textAlign: textAlign,
          readOnly: readOnly,
          cursorHeight: 23,
          autofocus: autofocus,
          decoration: decoration,
          inputFormatters: inputFormatters ??
              [
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|'
                    r'\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
                  ),
                )
              ],
          style: style ?? context.bodyMedium,
          key: key,
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: (value) {
            if (value.endsWith('  ')) {
              var data = value.substring(0, value.length - 1);
              controller?.text = data;
              controller?.selection =
                  TextSelection.collapsed(offset: data.length);
            }
            if (onChanged != null) {
              onChanged(value);
            }
          },
          maxLines: maxLine,
          maxLength: maxLength,
          autocorrect: true,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }

  factory ITextField.primary({
    Key? key,
    required String label,
    String note = '',
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    int? maxLine = 1,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.words,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
  }) {
    return ITextField._template(
      inputFormatters: inputFormatters,
      key: key,
      label: label,
      note: note,
      onTap: onTap,
      obscureText: false,
      maxLine: maxLine,
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputDecorationType: inputDecorationType,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        inputDecorationType: inputDecorationType,
        fillColor: onTap != null
            ? AppColors.elevationLevel(ElevationType.level0)
            : readOnly
                ? AppColors.elevationLevel(ElevationType.level0)
                : AppColors.elevationLevel(ElevationType.level0),
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  factory ITextField.password({
    Key? key,
    required String label,
    String note = '',
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    TextInputType? textInputType,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    required bool obscureText,
    Function(String value)? onChanged,
    int? maxLine = 1,
    int? maxLength,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? errorText,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      onTap: onTap,
      onChanged: onChanged,
      maxLine: maxLine,
      obscureText: obscureText,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      autofocus: autofocus,
      readOnly: readOnly,
      inputDecorationType: inputDecorationType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: onTap != null
            ? AppColors.elevationLevel(ElevationType.level0)
            : readOnly
                ? AppColors.elevationLevel(ElevationType.level0)
                : AppColors.elevationLevel(ElevationType.level0),
        prefixIcon: prefixIcon ?? const Icon(Icons.lock),
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  factory ITextField.currency({
    TextAlign textAlign = TextAlign.start,
    Key? key,
    required String label,
    String note = '',
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Function(String value)? onChanged,
    TextStyle? labelStyle,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    int? maxLine = 1,
    int? maxLength,
    TextAlignVertical? textAlignVertical,
    String? errorText,
  }) {
    return ITextField._template(
      textAlign: textAlign,
      key: key,
      label: label,
      note: note,
      maxLine: maxLine,
      onTap: onTap,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: false,
      onChanged: onChanged,
      inputDecorationType: inputDecorationType,
      textCapitalization: textCapitalization,
      decoration: IInputDecoration.primary(
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: onTap != null
            ? AppColors.elevationLevel(ElevationType.level0)
            : readOnly
                ? AppColors.elevationLevel(ElevationType.level0)
                : AppColors.elevationLevel(ElevationType.level0),
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: required,
      inputFormatters: const [
        // CurrencyTextInputFormatter(
        //   decimalDigits: 0,
        //   locale: 'id_ID',
        //   name: '',
        //   symbol: 'Rp',
        // )
      ],
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  factory ITextField.dateTime({
    Key? key,
    required String label,
    String note = '',
    bool autofocus = false,
    String? Function(String?)? validator,
    bool required = false,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.words,
    Function(String value)? onChanged,
    required Function(DateTime? dateTime) onSubmitted,
    required BuildContext context,
    TextStyle? labelStyle,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? hinText,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      maxLine: null,
      obscureText: false,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      inputDecorationType: inputDecorationType,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      inputFormatters: [
        ITextInputFormatter(),
      ],
      decoration: IInputDecoration.primary(
        hintText: hinText,
        suffixIcon: suffixIcon ??
            InkWell(
              onTap: () {
                IShowDatePicker.dateOfBirth(context,
                        initialEntryMode: DatePickerEntryMode.calendarOnly)
                    .then((value) {
                  onSubmitted(value);
                });
              },
              child: const Icon(Icons.calendar_today),
            ),
        fillColor: AppColors.elevationLevel(ElevationType.level0),
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      fieldRequired: required,
      // style: IBody.regular(color: IColorTheme.neutral100),
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: 10,
      onTap: null,
      readOnly: true,
    );
  }

  factory ITextField.search({
    Key? key,
    String label = '',
    String note = '',
    VoidCallback? onTap,
    bool autofocus = false,
    bool readOnly = false,
    String? Function(String?)? validator,
    bool fieldRequired = false,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    TextInputType? textInputType,
    required TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool obscureText = false,
    Function(String value)? onChanged,
    int? maxLine = 1,
    int? maxLength,
    TextStyle? labelStyle,
    List<TextInputFormatter>? inputFormatters,
    double borderRadiusSize = 8.0,
    Color colorBorder = Colors.grey,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    String? errorText,
  }) {
    return ITextField._template(
      key: key,
      label: label,
      note: note,
      onTap: onTap,
      onChanged: onChanged,
      maxLine: maxLine,
      obscureText: obscureText,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      autofocus: autofocus,
      readOnly: readOnly,
      inputDecorationType: inputDecorationType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: IInputDecorationSearch.search(
        borderRadiusSize: borderRadiusSize,
        colorBorder: colorBorder,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: onTap != null
            ? AppColors.elevationLevel(ElevationType.level0)
            : readOnly
                ? AppColors.elevationLevel(ElevationType.level0)
                : AppColors.elevationLevel(ElevationType.level0),
        errorText: errorText,
      ),
      fieldRequired: fieldRequired,
      validator: validator,
      textInputAction: textInputAction,
      controller: controller,
      labelStyle: labelStyle,
      maxLength: maxLength,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        context.sbHeight(context.padding0),
        textFieldBuilder(context),
        context.sbHeight(context.padding1),
        _note(context)
      ],
    );
  }

  Widget _label(BuildContext context) {
    return label.isEmpty
        ? const SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: labelStyle ??
                    context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.backdrop,
                    ),
              ),
              fieldRequired
                  ? Text(
                      '*',
                      style: context.labelLarge,
                    )
                  : const SizedBox()
            ],
          );
  }

  Widget _note(BuildContext context) {
    return note.isEmpty
        ? const SizedBox()
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Note: ', style: context.bodySmall),
              Expanded(
                child: Text(note, style: context.bodySmall),
              )
            ],
          );
  }
}
