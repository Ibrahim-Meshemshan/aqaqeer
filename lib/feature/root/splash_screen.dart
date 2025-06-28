import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../core/common/config/lang/state/store_current_lang.dart';
import '../../core/common/config/theme/src/colors.dart';
import '../../core/common/function/configuration_splash_screen.dart';
import '../../core/injection/injection.dart';
import 'body_splash.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen.SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var token;

  @override
  void initState() {
    super.initState();
    startTimer(context);
  }

  String? lang = locator.get<LanguageStorage>().getCurrentLang();

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AppManagerBloc, AppManagerState>(
    //   listener: (context, state) async {
    //     Navigator.of(context).pushReplacementNamed(
    //       Routes.mainRootPage,
    //     );
    //     if (state.appInfoState.isSuccess()) {
    //       await compareOS(context);
    //       await compareVersion(context);
    //       await isAppUnderMaintenance(context);
    //       if (authLocal.getAuthToken() == null) {
    //         Navigator.of(context).pushReplacementNamed(
    //           Routes.loginInScreen,
    //           arguments: lang == 'ar'
    //               ? state.appInfoState.model?.data?.cLIENTNAMEAR
    //               : state.appInfoState.model?.data?.cLIENTNAMEEN ?? '',
    //         );
    //       } else {
    //         Navigator.of(context).pushReplacementNamed(
    //           Routes.mainRootPage,
    //         );
    //       }
    //     }
    //     if (state.appInfoState.isFail()) {
    //       locator.get<AppManagerLocal>().saveBaseUrl(state.appInfoState.model?.data?.bASEURL ?? '');
    //             locator
    //                 .get<AppManagerLocal>()
    //                 .saveCustomer(state.appInfoState.model ?? AppInfoModel());
    //             locator
    //                 .get<AppManagerLocal>()
    //                 .saveLogoPath(state.appInfoState.model?.data?.lOGO ?? '');
    //             await compareOS(context);
    //             await compareVersion(context);
    //             await isAppUnderMaintenance(context);
    //       print('${locator.get<CashHelper>().getString('clientCode')}');
    //       String baseUrl = state.appInfoState.model!.data!.bASEURL!;
    //       print('BASEURL $baseUrl');
    //
    //       String chatUrl = '${state.appInfoState.model?.data?.cHATURL}';
    //       print('CHAT URL $chatUrl');
    //
    //       String chatSocketUrl = '${state.appInfoState.model?.data?.cHATSOCKETURL}';
    //       print('chatSocketUrl $chatSocketUrl');
    //
    //       locator.get<CashHelper>().setString('base_url', baseUrl);
    //       locator.get<CashHelper>().setString('chatUrl', chatUrl);
    //       locator.get<CashHelper>().setString('chatSocketUrl', chatSocketUrl);
    //       await compareOS(context);
    //       await compareVersion(context);
    //       if (lang == 'ar') {
    //         Navigator.of(context).pushReplacementNamed(
    //           Routes.loginInScreen,
    //           arguments: state.appInfoState.model!.data!.cLIENTNAMEAR,
    //         );
    //       } else {
    //         Navigator.of(context).pushReplacementNamed(
    //           Routes.loginInScreen,
    //           arguments: state.appInfoState.model!.data!.cLIENTNAMEEN,
    //         );
    //       }
    //       showSnackBar(
    //         context: context,
    //         message: 'success'.tr(context),
    //         icon: Icons.check_circle_outline,
    //         borderColor: AppColors.darkGreen,
    //       );
    //     } else if (state.appInfoState.isFail()) {
    //       log('error ${state.appInfoState.error!}');
    //       showSnackBar(
    //         icon: Icons.warning_amber,
    //         message: state.appInfoState.error!,
    //         context: context,
    //       );
    //       Navigator.of(context).pushReplacementNamed(Routes.splash);
    //     }
    //   },
    //   builder: (BuildContext context,AppManagerState state) {
         return ModalProgressHUD(
           //state.appInfoState.isLoading()
            inAsyncCall: false,
            // progressIndicator: const CustomCircularProgress(),
            color: AppColors.secondaryColor,
            opacity: 0.3,
            child: const BodySplash());



  }
}
