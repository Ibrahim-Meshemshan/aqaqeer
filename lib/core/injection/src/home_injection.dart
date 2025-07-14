import '../../../feature/home/data/data_source/remote/home_remote.dart';
import '../../../feature/home/data/repo/home_repo_imp.dart';
import '../../../feature/home/presentation/state/home_bloc.dart';
import '../../common/network/netword_info.dart';
import '../injection.dart';

Future? homeInject() {

  locator.registerSingleton(HomeRemoteImp());

  locator.registerSingleton(HomeRepoImp(
    homeRemote: locator.get<HomeRemoteImp>(),
    networkInfo: locator.get<NetworkInfo>(),
  ));

  locator.registerFactory(() => HomeBloc(locator.get<HomeRepoImp>()));
  return null;
}
