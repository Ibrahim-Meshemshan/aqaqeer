import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../config/theme/src/colors.dart';
import '../text_field/custom_text_field.dart';

class CustomTimeSelector extends StatefulWidget {
  final TimeOfDay? initialTime;
  final Function(TimeOfDay) onTimeSelected;
  final String timeFormat; // Added format option
  final TextEditingController? controller;
  final String? label;
  final Widget? suffixIcon;
  final bool? withSuffixIcon;
  final InputBorder? inputBorder;
  final TextStyle? textStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final Color? filledColor;
  final String? hint;
  const CustomTimeSelector({
    super.key,
    this.initialTime,
    required this.onTimeSelected,
    this.timeFormat = 'hh:mm a',
    this.controller,
    this.label,
    this.suffixIcon,
    this.withSuffixIcon = true,
    this.inputBorder,
    this.textStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.errorBorder,
    this.filledColor,
    this.hint
  });

  @override
  State<CustomTimeSelector> createState() => _CustomTimeSelectorState();
}

class _CustomTimeSelectorState extends State<CustomTimeSelector> {
  TimeOfDay? selectedTime;
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
    if (selectedTime != null) {
      timeController.text = _formatTime(selectedTime!);
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime = DateFormat(widget.timeFormat).format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async {
        final pickedTime = await showTimePicker(
          builder: (context, child) =>
              Theme(
                  data: ThemeData(
                    colorScheme: const ColorScheme.light().copyWith(
                      primary: AppColors.primaryColor,
                      secondary: AppColors.primaryColor,
                      surfaceTint: AppColors.white,
                      primaryContainer: AppColors.primaryColor,
                      tertiaryContainer: AppColors.secondaryColor),

                    textTheme: TextTheme(
                      bodyLarge: TextStyle(fontFamily: "Almarai"),
                      titleSmall:  TextStyle(fontFamily: "Almarai"),
                      labelLarge: TextStyle(fontFamily: "Almarai"),

                       titleMedium: TextStyle(fontFamily: "Almarai"),
                       displayMedium: TextStyle(fontFamily: "Almarai"),
                       labelSmall: TextStyle(fontFamily: "Almarai"),
                       displaySmall: TextStyle(fontFamily: "Almarai"),
                       bodySmall: TextStyle(fontFamily: "Almarai"),
                       // ضروري
                      bodyMedium: TextStyle(fontFamily: "Almarai"),
                      headlineMedium: TextStyle(fontFamily: "Almarai"),
                      titleLarge:  TextStyle(fontFamily: "Almarai"),
                      displayLarge: TextStyle(fontFamily: "Almarai"),
                      headlineLarge: TextStyle(fontFamily: "Almarai"),

                    ),
                  ),

                  child: child!
              ),
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.dial,
        );
        if (pickedTime != null) {
          setState(() {
            selectedTime = pickedTime;
            timeController.text = _formatTime(selectedTime!);}
          );
            widget.onTimeSelected(pickedTime);}
      },
      child: CustomTextField(
        controller: widget.controller?? timeController,
        label: widget.label,
        enabled: false,
        hintText: widget.hint,
      //  hintStyle:  TextStyle(color: AppColors.primaryGrey2,fontSize: 14),
        filledColor:widget.filledColor,
        textStyle: widget.textStyle,
        suffixIcon: widget.withSuffixIcon == true?
            widget.suffixIcon?? Icon(Icons.access_time_rounded,color: AppColors.primaryColor,):null,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        inputBorder:  widget.inputBorder,
        disabledBorder:  widget.disabledBorder,
        errorBorder: widget.errorBorder,
      ),
    );
  }
}
