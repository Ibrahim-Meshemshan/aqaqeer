// // في general_injection.dart
// import '../../common/storage/cash_helper.dart';
// import '../injection.dart';
//
// void registerGeneralDependencies() {
//   locator.registerSingleton<CashHelper>(CashHelper());
//
//   // أو إذا كان يحتاج إلى تهيئة غير متزامنة
//   locator.registerSingletonAsync<CashHelper>(() async {
//     final cashHelper = CashHelper();
//
//     return cashHelper;
//   });
// }