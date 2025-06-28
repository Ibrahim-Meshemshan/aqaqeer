import '../../../feature/notification/data/data_source/remote/notification_remote.dart';
import '../../../feature/notification/data/repo/repo_notifier_imp.dart';
import '../../../feature/notification/presesnation/state/notification_bloc.dart';
import '../injection.dart';

Future? notificationInject() {
  locator.registerSingleton(NotifierRemote());

  locator.registerSingleton(
      NotifierRepoImp(remote: locator(), networkInfo: locator()));

  locator.registerFactory(() => NotificationBloc(repoImp: locator()));
  return null;
}
