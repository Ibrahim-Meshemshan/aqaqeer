// import 'package:hive/hive.dart';
//
// import '../../../features/services/transport/data/data_source/local.dart';
// import '../../../features/services/transport/data/data_source/remote.dart';
// import '../../../features/services/transport/data/models/student_info.dart';
// import '../../../features/services/transport/data/models/trip_info.dart';
// import '../../../features/services/transport/data/models/trip_line_info.dart';
// import '../../../features/services/transport/data/models/violation_info.dart';
// import '../../../features/services/transport/data/repo/imp_repo.dart';
// import '../../../features/services/transport/domain/entities/param_register_student_state.dart';
// import '../../../features/services/transport/presentation/bloc/stored_data_bloc/stored_data_bloc.dart';
// import '../../../features/services/transport/presentation/bloc/transport_bloc.dart';
// import '../injection.dart';
//
// Future? transportInject() async {
// //key
//   const tripKey = 'trip';
//   //box
//   final tripsBox = await Hive.openBox<TripInfo?>(tripKey);
//   //key
//   const violationKey = 'violation';
//   //box
//   final violationBox = await Hive.openBox<ViolationType?>(violationKey);
//   //key
//   const studentKey = 'student';
//   //box
//   final studentBox = await Hive.openBox<StudentInfo?>(studentKey);
//   //key
//   const tripLineKey = 'trip_Line';
//   //box
//   final tripsLineBox = await Hive.openBox<TripLineInfo?>(tripLineKey);
//   //key
//   const registerViolationKey = 'register_violation';
//   //box
//   final registerViolationBox =
//       await Hive.openBox<ParamRegister?>(registerViolationKey);
//
//   //locator.registerSingleton(TransportValue());
//   locator.registerSingleton(TransportRemote(dioClient: locator()));
//   locator.registerSingleton(TransportLocal(
//     cashHelper: locator(),
//       violationBox: violationBox,
//       settingBox: studentBox,
//       tripBox: tripsBox,
//       tripLineBox: tripsLineBox,
//       registerViolationsBox: registerViolationBox));
//   locator.registerSingleton(
//     TransportImpRepo(
//       transportRemote: locator(),
//       networkInfo: locator(),
//       local: locator(),
//     ),
//   );
//   locator.registerFactory(() => TransportBloc(transportImpRepo: locator(), networkInfo: locator()));
//   locator.registerFactory(() => StoredDataBloc(repo: locator()));
//   return null;
// }
