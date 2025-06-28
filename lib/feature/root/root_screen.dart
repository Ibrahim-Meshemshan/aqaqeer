// import 'dart:developer';
// import 'dart:io';
// import 'package:aqaqeer/feature/root/state/app_manager_state/app_manager_bloc.dart';
// import 'package:aqaqeer/feature/root/state/index_bloc.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../core/injection/injection.dart';
// import 'app_manager/data/data_source/local/app_manager_local.dart';
// import 'app_manager/domain/entity/save_fcm_token_param.dart';
// import 'body_root.dart';
//
// class RootScreen extends StatefulWidget {
//   const RootScreen({super.key});
//
//   @override
//   State<RootScreen> createState() => _RootScreenState();
// }
//
// class _RootScreenState extends State<RootScreen> {
//   final _fireBaseMessaging = FirebaseMessaging.instance;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _checkFcmToken();
//   }
//
//   Future<void> _checkFcmToken() async {
//     if (Platform.isIOS) {
//       NotificationSettings settings =
//           await _fireBaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//
//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         print('User granted permission');
//         String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//
//         if (apnsToken != null) {
//           debugPrint("APNS Token: $apnsToken");
//           String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
//           debugPrint("FCM Token: $fcmToken");
//         } else {
//           debugPrint(
//               "APNS Token not available, trying to get FCM token anyway ...");
//
//           try {} catch (err) {
//             debugPrint("FCM Token not available ($err)");
//           }
//         }
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         print('User granted provisional permission');
//       } else {
//         print('User declined or has not accepted permission');
//       }
//     } else {
//       final cashFcmToken = locator.get<AppManagerLocal>().getFCMToken();
//       FirebaseMessaging messaging = FirebaseMessaging.instance;
//       String token = await messaging.getToken() ?? '';
//       log('fcm token from cashe${locator.get<AppManagerLocal>().getFCMToken()}');
//       if (cashFcmToken == null || token != cashFcmToken) {
//         context.read<AppManagerBloc>().add(
//               SaveFcmTokenEvent(
//                 saveFcmTokenParams:
//                     SaveFcmTokenParams(tokenType: "MOBILE", fcmToken: token),
//               ),
//             );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => IndexBloc(),
//       child: const Scaffold(
//         // bottomNavigationBar: CustomNavigationBar(),
//         body: BodyRoot(),
//       ),
//     );
//   }
// }
