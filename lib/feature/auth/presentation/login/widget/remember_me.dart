import 'package:flutter/material.dart';
import '../../../../../core/common/config/lang/app_localizations.dart';
import '../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../core/common/config/theme/src/styles.dart';


Widget buildRememberMe(
    {required BuildContext context,
      required void Function({ bool? value}) onTapped,
    required bool rememberMeChecked}) {
  return Row(
    children: [
      Checkbox(
        value: rememberMeChecked,
        onChanged: (v) {
          onTapped(value: v);
        },
        checkColor: AppColors.primaryGray,
        activeColor: AppColors.primaryColor,
      ),
      Text(
        ("remember_me").tr(context),
        style: CustomTextStyle.titleSmall(context),
      ),
    ],
  );
}
