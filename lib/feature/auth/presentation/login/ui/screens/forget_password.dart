import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../resources/assets.gen.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ModalProgressHUD(
        progressIndicator: LoaderWidget(),
        color: AppColors.primaryColor.withValues(alpha: 0.6),
        //state.forgetPasswordState.isLoading()
        inAsyncCall: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getWidthScreen(context),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.primaryColor, width: 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getWidthScreen(context),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
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
                              Text(
                                ('forget_password?').tr(context),
                                style: CustomTextStyle.titleLarge(
                                  context,
                                  color: AppColors.white,
                                ),
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
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            SvgPicture.asset(Assets.icons.iconOtp, height: 250),
                            const SizedBox(height: 30),
                            // Directionality(
                            //   textDirection: TextDirection.ltr,
                            //   child: CustomTextField(
                            //     cursorColor: AppColors.secondaryColor,
                            //     border: true,
                            //     filledColor: AppColors.white,
                            //     keyboardType: TextInputType.number,
                            //     enabledBorder: CustomBorders.authBorder,
                            //     focusedBorder: CustomBorders.focusBorder,
                            //     errorBorder: CustomBorders.errorBorder,
                            //  //   maxLength: 11,
                            //  //    inputMobileFormatters: true,
                            //     focusedErrorBorder: CustomBorders.errorBorder,
                            //     isNumberFormat: true,
                            //     hintStyle: TextStyle(color: AppColors.primaryGray2),
                            //     prefixIcon:Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         // CustomText(text: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode??''}',style: CustomTextStyle.titleMedium(context),),
                            //       ],
                            //     ),
                            //     controller: mobile,
                            //     onChanged: (txt) {
                            //     },
                            //     hintText: locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint,
                            //     format: locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint,
                            //     customValidator: (value) {
                            //       if (value == null || value.trim().isEmpty) {
                            //         return 'يرجى إدخال رقم الموبايل';
                            //       }
                            //       // if (!RegExp(r'^09\d{8}$').hasMatch(value)) {
                            //       //   return 'يجب أن يبدأ الرقم بـ 09 ويتكون من 10 أرقام';
                            //       // }
                            //       return null;
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 0),
                            TextButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(
                                //     context, Routes.loginScreen);
                              },
                              child: Text(
                                ('backToLogin').tr(context),
                                style: CustomTextStyle.bodyMedium(
                                  context,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: getWidthScreen(context),
                              child: CustomButton(
                                height: 50,
                                backgroundColor: AppColors.primaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.refresh,
                                      color: AppColors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      ('reset_password').tr(context),
                                      style: CustomTextStyle.bodyMedium(
                                        context,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  // context.read<SignUpBloc>().add(ForgetPasswordEvent(mobile:
                                  // '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${mobile.text}'));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
