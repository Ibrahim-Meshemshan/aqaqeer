import 'package:flutter/material.dart';
import '../../../config/theme/src/colors.dart';
class CustomBorders {
  static final authBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.hintTextColor,
    ),
  );
  static final whiteBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.white,
    ),
  );
  static final focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.lightPurple,
    ),
  );
  static final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.mainRed,
    ),
  );
  static final profileBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.lightPurple,
    ),
  );
  static final secondaryGreenBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.secondaryGreen,
    ),
  );
  static final chartGrayBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: AppColors.chartGray,
    ),
  );
}