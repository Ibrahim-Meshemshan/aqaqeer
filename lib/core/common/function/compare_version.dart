import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../injection/injection.dart';
import '../config/lang/app_localizations.dart';
import '../config/theme/src/colors.dart';
import '../config/theme/src/styles.dart';
import '../constant/strings.dart';

Future<void> compareVersion(BuildContext context) async {
  // if min > appVersion => stop
  String minVersion = locator.get<AppManagerLocal>().getCustomer()?.data?.aNDROIDMINIMUMVERSION??'';
  String currentVersion =  locator.get<AppManagerLocal>().getCustomer()?.data?.aNDROIDMINIMUMVERSION??'' ;
  String minVersionIos = locator.get<AppManagerLocal>().getCustomer()?.data?.iOSMINIMUMVERSION??'';
  String currentVersionIos =  locator.get<AppManagerLocal>().getCustomer()?.data?.iOSCURRENTVERSION??'' ;

  //  تحديث إجباري
  int comparisonResult = minVersion.compareTo(AppStrings.appVersion);
  // تحديث اختياري
  int comparisonCurrentResult = currentVersion.compareTo(AppStrings.appVersion);
  //  تحديث إجباري IOS
  int comparisonResultIos = minVersionIos.compareTo(AppStrings.appVersion);
  //  تحديث اختياري IOS
  int comparisonCurrentResultIos = currentVersionIos.compareTo(AppStrings.appVersion);


  if (comparisonResult > 0) {
    //  تحديث إجباري
    if (kDebugMode) {
      print('minVersion is greater than ver');
      print('mandatory update');
    }

    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog.adaptive(
            title: Text(
              AppLocalizationsOld.of(context)!.translate('attention'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              AppLocalizationsOld.of(context)!.translate('update_app'),
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
                  ('yes').tr(context),
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  if (comparisonCurrentResult > 0) {

    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false ,
          child: AlertDialog.adaptive(
            title: Text(
              AppLocalizationsOld.of(context)!.translate('attention'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              AppLocalizationsOld.of(context)!.translate('update_app'),
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
                  Navigator.pop(context);
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
  if (comparisonResultIos > 0) {
    //  تحديث إجباري IOS

    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false ,
          child: AlertDialog.adaptive(
            title: Text(
              AppLocalizationsOld.of(context)!.translate('attention'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              AppLocalizationsOld.of(context)!.translate('update_app'),
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
  if (comparisonCurrentResultIos > 0) {

    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false ,
          child: AlertDialog.adaptive(
            title: Text(
              AppLocalizationsOld.of(context)!.translate('attention'),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              AppLocalizationsOld.of(context)!.translate('update_app'),
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
                  Navigator.pop(context);
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
