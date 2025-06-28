import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../constant/lists.dart';
import '../dropdown/custom_drop_down.dart';

class DropdownTimePicker extends StatefulWidget {
  final Function(String hour, String minute, String period) onTimeSelected;
  final String? maxHour;
  final String? minHour;
  final String? maxMinute;
  final String? minMinute;
  final bool? isRequired;
  final String? maxPeriod;
  final String? minPeriod;
  const DropdownTimePicker({super.key, required this.onTimeSelected, this.maxHour,
    this.minHour, this.maxMinute, this.minMinute, this.isRequired,
    this.maxPeriod,this.minPeriod});

  @override
  _DropdownTimePickerState createState() => _DropdownTimePickerState();
}

class _DropdownTimePickerState extends State<DropdownTimePicker> {
  String? selectedHour ;
  String? selectedMinute ;
  String? selectedPeriod ;

  void _notifyParent() {
    widget.onTimeSelected(selectedHour??'', selectedMinute??'', selectedPeriod??'');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomDropDown<String>(
            list:(_,__)=> hours,
            // {
            //   return hours.where((hour) {
            //     int hourValue = int.parse(hour);
            //     return hourValue >= (widget.minHour != null ? int.parse(widget.minHour??'') : 0) &&
            //         hourValue <= (widget.maxHour != null ? int.parse(widget.maxHour??'') : 60);
            //   }).toList();
            // },
            filled: false,
            backgroundColor: AppColors.white,
            onChange: (value) {
              setState(() {
                selectedHour = value??'';
                _notifyParent();
              });
            },
            itemAsString: (item){return item;},
            selectedItem: selectedHour,
            hint: 'الساعة',
            // color: AppColors.primaryGray,


          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomDropDown<String>(
            list:(_,__) => minutes,
            // {
            //   return minutes.where((minute) {
            //     int minuteValue = int.parse(minute);
            //     return minuteValue >= (widget.minMinute != null ? int.parse(widget.minMinute??'') : 0) &&
            //         minuteValue <= (widget.maxMinute != null ? int.parse(widget.maxMinute??'') : 60);
            //   }).toList();
            // },
            filled: false,
            backgroundColor: AppColors.white,
            onChange: (value) {
              setState(() {
                selectedMinute = value??'';
                _notifyParent();
              });
            },
            selectedItem: selectedMinute,
            hint: 'الدقيقة',
            itemAsString: (item){return item;},
            // color: AppColors.primaryGray,

          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomDropDown<String>(
            list: (_,__)=>periods,
            filled: false,
            backgroundColor: AppColors.white,
            onChange: (value) {
              setState(() {
                selectedPeriod = value??'';
                _notifyParent();
              });
            },
            selectedItem: selectedPeriod,
            hint: 'الفترة',
            itemAsString: (item){return item;},
            // color: AppColors.primaryGray,

          ),
        ),
      ],
    );
  }
}
