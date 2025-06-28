import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';




class CustomButton extends StatelessWidget {
  final double? width;
  final double height;
  final String? text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? child;

  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    this.elevation,
    this.borderRadius, this.borderColor, this.borderWidth, this.child, this.width,  this.height=44,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          elevation: elevation ?? 1,
          padding: padding,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(
                    24,
                  )),
          side: BorderSide(
            color: borderColor ?? AppColors.transparent,
            width: borderWidth ??1,
          ),
        ),
        child: child?? Text(
          text ?? '' ,
          style: textStyle ??
              CustomTextStyle.titleMedium(
                context,
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
