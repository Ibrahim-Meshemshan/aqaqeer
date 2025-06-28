import 'package:flutter/material.dart';

import '../../../../core/common/config/lang/state/store_current_lang.dart';
import '../../../../core/common/function/configuration_splash_screen.dart';
import '../../../../core/injection/injection.dart';
import '../../body_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // var token;
  // @override
  // void initState() {
  //   startTimer(context);
  //   // print("splash screen");
  //   super.initState();
  // }

  // String? lang = locator.get<LanguageStorage>().getCurrentLang();
  bool isInit = true;
  @override
  Widget build(BuildContext context) {
    return BodySplash();
    // return BlocConsumer<AppManagerBloc, AppManagerState>(
    //   listenWhen: (p, c) => p != c,
    //   listener: (context, state) async {
    //     if (state.appInfoState.isSuccess()) {
    //       log("state.permissionsState.model ${locator.get<AppManagerBloc>().permissionsModel}");
    //       //print("base url data${state.appInfoState.model?.data}");
    //       locator
    //           .get<AppManagerLocal>()
    //           .saveCustomer(state.appInfoState.model ?? AppInfoModel());
    //       locator
    //           .get<AppManagerLocal>()
    //           .saveLogoPath(state.appInfoState.model?.data?.logo ?? '');
    //       //   context.read<AppManagerBloc>().add(InitAppInfoEvent());
    //       await compareOS(context);
    //       await compareVersion(context);
    //       await isAppUnderMaintenance(context);
    //       if (isInit) {
    //         isInit = false;
    //         // locator.get<AppManagerBloc>().permissionsModel = state.permissionsState.model;
    //         // filteringFunction();
    //         if (locator.get<AuthLocal>().getAuthToken() != null) {
    //           Navigator.of(context).pushReplacementNamed(
    //             Routes.mainRootPage,
    //           );
    //         } else {
    //           Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
    //         }
    //       }
    //     }
    //     if (state.appInfoState.isFail()) {
    //       showSnackBar(
    //           context: context,
    //           message: state.appInfoState.error ?? '',
    //           icon: Icons.warning_amber);
    //     }
    //
    //     // Navigator.of(context).pushReplacementNamed(
    //     //   Routes.mainRootPage,
    //     // );
    //   },
    //   builder: (BuildContext context, AppManagerState state) {
    //

  }
}
