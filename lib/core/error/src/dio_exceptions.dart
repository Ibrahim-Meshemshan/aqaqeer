// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// sealed class AppNetworkExceptionReason {
//   AppNetworkExceptionReason(this.message);
//
//   final String message;
// }
//
// class ServerError implements AppNetworkExceptionReason {
//   ServerError([String? msg]) {
//     message = msg ?? getIt<AppLocalizations>().server_error;
//   }
//
//   @override
//   late final String message;
// }
//
// class Canceled implements AppNetworkExceptionReason {
//   Canceled([String? msg]) {
//     message = msg ?? getIt<AppLocalizations>().request_cancelled;
//   }
//
//   @override
//   late final String message;
// }
//
// class TimeOut implements AppNetworkExceptionReason {
//   TimeOut([String? msg]) {
//     message = msg ?? getIt<AppLocalizations>().timeout;
//   }
//
//   @override
//   late final String message;
// }
//
// class ResponseError implements AppNetworkExceptionReason {
//   ResponseError(this.message);
//
//   @override
//   final String message;
// }
//
// class Forbidden implements AppNetworkExceptionReason {
//   Forbidden([String? msg]) {
//     message = msg ?? getIt<AppLocalizations>().forbidden;
//   }
//
//   @override
//   late final String message;
// }
//
// class NoInternet implements AppNetworkExceptionReason {
//   NoInternet([String? msg]) {
//     message = msg ?? getIt<AppLocalizations>().failed_to_connect;
//   }
//
//   @override
//   late final String message;
// }
//
// extension DioErrorExtention on DioException {
//   AppNetworkExceptionReason? get reason {
//     if (response?.statusCode.toString().startsWith('5') ?? false) {
//       return ServerError();
//     }
//     if (response?.statusCode == 403) {
//       return Forbidden();
//     }
//     if (response?.statusCode == 403) {
//       return ResponseError(response?.data.toString() ?? '');
//     }
//
//     switch (type) {
//       case DioExceptionType.cancel:
//         return Canceled();
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.receiveTimeout:
//       case DioExceptionType.sendTimeout:
//         return TimeOut();
//
//       case DioExceptionType.badResponse:
//         //Todo: or some thing like this: according to error handling from backend side
//         var message = response?.statusMessage;
//         message ??= response?.data['message'] as String?;
//         message ??= response?.data['error_des'] as String?;
//         return ResponseError(message ??
//             getIt<AppLocalizations>().some_error_has_occurred);
//
//       case DioExceptionType.unknown:
//       default:
//         if (error is SocketException) {
//           return NoInternet();
//         }
//     }
//     return null;
//   }
// }