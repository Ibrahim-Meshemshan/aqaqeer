import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../state/sign_up_provider.dart';

class ThirdStepSignupForm extends StatefulWidget {
  const ThirdStepSignupForm({super.key});

  @override
  State<ThirdStepSignupForm> createState() => _ThirdStepSignupFormState();
}

class _ThirdStepSignupFormState extends State<ThirdStepSignupForm> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  SignUpProvider provider = locator.get<SignUpProvider>();
  // final FocusNode confirmPasswordFocusNode = FocusNode();
  // final FocusNode passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
          height: getHeightScreen(context) / 1.5,
          width: getWidthScreen(context),
          child: Form(
            key: _formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: AppLocalizations.of(context)!.password, fontWeight: FontWeight.bold),
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
              //    focusNode: passwordFocusNode,
              //     onSubmitted: (value) {
              //       FocusScope.of(context)
              //           .requestFocus(confirmPasswordFocusNode);
              //     },
                  textInputAction: TextInputAction.next,
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: TextStyle(color: AppColors.primaryGray2),
                  prefixIcon:
                      Icon(Icons.password, color: AppColors.primaryGray2),
                  controller: password,
                  onChanged: (txt) => provider.password = txt,
                ),
                SizedBox(height: 20),
                CustomText(
                    text: 'تأكيد كلمة المرور', fontWeight: FontWeight.bold),
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
              //    focusNode: confirmPasswordFocusNode,
                  hintText: 'تأكيد كلمة المرور',
                  customValidator: (text) {
                    if (provider.password != provider.confirmPassword) {
                      return 'confirm_pass_match_validation'.tr(context);
                    }
                    return null;
                  },
                  hintStyle: TextStyle(color: AppColors.primaryGray2),
                  prefixIcon:
                      Icon(Icons.password, color: AppColors.primaryGray2),
                  controller: confirmPassword,
                  onChanged: (txt) => provider.confirmPassword = txt,
                ),
                SizedBox(height: 20),
                Container(
                  color: AppColors.white,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: CustomButton(
                    height: 50,
                    width: getWidthScreen(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_box_outlined,
                            color: AppColors.white, size: 18),
                        SizedBox(width: 10),
                        CustomText(
                            text: "تفعيل الحساب",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    onPressed: () {
                      // if ((_formKey
                      //     .currentState
                      //         ?.validate() ??
                      //     false)) {
                      //   context.read<SignUpBloc>().add(GetSignUpOtpEvent(
                      //         mobile: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
                      //       ));
                      // } else {   showSnackBar(
                      //     message: 'يرجى ملئ جميع الحقول بشكل صحيح!',
                      //     icon: Icons.check,
                      //     context: context);}

                      // if ((context.read<SignUpBloc>().signUpFormKey.currentState?.validate() ?? false)) {
                      // context.read<SignUpBloc>().add(SignUpSubmission(
                      //       signUpParams: SignUpParams(
                      //         first_name: provider.name,
                      //         last_name: provider.surName,
                      //         birth_date: provider.date,
                      //         mobile: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
                      //         national_id: provider.nationalId,
                      //         password: provider.password,
                      //         password_confirmation: provider.confirmPassword,
                      //       ),
                      //     ));
                      // }
                    },

                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      }
  }

