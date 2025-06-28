import 'package:flutter/material.dart';
import '../../../feature/app.dart';
import '../../../feature/auth/data/data_source/local/local.dart';
import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../../feature/root/state/app_manager_state/app_manager_bloc.dart';
import '../../injection/injection.dart';
import '../../routes/routes.dart';
import '../storage/cash_helper.dart';

logOutAndClearVariable() async {
  locator.get<AppManagerBloc>().add(
    DeleteFcmTokenEvent(
      fcmToken: locator.get<AppManagerLocal>().getFCMToken() ?? '',
    ),
  );
  locator.get<AuthLocal>().removeAuthToken();
  locator.get<AppManagerLocal>().removeFCMToken();
  locator.get<CashHelper>().clear();
  await Future.delayed(const Duration(milliseconds: 1300));
  navigatorKey.currentState?.pushNamedAndRemoveUntil(
    Routes.splash,
        (Route route) => false,
  );
}