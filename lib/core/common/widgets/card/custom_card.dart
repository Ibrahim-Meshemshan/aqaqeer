import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';




class CustomCard extends StatelessWidget {
  final Color cardColor;
  final double marginTop;

  final double marginBottom;

  final double marginRight;

  final double marginLeft;

  final double paddingTop;

  final double paddingBottom;

  final double paddingRight;

  final double paddingLeft;

  final Widget child;

  final double borderRadius;

  final double? height;
  final int delay;
  final int duration;

  final double? width;
  final Color shadowColor;
  final double widthBorder;
  final Color colorBorder;
  final Gradient? gradient;

  const CustomCard({
    this.cardColor = AppColors.white,
    this.marginTop = 10,
    this.marginBottom = 10,
    this.marginLeft = 10,
    this.marginRight = 10,
    required this.child,
    this.borderRadius = 40,
    this.height,
    this.width,
    this.paddingTop = 10,
    this.paddingBottom = 10,
    this.paddingLeft = 10,
    this.paddingRight = 10,
    this.delay = 200,
    this.duration = 800,
    this.shadowColor = AppColors.gray,
    this.widthBorder = 1,
    this.colorBorder = AppColors.white,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        left: marginLeft,
        bottom: marginBottom,
      ),
      decoration: BoxDecoration(
        gradient: gradient,
        border: Border.all(
          color: colorBorder, // Border color
          width: widthBorder, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            // لون الظل
            offset: const Offset(
              0,
              1,
            ),
            blurRadius: 2,
          ),
        ],
        color: cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius,
          ),
        ),
      ),
      child: child,
    );
  }
}
