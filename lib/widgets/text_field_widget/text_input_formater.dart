import 'package:flutter/services.dart';

class ITextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = newValue.text;
    final String textOld = oldValue.text;
    final int textLength = text.length;
    final StringBuffer buffer = StringBuffer();

    // ##-##-####
    if (textLength == 2 && textOld.length < textLength) {
      buffer.write('$text-');
    } else if (textLength == 3 && textOld.length == 2) {
      if (text.substring(3) != '-') {
        buffer.write('${text.substring(0, 2)}-${text.substring(2, 3)}');
      }
    } else if (textLength == 6 && textOld.length == 5) {
      if (text.substring(6) != '-') {
        buffer.write('${text.substring(0, 5)}-${text.substring(5, 6)}');
      }
    } else if (textLength == 5 && textOld.length < textLength) {
      buffer.write('$text-');
    } else {
      buffer.write(text);
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.fromPosition(
          TextPosition(offset: buffer.toString().length)),
    );
  }
}
