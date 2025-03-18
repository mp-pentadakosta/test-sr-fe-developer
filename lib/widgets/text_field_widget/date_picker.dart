import 'package:flutter/material.dart';

class IShowDatePicker {
  static Future<DateTime?> dateOfBirth(BuildContext context,
      {DatePickerEntryMode initialEntryMode =
          DatePickerEntryMode.calendar}) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 150),
        lastDate: DateTime.now(),
        initialEntryMode: initialEntryMode);
  }
}
