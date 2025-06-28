import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';


class CustomTitleAppBar extends StatelessWidget {
  final Color? fontColor;
  final IconData? icon;
  final void Function()? onTap;
  final bool? showButtonIcon;
  const CustomTitleAppBar({
    super.key,
    required this.title,
    this.fontColor,
    this.icon,
    this.onTap,
    this.showButtonIcon = false,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyle.titleLarge(context)!.copyWith(
              fontWeight: FontWeight.bold,
              color: fontColor?? AppColors.white,
            ),
          ),
          Visibility(
            visible: showButtonIcon??true ,
            child: GestureDetector(
              onTap: onTap?? () {
                Navigator.pop(context);
              },
              child:  Icon( icon??
                Icons.arrow_forward_ios,
                color: fontColor?? AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
