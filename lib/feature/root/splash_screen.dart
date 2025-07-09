import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:aqaqeer/core/routes/routes_names.dart';
import 'package:aqaqeer/feature/root/state/app_manager_state/app_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/common/config/lang/state/store_current_lang.dart';
import '../../core/common/config/theme/src/colors.dart';
import '../../core/common/function/compare_os.dart';
import '../../core/common/function/compare_version.dart';
import '../../core/common/function/configuration_splash_screen.dart';
import '../../core/common/function/is_app_under_maintenance.dart';
import '../../core/common/storage/cash_helper.dart';
import '../../core/common/widgets/snack_bar/snack_bar_custom.dart';
import '../../core/injection/injection.dart';
import '../../resources/assets.gen.dart';
import 'app_manager/data/data_source/local/app_manager_local.dart';
import 'app_manager/data/model/app_info_model.dart';
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
    return BlocConsumer<AppManagerBloc, AppManagerState>(
        listener: (context, state) async {
          Navigator.of(context).pushReplacementNamed(
            RoutesNames.rootScreenView,
          );
          // if (state.appInfoState.isSuccess()) {
          //   await compareOS(context);
          //   await compareVersion(context);
          //   await isAppUnderMaintenance(context);
            if (authLocal.getAuthToken() == null) {
              Navigator.of(context).pushReplacementNamed(
                RoutesNames.loginScreen,
                // arguments: lang == 'ar'
                //     ? state.appInfoState.model?.data?.cLIENTNAMEAR
                //     : state.appInfoState.model?.data?.cLIENTNAMEEN ?? '',
              );
            } else {
              Navigator.of(context).pushReplacementNamed(
                RoutesNames.rootScreenView,
              );
            }
          //
          // if (state.appInfoState.isFail()) {
          //   locator.get<AppManagerLocal>().saveBaseUrl(
          //       state.appInfoState.model?.data?.bASEURL ?? '');
          //   locator
          //       .get<AppManagerLocal>()
          //       .saveCustomer(state.appInfoState.model ?? AppInfoModel());
          //   locator
          //       .get<AppManagerLocal>()
          //       .saveLogoPath(state.appInfoState.model?.data?.lOGO ?? '');
          //   await compareOS(context);
          //   await compareVersion(context);
          //   await isAppUnderMaintenance(context);
          //   print('${locator.get<CashHelper>().getString('clientCode')}');
          //   String baseUrl = state.appInfoState.model!.data!.bASEURL!;
          //   print('BASEURL $baseUrl');
          //
          //   String chatUrl = '${state.appInfoState.model?.data?.cHATURL}';
          //   print('CHAT URL $chatUrl');
          //
          //   String chatSocketUrl = '${state.appInfoState.model?.data
          //       ?.cHATSOCKETURL}';
          //   print('chatSocketUrl $chatSocketUrl');
          //
          //   locator.get<CashHelper>().setString('base_url', baseUrl);
          //   locator.get<CashHelper>().setString('chatUrl', chatUrl);
          //   locator.get<CashHelper>().setString('chatSocketUrl', chatSocketUrl);
          //   await compareOS(context);
          //   await compareVersion(context);
          //   if (lang == 'ar') {
          //     Navigator.of(context).pushReplacementNamed(
          //       RoutesNames.loginScreen,
          //       arguments: state.appInfoState.model!.data!.cLIENTNAMEAR,
          //     );
          //   } else {
          //     Navigator.of(context).pushReplacementNamed(
          //       RoutesNames.loginScreen,
          //       arguments: state.appInfoState.model!.data!.cLIENTNAMEEN,
          //     );
          //   }
          //   showSnackBar(
          //     context: context,
          //     message: 'success'.tr(context),
          //     icon: Icons.check_circle_outline,
          //     borderColor: AppColors.darkGreen,
          //   );
          // } else if (state.appInfoState.isFail()) {
          //   log('error ${state.appInfoState.error!}');
          //   showSnackBar(
          //     icon: Icons.warning_amber,
          //     message: state.appInfoState.error!,
          //     context: context,
          //   );
          //   Navigator.of(context).pushReplacementNamed(
          //       RoutesNames.splashScreen);
        },
        builder: (BuildContext context, AppManagerState state) {
          return ModalProgressHUD(
            //state.appInfoState.isLoading()
            inAsyncCall: false,
            // progressIndicator: const CustomCircularProgress(),
            color: AppColors.secondaryColor,
            opacity: 0.3,
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Image.asset(Assets.images.background.path),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: FractionalOffset.center,
                                child: FadeInDownBig(
                                  duration: const Duration(milliseconds: 1000),
                                  child: SizedBox(
                                    width: 200,
                                    child: Image.asset(
                                      Assets.images.aqaqeerLogo.path,
                                      width: 240,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: FadeInDownBig(
                                  duration: const Duration(milliseconds: 1000),
                                  child: SizedBox(
                                    width: 200,
                                    child: Image.asset(
                                      Assets.images.aqaqeerText.path,
                                      width: 240,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FadeInUpBig(
                                duration: const Duration(milliseconds: 500),
                                child: SizedBox(
                                  width: 200,
                                  child: Image.asset(
                                    Assets.icons.automataIntro.path,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
        });
  }
}
