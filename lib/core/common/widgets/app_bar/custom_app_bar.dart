import 'package:flutter/material.dart';

import '../../config/theme/src/colors.dart';
import '../../config/theme/src/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? icon;
  final Color? fontColor;
  final Color? backgroundColor;
  final bool? centerTitle;
  final Function()? onTap;

  const CustomAppBar({
    super.key,
    this.centerTitle,
     this.title,
    this.icon,
    this.onTap,
    this.fontColor,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: backgroundColor?? AppColors.white,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Text(
       title ?? '',
        style: CustomTextStyle.headlineSmall(context,
            color: fontColor ?? AppColors.primaryColor, fontWeight: FontWeight.w600),
      ),

      actions: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:  icon,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
