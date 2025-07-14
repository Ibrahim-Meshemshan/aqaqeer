// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:aqaqeer/core/common/widgets/icons/required_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../feature/auth/presentation/sign_up/presentation/state/sign_up_provider.dart';
import '../../../injection/injection.dart';
import '../../../l10n/localizations/app_localizationsNew.dart';
import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';
import '../../constant/lists.dart';
import '../dropdown/custom_drop_down.dart';
import '../my_custom_widgets/customs_decoration/custom_borders.dart';

class DropdownDatePicker extends StatefulWidget {
  final Function(String day, String month, String year) onDateSelected;

  DropdownDatePicker({super.key, required this.onDateSelected});

  @override
  DropdownDatePickerState createState() => DropdownDatePickerState();
}

class DropdownDatePickerState extends State<DropdownDatePicker> {
  DateTime currentDate = DateTime.now();
  // SignUpProvider provider = locator.get<SignUpProvider>();
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  @override
  void initState() {
    super.initState();
    // List<String> dateParts = splitDate(currentDate);
    // selectedDay = provider.date?.split('-')[0];
    // selectedMonth = provider.date?.split('-')[1];
    // selectedYear = provider.date?.split('-')[2];
  }

  void _notifyParent() {
    widget.onDateSelected(
      selectedDay ?? '',
      selectedMonth ?? '',
      selectedYear ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomDropDown<String>(
            label: localization.day,
            fillColor: AppColors.white,
            enabledBorder: CustomBorders.authBorder,
            focusedBorder: CustomBorders.focusBorder,
            errorBorder: CustomBorders.errorBorder,
            disabledBorder: CustomBorders.authBorder,
            focusedErrorBorder: CustomBorders.errorBorder,
            backgroundColor: AppColors.white,
            itemAsString: (txt) => txt,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return localization.field_required;
              }
              return null;
            },
            list: (_, __) {
              if (int.tryParse(selectedMonth ?? '') == DateTime.now().month &&
                  int.tryParse(selectedYear ?? '') == DateTime.now().year) {
                return days
                    .where((day) => int.parse(day) <= DateTime.now().day)
                    .toList();
              }
              return days;
            },
            onChange: (value) {
              setState(() {
                selectedDay = value!;
                _notifyParent();
              });
            },
            selectedItem: selectedDay,
            hint: localization.day,
            hintStyle: CustomTextStyle.titleMedium(context),
            enabled: true,
          ),
        ),

        Expanded(
          child: CustomDropDown<String>(
            label: localization.month,
            fillColor: AppColors.white,
            enabledBorder: CustomBorders.authBorder,
            focusedBorder: CustomBorders.focusBorder,
            errorBorder: CustomBorders.errorBorder,
            disabledBorder: CustomBorders.authBorder,
            focusedErrorBorder: CustomBorders.errorBorder,
            backgroundColor: AppColors.white,
            itemAsString: (txt) => txt,
            list: (_, __) {
              if (int.tryParse(selectedYear ?? '') == DateTime.now().year) {
                return monthsAsNumber
                    .where(
                      (month) => int.parse(month) <= DateTime.now().month,
                    )
                    .toList();
              }
              return monthsAsNumber;
            },
            onChange: (value) {
              setState(() {
                selectedMonth = value!;
                _notifyParent();
              });
            },
            selectedItem: selectedMonth,
            enabled: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.field_required;
              }
              return null;
            },
            hint: localization.month,
            hintStyle: CustomTextStyle.titleMedium(
              fontSize: 12,
              context,
              color: AppColors.chartGray,
            ),
          ),
        ),

        Expanded(
          child: CustomDropDown<String>(
            label: localization.year,
            fillColor: AppColors.white,
            enabledBorder: CustomBorders.authBorder,
            focusedBorder: CustomBorders.focusBorder,
            errorBorder: CustomBorders.errorBorder,
            disabledBorder: CustomBorders.authBorder,
            focusedErrorBorder: CustomBorders.errorBorder,
            backgroundColor: AppColors.white,

            itemAsString: (txt) => txt,
            list: (_, __) => years,
            onChange: (value) {
              setState(() {
                selectedYear = value!;
                _notifyParent();
              });
            },
            selectedItem: selectedYear,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.field_required;
              }
              return null;
            },
            hint: localization.year,

            hintStyle: CustomTextStyle.titleMedium(context)
          ),
        ),
      ],
    );
  }
}

List<String> splitDate(DateTime dateTime) {

  // Format the current date
  String formattedDate = DateFormat('d MMM yyyy').format(dateTime);

  // Split the formatted date into day, month, and year
  List<String> parts = formattedDate.split(' ');
  return parts;
}

// void updateDate(String day, String month, String year) {
//   setState(() {
//     selectedDate = '$day $month $year';
//   });
// }
