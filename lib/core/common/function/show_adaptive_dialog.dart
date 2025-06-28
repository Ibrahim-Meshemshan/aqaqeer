import 'package:flutter/material.dart';
import '../config/theme/src/styles.dart';

void showAdaptiveAlertDialog({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  Widget? content,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      title: Text(
        title,
        style: CustomTextStyle.titleLarge(
          context,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      actions: actions,
      content: content,
    ),
  );
}
