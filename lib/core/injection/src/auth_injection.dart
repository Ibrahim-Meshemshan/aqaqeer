import 'package:aqaqeer/feature/auth/presentation/sign_up/presentation/state/bloc/sign_up_bloc.dart';

import '../../../feature/auth/data/data_source/local/local.dart';
import '../../../feature/auth/data/data_source/remote/auth_remote.dart';
import '../../../feature/auth/data/repo/auth_repository_impl.dart';
import '../../../feature/auth/presentation/login/state/log_in_bloc.dart';
import '../../../feature/auth/presentation/sign_up/presentation/state/sign_up_provider.dart';
import '../../common/network/dio/dio_client.dart';
import '../../common/network/dio/dio_factory.dart';
import '../injection.dart';

Future? authInject() async {

  locator.registerLazySingleton(()=>SignUpProvider());

  locator.registerSingleton(AuthRemote(
    dioClient: locator.get<DioClient>(),
    dio: await locator<DioFactory>().getDio(),
  ));

  locator.registerSingleton(AuthRepositoryImpl(
      remote: locator.get<AuthRemote>(),
      local: locator.get<AuthLocal>(),
      networkInfo: locator()));

  locator.registerFactory(() => LoginBloc(authRepositoryImpl: locator.get<AuthRepositoryImpl>()));
  locator.registerFactory(() => SignUpBloc(authRepositoryImpl: locator.get<AuthRepositoryImpl>()));
  return null;
}

