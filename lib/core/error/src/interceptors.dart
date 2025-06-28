// import 'package:ct_ses_connect/core/error/src/dio_exceptions.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'exceptions.dart';
// import 'http_client.dart';
//
// /// This [Interceptor] should be the final interceptor in the queue because it is responsible of throw exception that will be caught by [throwAppException] in th get/post/put/delete methods in [DioClient]
// /// and will not invoke handler.next() so it must be the final Interceptor
// class ErrorInterceptor extends Interceptor {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     final reason = err.reason;
//     var toThrow = err;
//     if (reason != null) {
//       toThrow = err.copyWith(error: AppException(reason.message, err));
//     } else {
//       toThrow = err.copyWith(error: AppException.unknown(exception: err));
//     }
//     throw toThrow;
//   }
// }
//
// class LocalizationInterceptor extends Interceptor {
//   LocalizationInterceptor(this.context);
//   final BuildContext context;
//
//   @override
//   Future<dynamic> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     //todo
//     // options.headers.addAll({'Accept-Language': AppLocalizations.of(context)!.localeName});
//     handler.next(options);
//   }
// }
//
// final ErrorInterceptor errorInterceptor = ErrorInterceptor();