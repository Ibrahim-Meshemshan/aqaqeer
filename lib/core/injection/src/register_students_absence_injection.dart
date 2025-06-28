// import '../../common/network/dio/dio_client.dart';
// import '../injection.dart';
// Future? studentsAbsencesInject () async {
//   locator.registerSingleton(StudentsAbsencesProvider());
//   locator.registerSingleton(StudentsAbsenceRemote(dioClient:  locator.get<DioClient>()));
//   locator.registerSingleton(StudentsAbsencesLocal(cashHelper: locator()));
//   locator.registerSingleton(StudentsAbsenceRepoImpl(networkInfo: locator(),studentsAbsenceRemote: locator.get<StudentsAbsenceRemote>(),));
//   locator.registerFactory( ()=> StudentsAbsencesBloc(locator.get<StudentsAbsenceRepoImpl>()));
//   return null;
// }