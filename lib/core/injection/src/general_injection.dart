import 'package:shared_preferences/shared_preferences.dart';
import '../../../feature/auth/data/data_source/local/local.dart';
import '../../../feature/root/app_manager/domain/entity/device_info_param.dart';
import '../../common/network/dio/dio_client.dart';
import '../../common/network/dio/dio_factory.dart';
import '../../common/network/netword_info.dart';
import '../../common/storage/cash_helper.dart';
import '../injection.dart';

class Instance {
 static SharedPreferences? _instance;

 static Future<SharedPreferences> instance() async {
  if (_instance != null) {
   return _instance!;
  } else {
   return await SharedPreferences.getInstance();
  }
 }
}

Future? generalInject() async {
 locator.registerLazySingleton<DeviceInfoParam>(() => DeviceInfoParam());
 locator.registerSingleton<SharedPreferences>(await Instance.instance());
 locator.registerSingleton<CashHelper>(CashHelper(locator.get<SharedPreferences>()));



 //NetworkInfo instance
 // locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
 // print("${GetIt.I.isRegistered<NetworkInfo>()} " + "NetworkInfo");
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

 //DioFactory instance
 locator.registerLazySingleton<DioFactory>(() => DioFactory(cashHelper: locator()));
 locator.registerSingleton(AuthLocal(cashHelper: locator.get<CashHelper>()));
 final dio = await locator<DioFactory>().getDio();

 //AppServiceClient instance
 locator.registerLazySingleton(() => DioClient(dio));


 return null;
}
