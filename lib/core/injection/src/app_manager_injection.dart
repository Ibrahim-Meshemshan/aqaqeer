


import '../../../feature/root/app_manager/data/data_source/local/app_manager_local.dart';
import '../../../feature/root/app_manager/data/data_source/remote/app_manager_remote.dart';
import '../../../feature/root/app_manager/data/repo/app_manager_repo_imp.dart';
import '../../../feature/root/state/app_manager_state/app_manager_bloc.dart';
import '../../common/network/dio/dio_client.dart';
import '../../common/storage/cash_helper.dart';
import '../injection.dart';
Future? appManagerInject() {
  locator
      .registerSingleton(AppManagerRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
      AppManagerLocal(cashHelper: locator.get<CashHelper>(), ));
  locator.registerSingleton(AppManagerRepoImp(
    remote: locator.get<AppManagerRemote>(),
    local: locator.get<AppManagerLocal>(),
    networkInfo: locator(),
  ));
  locator.registerLazySingleton(() => AppManagerBloc(repoImp: locator.get<AppManagerRepoImp>()));
  return null;
}