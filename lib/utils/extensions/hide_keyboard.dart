import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension KeyboardUtils on BuildContext {
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
