import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../injection/injection.dart';
import '../config/lang/app_localizations.dart';
import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';

Future<void> isAppUnderMaintenance(BuildContext context) async {
  String isUnderMaintenance = locator.get<AppManagerLocal>().getCustomer()?.data?.mAINTENANCE??'';
  // print("isUnderMaintenance $isUnderMaintenance");
  if (isUnderMaintenance =='Y') {
    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog.adaptive(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            title: Column(
              children: [
                Text(
                  ('attention').tr(context),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider()
              ],
            ),
            content: Text(
              locator.get<AppManagerLocal>().getCustomer()?.data?.mAINTENANCEMESSAGE??'',
              textAlign: TextAlign.start,
              style: CustomTextStyle.headlineSmall(
                context,
              )?.copyWith(
                height: 2,
                fontSize: 18,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 1,
                  // padding: buttonRPadding.r,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  AppLocalizationsOld.of(context)!.translate('yes'),
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}