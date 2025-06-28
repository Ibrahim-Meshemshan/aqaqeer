import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';
class CustomBodySmallText extends StatelessWidget {
  final String text;
  final Color?  color;
  final FontWeight? fontWeight;
  const CustomBodySmallText({super.key, required this.text, this.color, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: CustomTextStyle.bodySmall(
        context,
        color: color??AppColors.black,
        fontWeight: fontWeight??FontWeight.bold,
      ),
    );
  }
}