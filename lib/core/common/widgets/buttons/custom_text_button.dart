import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double fontSize;
  final double height;
  final double width;

  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.color = AppColors.primaryColor,
    this.colorText = AppColors.black,
    this.fontSize = 25,
    this.height = 50,
    this.width = 200,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(35)),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyle.titleMedium(
              context,
              color: colorText,
              fontWeight: FontWeight.bold,
            )!.copyWith(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
