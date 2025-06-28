import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';



class ReadOnlyTextField extends StatelessWidget {
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? colorBorder;

  const ReadOnlyTextField({
    super.key,
    required this.text,
    this.width,
    this.color,
    this.textColor,
    this.colorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: const EdgeInsets.all(16), //16
    //  margin: const EdgeInsets.all(16), //16
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        border: Border.all(color: colorBorder ?? AppColors.transparent),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text!,
        style: TextStyle(
          color: textColor ?? AppColors.mainGray,
        ),
      ),
    );
  }
}
