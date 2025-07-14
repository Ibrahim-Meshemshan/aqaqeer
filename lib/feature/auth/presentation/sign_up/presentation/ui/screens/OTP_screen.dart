import 'dart:developer';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/cubit/signup_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/injection/injection.dart';
import '../../../../../../../core/provider/app_config_provider.dart';
import '../../../../../../../resources/assets.gen.dart';
import '../../../../../data/data_source/local/local.dart';
import '../../state/bloc/sign_up_bloc.dart';
import '../../state/sign_up_provider.dart';



class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with TickerProviderStateMixin, CodeAutoFill {
  CountdownController controller = new CountdownController(autoStart: true);

  bool isTimerActive = true;
  late AnimationController animationController;
  // SignUpProvider provider = locator.get<SignUpProvider>();
  bool? isForgetPassword;
  int seconds = 60;
  bool resendInProgress = false;
  String? _code;
  final TextEditingController _otpController = TextEditingController();
  String? _pin;
  String _signature = 'جارٍ التحميل...';

  @override
  void initState() {
    super.initState();
    _loadAppSignature();
    listenForCode();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: seconds), // Set your timer duration
    );
    animationController.forward();
    isTimerActive = true;
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isTimerActive = false;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      isForgetPassword = args?['isForgetPassword'] as bool? ?? false;
    });
  }

  @override
  void codeUpdated() {
    log('App code: $code');

    setState(() {
      _pin = code!;
      _otpController.text = _pin!;
    });
  }

  void _resendCode() {
    if (resendInProgress) return;

    setState(() {
      resendInProgress = true;
      isTimerActive = true;
    });

    animationController.stop();
    animationController.reset();
    animationController.duration = Duration(seconds: seconds);
    animationController.forward();

    if (isForgetPassword == true) {
      context.read<SignUpBloc>().add(
        ForgetPasswordEvent(
          mobile: '${locator.get<AuthLocal>().getAuthUserName()}',
        ),
      );
    } else {
      // context.read<SignUpBloc>().add(
      //   GetSignUpOtpEvent(
      //     mobile:
      //     '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
      //   ),
      // );
    }
  }

  @override
  void dispose() {
    cancel(); // إيقاف الاستماع عند الخروج
    animationController.dispose();
    super.dispose();
  }

  Future<void> _loadAppSignature() async {
    try {
      String signature = await SmsAutoFill().getAppSignature;
      log('App Signature: $signature');
      setState(() {
        _signature = signature;
      });
    } catch (e) {
      log('Error getting app signature: $e');
      setState(() {
        _signature = 'خطأ في الحصول على التوقيع: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ModalProgressHUD(
        //state.signUpState.isLoading()
        inAsyncCall: false,
        color: AppColors.primaryColor.withValues(alpha: 0.6),
        progressIndicator: LoaderWidget(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getWidthScreen(context),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(color: AppColors.primaryColor, width: 0),
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
                        SizedBox(width: 30),
                        CustomText(
                          text: AppLocalizations.of(context)!.activation_code,
                          fontSize: 20,
                          color: AppColors.white,
                          style: CustomTextStyle.titleLarge(
                            context,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: getWidthScreen(context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 0),
                    borderRadius:
                        getIt<AppConfigProvider>().isEn()
                            ? BorderRadius.only(topLeft: Radius.circular(60))
                            : BorderRadius.only(topRight: Radius.circular(60)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      SvgPicture.asset(Assets.icons.iconOtp, fit: BoxFit.fill),
                      SizedBox(height: 20),
                      // CustomText(
                      //   text: " توقيع التطبيق  ${_signature}",
                      //   style: CustomTextStyle.titleLarge(context,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // CustomText(
                      //   text: "رمز التفعيل",
                      //   style: CustomTextStyle.titleLarge(context,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      CustomText(
                        text: AppLocalizations.of(context)!.activation_code,
                        color: AppColors.gray,
                      ),
                      SizedBox(height: 50),
                      Pinput(
                        controller: _otpController,
                        onChanged: (pin) {
                          setState(() {
                            _pin = pin;
                          });
                        },
                        onCompleted: (pin) {
                          setState(() {
                            _pin = pin;
                          });
                        },
                        // defaultPinTheme: defaultPinTheme,
                        // followingPinTheme: followingPinTheme,
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            height: 50,
                            width: getWidthScreen(context) / 2.5,
                            onPressed: () {
                              if (_pin != null && _pin!.length == 4) {
                                // context
                                //     .read<SignUpBloc>()
                                //     .add(VerifyOtpEvent(otp: _pin!));

                                if (isForgetPassword == false) {
                                  // context
                                  //     .read<SignUpBloc>()
                                  //     .add(SignUpSubmission(
                                  //   signUpParams: SignUpParams(
                                  //     first_name: provider.name,
                                  //     last_name: provider.surName,
                                  //     birth_date: provider.date,
                                  //     mobile:
                                  //     '+${locator.get<AppManagerLocal>().getCustomer()?.data?.countryCode} ${provider.mobile}',
                                  //     national_id: provider.nationalId,
                                  //     password: provider.password,
                                  //     password_confirmation:
                                  //     provider.confirmPassword,
                                  //     otp: _pin!,
                                  //   ),
                                  // ));
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ChangePassword(
                                  //               otp: _pin ?? '',
                                  //             )));
                                }
                              } else {
                                showSnackBar(
                                  message:
                                      AppLocalizations.of(
                                        context,
                                      )!.please_enter_the_activation_code_first,
                                  icon: Icons.warning_amber,
                                  context: context,
                                );
                              }
                              locator.get<SignupProviderCubit>().setFormIndex(2);
                              Navigator.pushNamed(
                                context,
                                RoutesNames.loginScreen,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_box_outlined,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                CustomText(
                                  text:
                                      AppLocalizations.of(
                                        context,
                                      )!.verification,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // CustomButton(
                          //   height: 50,
                          //   width: getWidthScreen(context) / 1.9,
                          //   backgroundColor: isTimerActive
                          //       ? AppColors.primaryColor
                          //       .withValues(alpha: 0.4)
                          //       : AppColors.primaryColor,
                          //   onPressed: () {
                          //     if (!isTimerActive && !resendInProgress) {
                          //       _resendCode();
                          //     }
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.replay_sharp,
                          //         color: AppColors.white,
                          //         size: 16,
                          //       ),
                          //       SizedBox(width: 5),
                          //       CustomText(
                          //         text: "إعادة الإرسال",
                          //         color: AppColors.white,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       if (isTimerActive) ...[
                          //         SizedBox(width: 5),
                          //         AnimatedBuilder(
                          //           animation: animationController,
                          //           builder: (context, child) {
                          //             int remainingSeconds = (seconds -
                          //                 (animationController.value *
                          //                     seconds))
                          //                 .round();
                          //             int minutes = remainingSeconds ~/ 60;
                          //             int secs = remainingSeconds % 60;
                          //             String formattedTime =
                          //                 '${minutes.toString().padLeft(
                          //                 2, '0')}:${secs.toString()
                          //                 .padLeft(2, '0')}';
                          //
                          //             return Text(
                          //               formattedTime,
                          //               style: CustomTextStyle.bodySmall(
                          //                 context,
                          //                 color: AppColors.white,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             );
                          //           },
                          //         ),
                          //       ],
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
