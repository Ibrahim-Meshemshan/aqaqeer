import 'package:aqaqeer/core/common/config/theme/src/theme.dart';
import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/network/netword_info.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../../../../core/l10n/localizations/app_localizationsNew.dart';
import '../../../../../../../core/routes/routes_names.dart';
import '../../../../../../../resources/assets.gen.dart';
import '../../../functions/determine_form.dart';
import '../../state/cubit/signup_provider_cubit.dart';
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
    final signUpProvider = locator.get<SignupProviderCubit>().state;
    context.read<SignupProviderCubit>().setFormIndex(0);
    signUpProvider.firstName = '';
    signUpProvider.meddleName = '';
    signUpProvider.lastName = '';
    signUpProvider.mobile = '';
    signUpProvider.password = '';
    signUpProvider.confirmPassword = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<SignupProviderCubit>(),
      child: BlocBuilder<SignupProviderCubit, SignupProviderState>(
        builder: (context, state) {
        final localization = AppLocalizations.of(context)!;
        return BlocProvider(
          create: (context) => locator.get<SignUpBloc>(),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) async{
              if (state.signUpState.isLoading()) {
                CircularProgressIndicator(color: AppColors.primaryColor,);
              } else if (state.signUpState.isFail()) {
                showSnackBar(context: context,
                    message: state.signUpState.error ?? '',
                    icon: Icons.error);
                if(await locator.get<NetworkInfo>().isConnected == false)
                  return;
                locator.get<SignupProviderCubit>().setFormIndex(1);
              } else if (state.signUpState.isSuccess()) {
                Navigator.pushReplacementNamed(
                    context, RoutesNames.rootScreenView);
              }
            },
            builder: (context, state) {
              final isLoad = state.signUpState.isLoading();
              return ModalProgressHUD(
                color: AppColors.primaryColor,
                inAsyncCall: isLoad,
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: AppColors.white,
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
                                text: localization.welcome,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
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
                                      text: localization.please_enter_data,
                                      style: AppThemes.lightThemeData
                                          .textTheme
                                          .titleLarge,
                                      color: AppColors.darkGreen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  determineForm(context.read<SignupProviderCubit>().state.formIndex),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },)


    );
  }
}

