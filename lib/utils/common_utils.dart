import 'package:flutter/material.dart';

class CommonUtils {
  CommonUtils._();

  ///function to hide the keyboard
  static void keyboardHide(BuildContext context) {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
