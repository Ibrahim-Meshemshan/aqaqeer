import 'package:flutter/material.dart';

class NotificationTypeWidget extends StatelessWidget {
  final String text;

  final bool isSwitch;
  final void Function(bool)? onChange;

  NotificationTypeWidget({
    super.key,
    required this.isSwitch,
    required this.text,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch(value: isSwitch, onChanged: onChange),
      ],
    );
  }
}
