import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';

InputDecoration customInputDecoration =InputDecoration(
  hintText: '',
  fillColor: AppColors.primaryGray,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(24),
  ),
  errorStyle: const TextStyle(color: Colors.red, height: 1),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide.none
  ),
);

