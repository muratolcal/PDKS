import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  static const int maxLength = 11;

  final BuildContext context;

  PhoneInputFormatter(this.context);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digits from the new value
    String text = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    // If the length is greater than the maximum allowed, trim it
    if (text.length > maxLength) {
      text = text.substring(0, maxLength);
    }
    if (text.isNotEmpty && text[0] != '0') {
      // CustomSnackBar(
      //   context,
      //   "Telefon Numarası 0 ile başlamalıdır.",
      //   type: false,
      // );
      return oldValue;
    }
    if (text.length > 1 && text[1] != '5') {
      // CustomSnackBar(
      //   context,
      //   "Telefon Numarası 05 ile başlamalıdır.",
      //   type: false,
      // );
      return oldValue;
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
