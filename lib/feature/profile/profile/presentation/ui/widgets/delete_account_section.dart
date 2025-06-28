import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/widgets/custom_alert_dialog.dart';
import '../../../../../../core/common/widgets/loader_widget.dart';
import '../../state/profile_bloc.dart';

class DeleteAccountSection extends StatelessWidget {
  const DeleteAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: () async {
    //     showAdaptiveDialog(
    //       context: context,
    //       builder: (context) =>
    //           BlocProvider(
    //             create: (context) => locator.get<ProfileBloc>(),
    //             child: BlocConsumer<ProfileBloc, ProfileState>(
    //               listener: (context, state) {
    //                 if (state.deleteAccountState.isSuccess()) {
    //                   locator.get<AuthLocal>().removeAuthToken();
    //                   // locator.get<AuthLocal>().removeRefreshToken();
    //                   locator.get<AppManagerLocal>().removeFCMToken();
    //                   Navigator.pushNamedAndRemoveUntil(
    //                     context,
    //                     RoutesNames.splash,
    //                         (Route route) => false,
    //                   );
    //                 }
    //                 if (state.deleteAccountState.isFail()) {
    //                   showSnackBar(
    //                       message: state.deleteAccountState.error ?? '',
    //                       icon: Icons.check,
    //                       context: context);
    //                 }
    //               },
    //               builder: (context, state) {
    return ModalProgressHUD(
      //state.deleteAccountState.isLoading(),
      inAsyncCall: false,
      color: AppColors.primaryColor.withValues(alpha: 0.6),
      progressIndicator: LoaderWidget(),
      child: CustomAlertDialog(
        title: AppLocalizations.of(context)!.delete_account,
        isTranslatedTitle: false,
        content: Text(
          AppLocalizations.of(context)!.are_you_sure_you_want_to_log_out,
        ),
        hasDivider: true,
        acceptButtonNameKey: AppLocalizations.of(context)!.confirm,
        onAcceptButtonPressed: () {
          context.read<ProfileBloc>().add(DeleteAccountEvent());
          // Navigator.pop(context);
        },
      ),
    );
  }
}
//       child: Container(
//         // height: 50,
//         width: getWidthScreen(context),
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8), color: Colors.white),
//         child: Row(
//           children: [
//             CustomText(
//               text: 'حذف حســابي',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.redAccent,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Spacer(),
//             Icon(
//               Icons.delete_outline,
//               color: Colors.redAccent,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
