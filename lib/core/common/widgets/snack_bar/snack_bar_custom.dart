import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required IconData icon,
  Color borderColor = AppColors.primaryColor,
  Color iconColor = AppColors.primaryColor,
  DismissDirection? dismissDirection,
  EdgeInsetsGeometry? margin,
  Duration? duration,
}) {
  final snackBar = SnackBar(
    duration: duration?? const Duration(milliseconds: 4000),
    backgroundColor: AppColors.white,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: margin,
    dismissDirection: dismissDirection ?? DismissDirection.down,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.all(15),
    content: Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            message,
            style: CustomTextStyle.bodyLarge(
              context,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
