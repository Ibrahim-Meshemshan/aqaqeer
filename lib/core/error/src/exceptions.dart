// import 'package:ct_ses_connect/common/localization/app_localizations.dart';
// import 'package:ct_ses_connect/common/resources/resources.dart';
// import 'package:ct_ses_connect/injection/injection.dart';
//
// class AppException implements Exception {
//   AppException(this.message, this.innerException);
//
//   factory AppException.unknown({
//     String? message,
//     Exception? exception,
//   }) =>
//       AppException(
//         message ??  getIt<AppLocalizations>().some_error_has_occurred,
//         exception ?? Exception(),
//       );
//   final String message;
//
//   final Exception innerException;
//
//   @override
//   String toString() =>
//       'message : $message, innerException: $innerException';
// }
//
// class DatabaseException extends AppException {
//   DatabaseException(Exception innerException)
//       : super(kDatabaseErr, innerException);
// }
//
// //to add exceptions when we want