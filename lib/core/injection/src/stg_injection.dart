//
// import '../../../features/services/stg/data/data_source/remote/stg_data_source.dart';
// import '../../../features/services/stg/data/repo/stg_imp.dart';
// import '../../../features/services/stg/presentation/state/stg_bloc.dart';
// import '../../common/network/dio/dio_client.dart';
// import '../injection.dart';
//
// Future? StgInject() {
//   locator.registerSingleton(StgRemote(dioClient: locator.get<DioClient>()));
//   // locator.registerSingleton(
//   // WeekProgramLocal(cashHelper: locator.get<CashHelper>()));
//   locator.registerSingleton(
//     StgRepoImp(
//       networkInfo: locator(),
//       tscRemote: locator.get<StgRemote>(),
//     ),
//   );
//   locator.registerFactory(
//     () => StgBloc(
//       tscRepoImp: locator.get<StgRepoImp>(),
//     ),
//   );
//   return null;
// }
