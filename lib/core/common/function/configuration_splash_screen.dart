import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feature/auth/data/data_source/local/local.dart';
import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../../feature/root/state/app_manager_state/app_manager_bloc.dart';
import '../../injection/injection.dart';
import '../config/lang/app_localizations.dart';
import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';

AuthLocal authLocal = locator.get<AuthLocal>();

startTimer(
  BuildContext context,
) async {
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String token = await messaging.getToken() ?? '';
  WidgetsBinding.instance.addPostFrameCallback((_) {
    navigate(context);
  });
  Future.delayed(const Duration(milliseconds: 4000), () {});
}

navigate(
  BuildContext context,
) async {
  log('inside the splash===================================**************************');
  TextEditingController textController = TextEditingController();

  if (authLocal.getAuthToken() == null) {
    log('------------- (splash) the token is null--------------');
    //print(authLocal.getAuthToken());
    // Create a BuildContext variable
    await showDialog(
      // showAdaptiveDialog after updating flutter
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          // onWillPop: () async {
          //   SystemNavigator.pop();
          //   return false;
          // },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            title: Text(
              ('company_code').tr(context),
              style: CustomTextStyle.titleLarge(context,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    controller: textController,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primaryGray,
                      hintText: 'XXX',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        final AppManagerBloc bloc =
                            context.read<AppManagerBloc>();
                        bloc.add(GetAppInfo(clientCode: textController.text));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 1,
                        // padding: buttonRPadding.r,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      child: Text(
                        ('ok').tr(context),
                        style: CustomTextStyle.titleMedium(context,
                            color: AppColors.white),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );

    //
  } else {
    if (locator.get<AppManagerLocal>().getClientCode() != null) {
      context.read<AppManagerBloc>().add(GetAppInfo(clientCode: locator.get<AppManagerLocal>().getClientCode() ?? ''),);
    }
    log('------------- (splash) the token is exit--------------');
    await Future.delayed(const Duration(milliseconds: 250), () {},);
  }
}
