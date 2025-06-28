import 'package:flutter/material.dart';

import '../../config/theme/src/styles.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  TextAlign? textAlign;
  int? maxLines;
  final TextStyle? style;
  final bool? softWrap;

  CustomText({
    super.key,
    required this.text,
    this.softWrap,
    this.fontSize,
    this.style,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines ?? 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
