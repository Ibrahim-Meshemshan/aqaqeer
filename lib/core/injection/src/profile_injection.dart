
import '../../../feature/profile/profile/data/data_source/profile_remote.dart';
import '../../../feature/profile/profile/data/repo/profile_repo_impl.dart';
import '../../../feature/profile/profile/presentation/state/profile_bloc.dart';
import '../injection.dart';

Future? profileInject () {
  locator.registerSingleton(ProfileRemote());
  locator.registerSingleton(ProfileRepoImpl(remote: locator(), networkInfo: locator()));
  locator.registerFactory(()=>ProfileBloc(repoImpl: locator.get<ProfileRepoImpl>()));
  return null;
}