import 'package:aqaqeer/core/common/function/validator.dart';
import 'package:aqaqeer/core/common/network/netword_info.dart';
import 'package:aqaqeer/core/common/widgets/snack_bar/snack_bar_custom.dart';
import 'package:aqaqeer/core/injection/injection.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../core/common/widgets/my_custom_widgets/customs_decoration/custom_borders.dart';
import '../../../../../../core/common/widgets/text_field/custom_text_field.dart';
import '../../../../../../resources/assets.gen.dart';
import '../../../../domain/entities/login_params.dart';
import '../../../sign_up/presentation/state/sign_up_provider.dart';
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
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocProvider(
            create: (context) => locator.get<LoginBloc>(),
            child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) async {
                  if (state.logInState.isLoading()) {
                    CircularProgressIndicator(color: AppColors.primaryColor,);
                  } else if (state.logInState.isFail()) {
                    showSnackBar(context: context,
                        message: state.logInState.error ?? 'UnExpected error',
                        // message: state.logInState.error ?? 'asd',
                        icon: Icons.error);
                  } else if (state.logInState.isSuccess()) {
                    Navigator.pushReplacementNamed(
                        context, RoutesNames.rootScreenView);
                  }
                },
                builder: (context, state) {
                  final state = context
                      .watch<LoginBloc>()
                      .state;
                  return ModalProgressHUD(
                    inAsyncCall: state.logInState.isLoading(),
                    color: AppColors.primaryColor.withValues(alpha: 0.6),
                    // progressIndicator: LoaderWidget(),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
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
                                            width: 163,
                                            height: 141,
                                            // Ensures the image covers the entire container
                                          ),
                                        ),
                                        Align(
                                          alignment: FractionalOffset.center,
                                          child: Image.asset(
                                            Assets.images.aqaqeerText.path,
                                            fit: BoxFit.fill,
                                            width: 150,
                                            height: 50,
                                            // Ensures the image covers the entire container
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        CustomText(text: localization.welcome_back,
                                          color: AppColors.darkGreen,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            //  SizedBox(height: 20,),
                            CustomText(
                              text: localization.login,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        CustomText(
                                          text: localization.user_name,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 10),
                                        CustomTextField(
                                          cursorColor: AppColors.secondaryColor,
                                          border: true,
                                          filledColor: AppColors.lightGray,
                                          keyboardType: TextInputType.number,
                                          enabledBorder: CustomBorders.authBorder,
                                          focusedBorder: CustomBorders.focusBorder,
                                          errorBorder: CustomBorders.errorBorder,
                                          maxLength: 10,
                                          isMobileNum: true,
                                          focusNode: mobileFocusNode,
                                          focusedErrorBorder: CustomBorders.errorBorder,
                                          isNumberFormat: true,
                                          hintStyle: CustomTextStyle.titleSmall(context),
                                          prefixIcon: Icon(Icons.phone),
                                          controller: userName,

                                          onChanged: (txt) {
                                            locator
                                                .get<SignUpProvider>()
                                                .mobile = txt;
                                          },
                                          hintText: localization.mobile_number,
                                          // format: '${locator.get<AppManagerLocal>().getCustomer()?.data?.usernameHint}',
                                          customValidator: (value) =>
                                              validator(context: context,
                                                value: value, isMobileNum: true,),
                                        ),
                                        SizedBox(height: 20),
                                        CustomText(
                                          text: localization.password,
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
                                          customValidator: (value) => validator(context: context,
                                                  isPassword: true,
                                                  value: value),
                                          maxLines: 1,
                                          filledColor: AppColors.lightGray,
                                          prefixIcon: Icon(
                                            Icons.lock_outline,
                                            color: AppColors.black,
                                          ),
                                          hintText: localization.password,
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
                                              localization.forget_password,
                                              style: CustomTextStyle
                                                  .titleMedium(
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
                                            backgroundColor: AppColors
                                                .primaryColor,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                const Icon(
                                                  Icons.login,
                                                  color: AppColors.white,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  localization.login,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              if ((_formKey.currentState!
                                                  .validate())) {
                                                String formatPhoneToInternational(
                                                    String phone) {
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

                                                context.read<LoginBloc>().add(
                                                  Login(
                                                    loginParams: LoginParams(
                                                      userName: formatPhoneToInternational(
                                                          userName.text),
                                                      password: password
                                                          .text,),),);
                                              }
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
                  );
                }
            )
        ),
      ),
    );
  }
}
