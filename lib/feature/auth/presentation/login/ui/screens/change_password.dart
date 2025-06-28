import 'dart:developer';

import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../resources/assets.gen.dart';

class ChangePassword extends StatefulWidget {
  final String otp;

  ChangePassword({super.key, required this.otp});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  final FocusNode confirmPasswordFocusNode = FocusNode();

  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ModalProgressHUD(
        progressIndicator: LoaderWidget(),
        color: AppColors.primaryColor.withValues(alpha: 0.6),
        //state.resetPasswordState.isLoading()
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
                                'تغيير كلمة المرور',
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
                            SvgPicture.asset(
                              Assets.images.aqaqeerLogo.path,
                              height: 250,
                            ),
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'كلمة المرور',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  cursorColor: AppColors.secondaryColor,
                                  border: true,
                                  filledColor: AppColors.white,
                                  enabledBorder: CustomBorders.authBorder,
                                  focusedBorder: CustomBorders.focusBorder,
                                  errorBorder: CustomBorders.errorBorder,
                                  focusedErrorBorder: CustomBorders.errorBorder,
                                  isPassword: true,
                                  focusNode: passwordFocusNode,
                                  onSubmitted: (value) {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(confirmPasswordFocusNode);
                                  },
                                  textInputAction: TextInputAction.next,
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                    color: AppColors.primaryGray2,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: AppColors.primaryGray2,
                                  ),
                                  controller: password,
                                  onChanged: (txt) {
                                    //   provider.password = txt;
                                  },
                                ),
                                SizedBox(height: 20),
                                CustomText(
                                  text: 'تأكيد كلمة المرور',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 10),
                                CustomTextField(
                                  cursorColor: AppColors.secondaryColor,
                                  border: true,
                                  isConfirmPassword: true,
                                  filledColor: AppColors.white,
                                  enabledBorder: CustomBorders.authBorder,
                                  focusedBorder: CustomBorders.focusBorder,
                                  errorBorder: CustomBorders.errorBorder,
                                  focusedErrorBorder: CustomBorders.errorBorder,
                                  focusNode: confirmPasswordFocusNode,
                                  hintText: 'تأكيد كلمة المرور',
                                  customValidator: (text) {
                                    log("password ${password.text}");
                                    log(
                                      "confirmPassword ${confirmPassword.text}",
                                    );
                                    if (password.text != confirmPassword.text) {
                                      return 'confirm_pass_match_validation'.tr(
                                        context,
                                      );
                                    }
                                    return null;
                                  },
                                  hintStyle: TextStyle(
                                    color: AppColors.primaryGray2,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: AppColors.primaryGray2,
                                  ),
                                  controller: confirmPassword,
                                  onChanged: (txt) {
                                    //   provider.confirmPassword = txt;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: getWidthScreen(context),
                              child: CustomButton(
                                height: 50,
                                backgroundColor: AppColors.primaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'حفظ',
                                      style: CustomTextStyle.bodyMedium(
                                        context,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  // context
                                  //     .read<LoginBloc>()
                                  //     .add(ResetPasswordEvent(params:
                                  // ResetPasswordParam(confirmedPassword: confirmPassword.text,
                                  //     mobile: locator.get<AuthLocal>().getAuthUserName()??'',
                                  //     password: password.text, otp: widget.otp)));
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
