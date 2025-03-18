import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

import '../../core/theme/app_colors.dart';

class ModelDropDownWidget {
  String key;
  String value;
  String label;

  ModelDropDownWidget({
    required this.key,
    required this.value,
    required this.label,
  });
}

class DropDownWidget extends StatefulWidget {
  final List<ModelDropDownWidget> listOption;
  final String? selected;
  final Function(String?)? onChange;
  final String label;
  final String? hint;

  const DropDownWidget({
    super.key,
    required this.listOption,
    this.selected,
    required this.onChange,
    required this.label,
    this.hint,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label,
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.backdrop,
                    ),
                  ),
                  Text(
                    '*',
                    style: context.labelLarge,
                  )
                ],
              ),
              SizedBox(height: context.padding0),
            ],
          ),
        DropdownButtonFormField<String>(
          value: widget.selected,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          hint: widget.hint != null ? Text(widget.hint!) : null,
          items: widget.listOption.map((ModelDropDownWidget value) {
            return DropdownMenuItem<String>(
              value: value.value,
              child: Text(value.label),
            );
          }).toList(),
          onChanged: widget.onChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.elevationLevel(ElevationType.level15),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ),
        SizedBox(height: context.padding1),
      ],
    );
  }
}
