// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:myigate/core/common/config/lang/app_localizations.dart';
// import 'package:myigate/core/common/config/theme/src/colors.dart';
// import 'package:myigate/features/auth/domain/entities/login_params.dart';
// import '../../../../../core/common/config/theme/src/styles.dart';
// import 'package:local_auth/local_auth.dart';
//
// import '../../../../../core/injection/injection.dart';
// import '../../../data/data_source/local/local.dart';
// import '../state/log_in_bloc.dart';
//
// class FingerprintLoginSection extends StatefulWidget {
//   final LogInBloc bloc;
//
//   const FingerprintLoginSection({super.key, required this.bloc});
//
//   @override
//   State<FingerprintLoginSection> createState() =>
//       _FingerprintLoginSectionState();
// }
//
// class _FingerprintLoginSectionState extends State<FingerprintLoginSection> {
//   final LocalAuthentication auth = LocalAuthentication();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'OR',
//         ),
//         const SizedBox(
//           height: 20.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               ('login_with').tr(context),
//               style: CustomTextStyle.titleSmall(context),
//             ),
//             GestureDetector(
//               onTap: () async {
//                 final bool canAuthenticate = await auth.canCheckBiometrics;
//                 if (canAuthenticate) {
//                   final bool didAuthenticate = await auth.authenticate(
//                       localizedReason: 'Please authenticate to Login',
//                       options:
//                           const AuthenticationOptions(biometricOnly: true));
//                   log('didAuthenticate ${didAuthenticate.toString()}');
//                   if (didAuthenticate) {
//                     widget.bloc.add(
//                       Login(
//                         loginParams: LoginParams(
//                             userName:
//                                 locator.get<AuthLocal>().getAuthUserName(),
//                             rememberToken: locator
//                                 .get<AuthLocal>()
//                                 .getFingerprintRememberToken()),
//                       ),
//                     );
//                   }
//                 }
//               },
//               child: Text(
//                 ' Fingerprint',
//                 style: CustomTextStyle.titleMedium(
//                   context,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
