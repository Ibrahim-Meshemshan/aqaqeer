// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//
// import '../../../../../../core/common/config/lang/app_localizations.dart';
// import '../../../../../../core/common/config/theme/src/colors.dart';
// import '../../../../../../core/common/helper/app_uitls.dart';
// import '../../../../../../core/common/widgets/ui/custom_circular_progress.dart';
// import '../../../../../../core/injection/injection.dart';
// import '../../../../../../core/routes/routes.dart';
// import '../../../../../profile/presentaion/ui/widget/custom_app_bar_profile.dart';
// import '../../../../../profile/presentaion/ui/widget/section/body_profile_change_password.dart';
// import '../../../../data/data_source/local/local.dart';
// import '../../state/log_in_bloc.dart';
//
// class MustChangePasswordScreen extends StatefulWidget {
//   const MustChangePasswordScreen({super.key});
//
//   @override
//   State<MustChangePasswordScreen> createState() =>
//       _MustChangePasswordScreenState();
// }
//
// class _MustChangePasswordScreenState extends State<MustChangePasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => locator.get<LoginBloc>(),
//       child: BlocConsumer<LoginBloc, LoginState>(
//         listener: (context, state) async {
//           if (state.changePasswordState.isSuccess()) {
//             locator
//                 .get<AuthLocal>()
//                 .saveLogInToken(locator.get<AuthLocal>().getLogInToken() ?? '');
//             AppUtils.snackBarMessage(
//               context: context,
//               message: AppLocalizations.of(context)!.translate('success'),
//               icon: Icons.check_circle_outline,
//             );
//             await Future.delayed(const Duration(milliseconds: 750), () {});
//             Navigator.of(context).pushNamedAndRemoveUntil(
//               Routes.mainRootPage,
//               (route) => false,
//             );
//           } else if (state.changePasswordState.isFail()) {
//             AppUtils.snackBarMessage(
//               context: context,
//               message: state.changePasswordState.error ??
//                   AppLocalizations.of(context)!.translate('error'),
//               icon: Icons.warning_amber,
//             );
//           }
//         },
//         builder: (context, state) {
//           return ModalProgressHUD(
//             inAsyncCall: state.changePasswordState.isLoading(),
//             progressIndicator: const CustomCircularProgress(),
//             child: Scaffold(
//               backgroundColor: AppColors.white,
//               appBar: PreferredSize(
//                 preferredSize:
//                     Size.fromHeight(MediaQuery.sizeOf(context).height * .1),
//                 child: CustomAppBarProfile(
//                   title: AppLocalizations.of(context)!.translate('reset_pass'),
//                 ),
//               ),
//               body: SizedBox(
//                 height: MediaQuery.sizeOf(context).height * .9,
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 20,
//                     ),
//                     child: BodyProfileChangePassword(),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
