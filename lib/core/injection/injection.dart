import 'package:aqaqeer/core/common/config/lang/state/language_bloc.dart';
import 'package:aqaqeer/core/common/config/lang/state/store_current_lang.dart';
import 'package:aqaqeer/core/injection/src/app_manager_injection.dart';
import 'package:aqaqeer/core/injection/src/auth_injection.dart';
import 'package:aqaqeer/core/injection/src/home_injection.dart';
import 'package:aqaqeer/core/injection/src/language_storage_injection.dart';
import 'package:aqaqeer/core/injection/src/notification_injection.dart';
import 'package:aqaqeer/core/injection/src/profile_injection.dart';
import 'package:get_it/get_it.dart';


import 'src/general_injection.dart';


final locator = GetIt.instance;

Future initInjection() async {

  await generalInject();
  await langInject();
  await authInject();
  await homeInject();
  await profileInject();
  await appManagerInject();
  await notificationInject();

  // await transportInject();
  // await inventoryInjection();
  // await studentsAbsencesInject();
  // await StgInject();

}
