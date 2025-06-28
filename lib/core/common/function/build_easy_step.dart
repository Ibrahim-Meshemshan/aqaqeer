import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';

import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';


EasyStep buildEasyStep({
  required BuildContext context,
  required String data,
  required String customTitle,
}) {
  return EasyStep(
    customStep: Text(
      data,
      style: CustomTextStyle.titleSmall(context)!.copyWith(
        color: AppColors.white,
      ),
    ),
    customTitle: Text(
      customTitle,
      textAlign: TextAlign.center,
      style: CustomTextStyle.titleSmall(context),
    ),
  );
}
