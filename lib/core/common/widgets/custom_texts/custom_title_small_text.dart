import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';
class CustomTitleSmallText extends StatelessWidget {
  final String text;
  final Color?  color;
  final FontWeight? fontWeight;
  const CustomTitleSmallText({super.key, required this.text, this.color, this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text( text,
      maxLines: 3,
      softWrap: true,
      style: CustomTextStyle.titleSmall(
        context,
        color: color??AppColors.black,
        fontWeight: fontWeight??FontWeight.bold,
      ),
    );
  }
}
