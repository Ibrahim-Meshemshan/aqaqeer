import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import '../../config/theme/src/colors.dart';

class CustomEasyStepperGeneral extends StatelessWidget {
  const CustomEasyStepperGeneral({
    super.key,
    required this.steps,
  });

  final List<EasyStep> steps;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: 1,
      // lineLength: MediaQuery.sizeOf(context).height * .1,
      stepShape: StepShape.circle,
      stepBorderRadius: 20,
      borderThickness: 5,
      internalPadding: 6,
      stepRadius: 15,
      finishedStepBorderColor: AppColors.fourthColor,
      finishedStepBackgroundColor: AppColors.fourthColor,
      // finishedLineColor: AppColors.fourthColor,
      // lineType: LineType.normal,
      // defaultLineColor: AppColors.primaryGray,
      activeStepBackgroundColor: AppColors.fourthColor,
      activeStepBorderColor: AppColors.fourthColor,
      unreachedStepBackgroundColor: AppColors.chartGray,
      unreachedStepBorderColor: AppColors.chartGray,
      showScrollbar: false,
      showLoadingAnimation: false,
      defaultStepBorderType: BorderType.normal,
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 15,
      ),
      steps: steps,
    );
  }
}
