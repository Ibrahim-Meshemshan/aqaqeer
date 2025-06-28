// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:my_katateeb/features/auth/presentation/login/widget/qr_login.dart';
// import '../../../../../core/common/config/lang/app_localizations.dart';
// import '../../../../../core/common/config/theme/src/colors.dart';
// import '../../../../../core/common/config/theme/src/styles.dart';
// import '../../../../../core/injection/injection.dart';
// import '../../../data/data_source/local/local.dart';
// import '../../../domain/entities/login_params.dart';
// import '../state/log_in_bloc.dart';
// import '../state/provider/login_params_provider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class QrCodeLoginSection extends StatelessWidget {
//   final LoginBloc bloc;
//
//   const QrCodeLoginSection({super.key, required this.bloc});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 30.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//                ('login_with').tr(context),
//               style: CustomTextStyle.titleSmall(context),
//             ),
//             InkWell(
//               onTap: () async {
//                 Navigator.of(context)
//                     .push(
//                   MaterialPageRoute(
//                     builder: (context) => const QRViewLogin(),
//                   ),
//                 )
//                     .then(
//                   (value) {
//                     log('the name is ${context.read<LoginParamProvider>().name} \n the remember token is ${context.read<LoginParamProvider>().token} ');
//                     LoginParams params = LoginParams(
//                       userName: context.read<LoginParamProvider>().name ?? '',
//                       rememberToken: context.read<LoginParamProvider>().token ?? '',
//                     );
//                     locator.get<AuthLocal>().saveRememberToken(
//                         context.read<LoginParamProvider>().token ?? '');
//                     log('the params is   ${params.rememberToken} and    ${params.userName}');
//                     bloc.add(
//                       Login(
//                         loginParams: params,
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Text(
//                 ' QR CODE',
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
