import 'package:aqaqeer/core/common/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/theme/src/colors.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final String? text;
  final DateTime? datePickerSelected;
  final Function(DateTime dateTime) onSelected;
  final bool? isSelected;
  final OutlinedBorder? shape;
  final void Function()? onPrefixIconPressed;
  final void Function()? onSuffixIconPressed;
  final InputBorder? focusedBorder;
  final Color? filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String dateFormat;

  const CustomDatePicker({
    super.key,
    this.shape,
    this.text,
    this.onPrefixIconPressed,
    this.onSuffixIconPressed,
    this.initialDate,
    this.lastDate,
    this.firstDate,
    this.datePickerSelected,
    required this.onSelected,
    this.isSelected,
    this.focusedBorder,
    this.filledColor,
    this.suffixIcon,
    this.prefixIcon,
    this.dateFormat = 'dd/MM/yyyy',
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      cursorColor: AppColors.lightPurple,
      onTap: () async {
        final DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: datePickerSelected,
          firstDate: firstDate ?? DateTime(2020),
          lastDate: lastDate ?? DateTime.now(),
          builder:
              (context, child) => Theme(
                data: ThemeData(
                  colorScheme: const ColorScheme.light().copyWith(
                    primary: AppColors.primaryColor,
                    secondary: AppColors.primaryColor,
                    surfaceTint: AppColors.white,
                  ),
                ),
                child: child!,
              ),
        );
        if (newDate == null) return;
        onSelected(newDate);
      },
      suffixIcon:
          suffixIcon ??
          IconButton(
            onPressed: onSuffixIconPressed,
            icon: const Icon(
              Icons.cancel_outlined,
              size: 18,
              color: AppColors.gray,
            ),
          ),
      readOnly: true,
      controller: TextEditingController(
        text:
            datePickerSelected == null
                ? ""
                : DateFormat(dateFormat).format(datePickerSelected!),
      ),
      enabled: true,
      filledColor: filledColor ?? AppColors.primaryGray,
      textStyle: const TextStyle(color: AppColors.black),
      focusedBorder:
          focusedBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(24),
          ),
      prefixIcon:
          prefixIcon ??
          IconButton(
            onPressed: onPrefixIconPressed,
            icon: const Icon(Icons.arrow_back, size: 18, color: AppColors.gray),
          ),
    );
  }
}
