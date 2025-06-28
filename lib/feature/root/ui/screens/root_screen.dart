import 'dart:io';

import 'package:aqaqeer/feature/services/presentation/ui/screen/services_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/config/theme/src/colors.dart';
import '../../../../core/common/widgets/nav_bar/custom_animated_notch_bottom_bar.dart';
import '../../app_manager/domain/entity/save_fcm_token_param.dart';
import '../../state/app_manager_state/app_manager_bloc.dart';
import '../widgets/body_root.dart';

class RootScreenView extends StatefulWidget {
  const RootScreenView({super.key});

  @override
  State<RootScreenView> createState() => _RootScreenViewState();
}

class _RootScreenViewState extends State<RootScreenView> {
  bool isInitial = true;

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<NotificationBloc>().add(FetchNotification(unRead: '1'));
  //   locator.get<AppManagerBloc>().add(GetPermissions());
  //   _checkFcmToken();
  // }

  Future<void> _checkFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');
        String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken != null) {
          debugPrint("APNS Token: $apnsToken");
          String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
          debugPrint("FCM Token: $fcmToken");
          context.read<AppManagerBloc>().add(
            SaveFcmTokenEvent(
              saveFcmTokenParams: SaveFcmTokenParams(
                tokenType: "MOBILE",
                fcmToken: fcmToken,
              ),
            ),
          );
        } else {
          debugPrint(
            "APNS Token not available, trying to get FCM token anyway ...",
          );

          try {
            String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
            context.read<AppManagerBloc>().add(
              SaveFcmTokenEvent(
                saveFcmTokenParams: SaveFcmTokenParams(
                  tokenType: "MOBILE",
                  fcmToken: fcmToken,
                ),
              ),
            );
          } catch (err) {
            debugPrint("FCM Token not available ($err)");
          }
        }
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        debugPrint('User granted provisional permission');
      } else {
        debugPrint('User declined or has not accepted permission');
      }
    } else {
      String token = await messaging.getToken() ?? '';

      context.read<AppManagerBloc>().add(
        SaveFcmTokenEvent(
          saveFcmTokenParams: SaveFcmTokenParams(
            tokenType: "MOBILE",
            fcmToken: token,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      //CustomAnimatedNotchBottomBar
      bottomNavigationBar: MyHomePage(),
      // body: BlocBuilder<AppManagerBloc, AppManagerState>(
      //   builder: (context, state) {
      //     if(isInitial){
      //       locator.get<AppManagerBloc>().permissionsModel = state.permissionsState.model;
      //       clearFilteringList();
      //       filteringFunction();
      //     }
      body: BodyRoot(),
    );
  }
}
