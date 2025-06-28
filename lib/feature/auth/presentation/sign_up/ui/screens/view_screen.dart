import 'package:aqaqeer/core/provider/app_config_provider.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../state/sign_up_provider.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 75,
              width: getWidthScreen(context),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border.all(color: AppColors.primaryColor, width: 0),
                //BorderRadius.only(bottomLeft: Radius.circular(60))
                borderRadius:
                    getIt<AppConfigProvider>().isEn()
                        ? BorderRadius.only(bottomRight: Radius.circular(60))
                        : BorderRadius.only(bottomLeft: Radius.circular(60)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      CustomText(
                        text: AppLocalizations.of(context)!.verification,
                        color: AppColors.white,
                        fontSize: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: getWidthScreen(context),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.white, width: 0),
                  borderRadius: getIt<AppConfigProvider>().isEn() ? BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ):BorderRadius.only(
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    CustomText(
                      text: AppLocalizations.of(context)!.first_name,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      cursorColor: AppColors.primaryColor,
                      border: true,
                      filledColor: AppColors.lightGray,
                      enabledBorder: CustomBorders.authBorder,
                      readOnly: true,
                      focusedBorder: CustomBorders.authBorder,
                      errorBorder: CustomBorders.errorBorder,
                      focusedErrorBorder: CustomBorders.errorBorder,
                      hintStyle: TextStyle(color: AppColors.primaryGray2),
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: AppColors.black,
                      ),
                      controller: TextEditingController(
                        text: locator.get<SignUpProvider>().name,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: AppLocalizations.of(context)!.last_name,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      cursorColor: AppColors.primaryColor,
                      border: true,
                      filledColor: AppColors.lightGray,
                      enabledBorder: CustomBorders.authBorder,
                      readOnly: true,
                      focusedBorder: CustomBorders.authBorder,
                      errorBorder: CustomBorders.errorBorder,
                      focusedErrorBorder: CustomBorders.errorBorder,
                      hintStyle: TextStyle(color: AppColors.primaryGray2),
                      prefixIcon: Icon(
                        Icons.people_alt_outlined,
                        color: AppColors.black,
                      ),
                      controller: TextEditingController(
                        text: locator.get<SignUpProvider>().surName,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: AppLocalizations.of(context)!.date_of_birth,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      cursorColor: AppColors.secondaryColor,
                      border: true,
                      filledColor: AppColors.lightGray,
                      enabledBorder: CustomBorders.authBorder,
                      readOnly: true,
                      focusedBorder: CustomBorders.authBorder,
                      errorBorder: CustomBorders.errorBorder,
                      focusedErrorBorder: CustomBorders.errorBorder,
                      isNumberFormat: true,
                      hintStyle: TextStyle(color: AppColors.primaryGray2),
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: AppColors.black,
                      ),
                      controller: TextEditingController(
                        text: locator.get<SignUpProvider>().date,
                      ),
                    ),
                    SizedBox(height: 50),
                    // CustomText(
                    //   text: 'الرقم الوطني',
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // CustomTextField(
                    //   cursorColor: AppColors.secondaryColor,
                    //   border: true,
                    //   filledColor: AppColors.white,
                    //   enabledBorder: CustomBorders.authBorder,
                    //   readOnly: true,
                    //   focusedBorder: CustomBorders.authBorder,
                    //   errorBorder: CustomBorders.errorBorder,
                    //   focusedErrorBorder: CustomBorders.errorBorder,
                    //   isNumberFormat: true,
                    //   hintStyle: TextStyle(color: AppColors.primaryGray2),
                    //   prefixIcon: Icon(
                    //     CupertinoIcons.person_crop_rectangle,
                    //     color: AppColors.primaryGray2,
                    //   ),
                    //   controller: TextEditingController(
                    //       text: locator.get<SignUpProvider>().nationalId),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // CustomText(
                    //   text: 'رقم الموبايل',
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Directionality(
                    //   textDirection: TextDirection.ltr,
                    //   child: CustomTextField(
                    //     cursorColor: AppColors.secondaryColor,
                    //     border: true,
                    //     filledColor: AppColors.white,
                    //     enabledBorder: CustomBorders.authBorder,
                    //     readOnly: true,
                    //     focusedBorder: CustomBorders.authBorder,
                    //     errorBorder: CustomBorders.errorBorder,
                    //     focusedErrorBorder: CustomBorders.errorBorder,
                    //     isMobileNum: true,
                    //     hintStyle: TextStyle(color: AppColors.primaryGray2),
                    //     prefixIcon: Icon(
                    //       Icons.phone_iphone,
                    //       color: AppColors.primaryGray2,
                    //     ),
                    //     // controller: TextEditingController(
                    //     //     text: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${locator.get<SignUpProvider>().mobile}'),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: CustomButton(
                        height: 54,
                        borderRadius: BorderRadius.circular(35),
                        width: getWidthScreen(context),
                        onPressed: () {
                          locator.get<SignUpProvider>().setFormIndex(2);
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesNames.oTPScreen,
                          );
                          // Navigator.pushReplacementNamed(
                          //     context, RoutesNames.signupScreen);
                          // Navigator.pop(context);
                        },
                        text: AppLocalizations.of(context)!.next,
                        textStyle: CustomTextStyle.titleMedium(
                          context,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
