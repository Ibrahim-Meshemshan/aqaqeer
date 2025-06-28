import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../state/log_in_bloc.dart';
import '../widgets/signup_text.dart';
import '../widgets/smile_shape_clipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final FocusNode mobileFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ModalProgressHUD(
          //state.loginState.isLoading()
          inAsyncCall: false,
          color: AppColors.primaryColor.withValues(alpha: 0.6),
          progressIndicator: LoaderWidget(),
          child: SingleChildScrollView(
            child: Form(
              // key: context.read<LoginBloc>().loginFormKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: SmileShapeClipper(),
                    child: Container(
                      height: getHeightScreen(context) * .45,
                      color: AppColors.lightPurple2,
                      width: getWidthScreen(context),
                      padding: EdgeInsets.only(bottom: 10),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: FractionalOffset.center,
                                child: Image.asset(
                                  Assets.images.aqaqeerLogo.path,
                                  fit: BoxFit.fill,
                                  width:163,
                                  height: 141,
                                  // Ensures the image covers the entire container
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Image.asset(
                                  Assets.images.aqaqeerText.path,
                                  fit: BoxFit.fill,
                                  width:150,
                                  height: 50,
                                  // Ensures the image covers the entire container
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomText(text: AppLocalizations.of(context)!.welcome_back,color: AppColors.darkGreen,fontSize: 22,fontWeight: FontWeight.bold,)


                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  //  SizedBox(height: 20,),
                  CustomText(
                    text: AppLocalizations.of(context)!.login,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: AppColors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CustomText(
                              //   text: 'اسم المستخدم',
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
                              //   focusedBorder: CustomBorders.focusBorder,
                              //   errorBorder: CustomBorders.errorBorder,
                              //   focusedErrorBorder:
                              //       CustomBorders.errorBorder,
                              //   hintText: 'اسم المستخدم',
                              //   hintStyle: TextStyle(
                              //       color: AppColors.primaryGrey2),
                              //   // customValidator: (text){},
                              //   prefixIcon: Icon(
                              //     Icons.person_outline,
                              //     color: AppColors.primaryGrey2,
                              //   ),
                              //   controller: userName,
                              // ),
                              CustomText(
                                text: AppLocalizations.of(context)!.user_name,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                prefixIcon: Icon(Icons.person_2_outlined),
                                cursorColor: AppColors.secondaryColor,
                                border: true,
                                filledColor: AppColors.lightGray,
                                keyboardType: TextInputType.number,
                                enabledBorder: CustomBorders.authBorder,
                                focusedBorder: CustomBorders.focusBorder,
                                errorBorder: CustomBorders.errorBorder,
                                //  maxLength: 11,
                                // inputMobileFormatters: true,
                                focusedErrorBorder: CustomBorders.errorBorder,
                                isNumberFormat: true,
                                focusNode: mobileFocusNode,
                                textInputAction: TextInputAction.next,
                                // Enables next action on keyboard
                                onSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(
                                    passwordFocusNode,
                                  ); // Move focus to password field
                                },

                                // prefixIcon:Column(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     CustomText(text: '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode??''}',
                                //       style: CustomTextStyle.titleMedium(context),),
                                //   ],
                                // ),
                                controller: userName,
                                onChanged: (txt) {},
                                //locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint
                                hintText: AppLocalizations.of(context)!.user_name,
                                hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                                // format: locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint,
                                customValidator: (value) {
                                  return null;

                                  // if (value == null || value.trim().isEmpty) {
                                  //   return 'يرجى إدخال رقم الموبايل';
                                  // }
                                  //
                                  // // Get the mask dynamically
                                  // final mask = locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint ?? '';
                                  //
                                  // // Count how many digits are expected in the mask (number of # characters)
                                  // final requiredDigits = '#'.allMatches(mask).length;
                                  //
                                  // // Remove all non-digit characters from the input
                                  // final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
                                  //
                                  // if (digitsOnly.length < requiredDigits) {
                                  //   return 'يرجى إدخال رقم موبايل صحيح';
                                  // }
                                  //
                                  // return null;
                                },
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: AppLocalizations.of(context)!.password,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                cursorColor: AppColors.secondaryColor,
                                enabledBorder: CustomBorders.authBorder,
                                focusedBorder: CustomBorders.focusBorder,
                                errorBorder: CustomBorders.errorBorder,
                                focusedErrorBorder: CustomBorders.errorBorder,
                                isPassword: true,
                                focusNode: passwordFocusNode,

                                customValidator: (text) {
                                  return null;
                                },
                                maxLines: 1,
                                filledColor: AppColors.lightGray,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.black,
                                ),
                                hintText: AppLocalizations.of(context)!.password,
                                hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                ),
                                controller: password,
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, Routes.forgetPasswordScreen);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.forget_password,
                                    style: CustomTextStyle.titleMedium(
                                      context,
                                      fontSize: 18,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: getWidthScreen(context),
                                child: CustomButton(
                                  height: 50,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.login,
                                        color: AppColors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        AppLocalizations.of(context)!.login,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    // if ((context
                                    //     .read<LoginBloc>()
                                    //     .loginFormKey
                                    //     .currentState
                                    //     ?.validate() ??
                                    //     false)) {
                                    //   context.read<LoginBloc>().add(
                                    //       LoginSubmission(
                                    //           loginParams: LoginParams(
                                    //               userName:
                                    //               "+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${userName.text}",
                                    //               password:
                                    //               password.text)));
                                    // }
                                    Navigator.pushNamed(context, RoutesNames.rootScreenView);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SignUpText(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
