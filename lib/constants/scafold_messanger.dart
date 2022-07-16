// by flutter
import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(
      {required String message,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
    ));
  }

  void showAdvanceSnackBar(
      {required String message,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black,
      Color actionTextColor = Colors.black,
      required VoidCallback onPressed,
      required String label}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          textColor: actionTextColor, label: label, onPressed: onPressed),
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
