
import 'package:flutter/material.dart';
import 'logout_dialog_body.dart';


class LogoutDialog {
  static Future<void> show(BuildContext context) {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return LogoutDialogBody();
      },
    );
  }
}
