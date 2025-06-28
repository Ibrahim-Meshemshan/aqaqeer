import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../function/get_width_height_screen.dart';

class CustomRadioButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final int value;
  final int groupValue;
  final void Function(int)? onChanged;
  final double? width;

  const CustomRadioButton(
      {super.key,
      required this.text,
      this.icon,
      required this.value,
      required this.groupValue,
      this.onChanged,
      this.width});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = widget.value != widget.groupValue;
        if (selected) {
          widget.onChanged!(widget.value);
        }
      },
      child: Container(
        width: widget.width ?? getWidthScreen(context) / 2.9,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
            color: widget.value == widget.groupValue
                ? AppColors.primaryColor
                : AppColors.primaryGray,
            borderRadius: BorderRadius.circular(16),
            // shape: BoxShape.circle,
            border: Border.all(
                color: widget.value == widget.groupValue
                    ? AppColors.primaryColor
                    : AppColors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: widget.icon != null,
              child: Icon(widget.icon,
                  color: widget.value == widget.groupValue
                      ? AppColors.white
                      : AppColors.black),
            ),
            Visibility(
              visible: widget.icon != null,
              child: const SizedBox(
                width: 5,
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontFamily: "Almarai",
                  color: widget.value == widget.groupValue
                      ? AppColors.white
                      : AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
//
// class SelectGenderWidget extends StatefulWidget {
//   const SelectGenderWidget({super.key});
//
//   @override
//   State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
// }
//
// class _SelectGenderWidgetState extends State<SelectGenderWidget> {
//
//   int _selectedGender = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> genderList = [
//       {'text': ('female').tr(context), 'icon': Icons.female, 'value': 0},
//       {'text': ('male').tr(context), 'icon': Icons.male, 'value': 1},
//     ];
//     return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: genderList
//               .map((gender) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     // Horizontal padding for spacing in Row
//                     child: CustomRadioButton(
//                       text: gender['text'],
//                       icon: gender['icon'],
//                       value: gender['value'],
//                       groupValue: _selectedGender,
//                       onChanged: (int? value) {
//                         setState(() {
//                           _selectedGender = value!;
//                         });
//                       },
//                     ),
//                   ))
//               .toList(),
//         );
//   }
// }

//