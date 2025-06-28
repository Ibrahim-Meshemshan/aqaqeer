import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../injection/injection.dart';
import '../config/lang/app_localizations.dart';
import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';
import '../constant/strings.dart';

Future<void> compareOS(BuildContext context) async {
  if (AppStrings.operatingSystem == 'Android') {
    if (locator.get<AppManagerLocal>().getCustomer()?.data?.aCTIVATEANDROID == 'N') {
      await showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: AlertDialog.adaptive(
              backgroundColor: AppColors.white,
              surfaceTintColor: AppColors.white,
              title: Text(
                ('attention').tr(context),
                textAlign: TextAlign.center,
                style: CustomTextStyle.titleMedium(
                  context,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainRed,
                ),
              ),
              content: Text(
                AppLocalizationsOld.of(context)!.translate('os_android'),
                textAlign: TextAlign.center,
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
  } else {
    if (locator.get<AppManagerLocal>().getCustomer()!.data!.aCTIVATEANDROID == 'N') {
      await showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: AlertDialog.adaptive(
              title: Text(
                AppLocalizationsOld.of(context)!.translate('attention'),
                textAlign: TextAlign.center,
                style: CustomTextStyle.titleMedium(
                  context,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              content: Text(
                AppLocalizationsOld.of(context)!.translate('os_ios'),
                textAlign: TextAlign.center,
                style: CustomTextStyle.headlineSmall(
                  context,
                )?.copyWith(
                  height: 2,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
