import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/function/compare_os.dart';
import '../../../../core/common/function/compare_version.dart';
import '../../../../core/common/function/is_app_under_maintenance.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/routes_names.dart';
import '../../../auth/data/data_source/local/local.dart';
import '../../app_manager/data/data_source/local/app_manager_local.dart';
import '../../app_manager/data/model/app_info_model.dart';
import '../../body_splash.dart';
import '../../state/app_manager_state/app_manager_bloc.dart';

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
  //   print("splash screen");
  //   super.initState();
  // }

  // String? lang = locator.get<LanguageStorage>().getCurrentLang();
  bool isInit = true;
  @override
  Widget build(BuildContext context) {
    // return BodySplash();
    return BlocConsumer<AppManagerBloc, AppManagerState>(
        listenWhen: (p, c) => p != c,
        listener: (context, state) async {
          if (state.appInfoState.isSuccess()) {
            log("state.permissionsState.model ${locator.get<
                AppManagerBloc>()}");
            //print("base url data${state.appInfoState.model?.data}");
            locator
                .get<AppManagerLocal>()
                .saveCustomer(state.appInfoState.model ?? AppInfoModel());
            locator
                .get<AppManagerLocal>()
                .saveLogoPath(state.appInfoState.model?.data?.lOGO ?? '');
            //   context.read<AppManagerBloc>().add(InitAppInfoEvent());
            await compareOS(context);
            await compareVersion(context);
            await isAppUnderMaintenance(context);
            if (isInit) {
              isInit = false;
              // locator.get<AppManagerBloc>().permissionsModel = state.permissionsState.model;
              // filteringFunction();
              if (locator.get<AuthLocal>().getAuthToken() != null) {
                Navigator.of(context).pushReplacementNamed(
                  RoutesNames.rootScreenView,
                );
              } else {
                Navigator.of(context).pushReplacementNamed(
                    RoutesNames.loginScreen);
              }
            }
          }
          // if (state.appInfoState.isFail()) {
          //   showSnackBar(
          //       context: context,
          //       message: state.appInfoState.error ?? '',
          //       icon: Icons.warning_amber);
          // }

          // Navigator.of(context).pushReplacementNamed(
          //   RoutesNames.rootScreenView,
          // );
        },
        builder: (BuildContext context, AppManagerState state) {
          return BodySplash();
        }
    );
  }
}
