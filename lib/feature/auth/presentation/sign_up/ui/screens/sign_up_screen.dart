import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/common/config/theme/src/theme.dart';
import 'package:aqaqeer/core/common/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../../../../../resources/assets.gen.dart';
import '../../functions/determine_form.dart';
import '../../state/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    final signUpProvider = locator.get<SignUpProvider>();
    signUpProvider.setFormIndex(0);
    signUpProvider.password = '';
    signUpProvider.email = '';
    signUpProvider.nationalId = '';
    signUpProvider.mobile = '';
    signUpProvider.name = '';
    // signUpProvider.date = '';
    signUpProvider.city = '';
    signUpProvider.confirmPassword = '';
    signUpProvider.surName = '';
    signUpProvider.date = null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator.get<SignUpProvider>(),
      builder: (context, _) {
        return Consumer<SignUpProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: AppColors.white,
              // body: BlocProvider(
              //   create: (context) =>
              //   locator.get<SignUpBloc>()..add(BirthdateRequirement()),
              //   child: BlocBuilder<SignUpBloc, SignUpState>(
              //     builder: (context, state) {
              //       return ModalProgressHUD(
              //         //state.signupOtpState.isLoading() ||
              //         //                           state.birthdateState.isLoading()
              //         inAsyncCall: true,
              //         color: AppColors.primaryColor.withValues(alpha: 0.6),
              //         progressIndicator: LoaderWidget(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: getHeightScreen(context) * 0.4,
                      width: getWidthScreen(context),
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                        ),
                        // image: DecorationImage(
                        //   image: AssetImage(Assets.images.background.path),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.images.aqaqeerLogo.path,
                            height: 140,
                            width: 180,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            Assets.images.aqaqeerText.path,
                            height: 59,
                            width: 130,
                          ),
                          CustomText(
                            text: AppLocalizations.of(context)!.welcome,
                            fontSize: 25,
                            style: CustomTextStyle.titleLarge(
                              context,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.lightPurple2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: getWidthScreen(context),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: AppLocalizations.of(context)!.please_enter_data,
                                  style: AppThemes.lightThemeData.textTheme
                                      .titleLarge,
                                  color: AppColors.darkGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 20),
                              // Text('الاسم',style: AppThemes.lightThemeData.textTheme.titleMedium),
                              // SizedBox(height: 10),
                              // CustomTextField(
                              //   filledColor: AppColors.white,
                              //   hintText: 'أدخل الاسم',
                              //   hintStyle: TextStyle(color: AppColors.lightGray),
                              //   focusedBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: AppColors.lightPurple),
                              //     borderRadius: BorderRadius.circular(8)
                              //   ),
                              //   disabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(8),
                              //     borderSide: BorderSide(color: AppColors.gray)
                              //   ),
                              //   customValidator:  (value) {
                              //
                              //   },
                              // )

                              determineForm(context.read<SignUpProvider>().formIndex ?? 0, false),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

