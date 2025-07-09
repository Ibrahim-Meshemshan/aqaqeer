import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/feature/auth/domain/entities/signup_params.dart';
import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/function/validator.dart';
import '../../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../../../../../../core/routes/routes_names.dart';
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
  TextEditingController firstName = TextEditingController(
    text: locator.get<SignUpProvider>().name,
  );
  TextEditingController last_name = TextEditingController(
    text: locator.get<SignUpProvider>().last_name,
  );
  TextEditingController meddle_name = TextEditingController(
    text: locator.get<SignUpProvider>().meddle_name,
  );
  TextEditingController mobile = TextEditingController(text: locator.get<SignUpProvider>().mobile);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return  Container(
            height: getHeightScreen(context) / 1.5,
            width: getWidthScreen(context),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: localization.password, fontWeight: FontWeight.bold),
                  SizedBox(height: 10),
                  CustomTextField(
                    cursorColor: AppColors.secondaryColor,
                    border: true,
                    filledColor: AppColors.white,
                    keyboardType: TextInputType.text,
                    enabledBorder: CustomBorders.authBorder,
                    focusedBorder: CustomBorders.focusBorder,
                    errorBorder: CustomBorders.errorBorder,
                    isPassword: true,
                    focusedErrorBorder: CustomBorders.errorBorder,
                    hintStyle: CustomTextStyle.titleSmall(context),
                    prefixIcon: Icon(Icons.password),
                    controller: password,
                    onChanged: (txt) {
                      locator
                          .get<SignUpProvider>()
                          .password = txt;
                    },
                    hintText: localization.password,
                    // format: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
                    customValidator: (value) =>
                        validator(context: context,
                            isPassword: true, value: value
                        ),

                  ),
                  SizedBox(height: 20),
                  CustomText(
                      text: localization.confirm_password,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 10),
                  CustomTextField(
                      cursorColor: AppColors.secondaryColor,
                      border: true,
                      filledColor: AppColors.white,
                      keyboardType: TextInputType.text,
                      enabledBorder: CustomBorders.authBorder,
                      focusedBorder: CustomBorders.focusBorder,
                      errorBorder: CustomBorders.errorBorder,
                      isConfirmPassword: true,
                      focusedErrorBorder: CustomBorders.errorBorder,
                      hintStyle: CustomTextStyle.titleSmall(context),
                      prefixIcon: Icon(Icons.password),
                      controller: confirmPassword,
                      onChanged: (txt) {
                        locator
                            .get<SignUpProvider>()
                            .confirmPassword = txt;
                      },
                      hintText: localization.confirm_password,
                      // format: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
                      customValidator: (value) =>
                          validator(context: context,
                              confirmPassword: () {
                                if (password.text != confirmPassword.text) {
                                  return localization.fail_confirm;
                                }
                              },
                              value: value
                          )),
                  SizedBox(height: 40),
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
                              text: localization.activate_the_account,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),

                        ],
                      ),
                      onPressed: () {
                        if ((_formKey.currentState!.validate())) {
                          String formatPhoneToInternational(String phone) {
                            String cleaned = phone
                                .replaceAll(
                                RegExp(r'[\s\-]'), '');
                            if (cleaned.startsWith('0')) {
                              String numberPart = cleaned
                                  .substring(1);
                              if (numberPart.length ==
                                  9) {
                                return '+963 ${numberPart
                                    .substring(
                                    0, 2)} ${numberPart
                                    .substring(
                                    2, 5)}-${numberPart
                                    .substring(5)}';
                              } else {
                                return '+963' +
                                    numberPart;
                              }
                            }
                            return cleaned;
                          }
                          context.read<SignUpBloc>().add(SignUpSubmission(
                            signUpParams: SignupParams(
                            firstName: firstName.text,
                            password: password.text,
                            confirmPassword: confirmPassword.text,
                            middleName: meddle_name.text,
                            lastName: last_name.text,
                            mobile: formatPhoneToInternational(mobile.text),
                            
                          )));
                        }
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

/*context.read<SignUpBloc>().add(GetSignUpOtpEvent(
                              mobile: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
                            ));
                      } else {   showSnackBar(
                          message: 'يرجى ملئ جميع الحقول بشكل صحيح!',
                          icon: Icons.check,
                          context: context);}

                      if ((context.read<SignUpBloc>().signUpFormKey.currentState?.validate() ?? false)) {
                      context.read<SignUpBloc>().add(SignUpSubmission(
                            signUpParams: SignUpParams(
                              first_name: provider.name,
                              last_name: provider.surName,
                              birth_date: provider.date,
                              mobile: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
                              national_id: provider.nationalId,
                              password: provider.password,
                              password_confirmation: provider.confirmPassword,
                            ),
                          ));*/