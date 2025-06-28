// import 'dart:async';
//
// import 'package:ct_ses_connect/app/infrastructure/data_source/local/auth_local.dart';
// import 'package:ct_ses_connect/core/error/src/exceptions.dart';
// import 'package:ct_ses_connect/core/error/src/interceptors.dart';
// import 'package:ct_ses_connect/injection/injection.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// class DioClient with DioMixin {
//   // final BuildContext context;
//
//   DioClient({
//     required this.baseUrl,
//     // required this.context,
//     List<Interceptor> interceptors = const [],
//     BaseOptions? baseOptions,
//   }) {
//     httpClientAdapter = HttpClientAdapter();
//     options = baseOptions ?? BaseOptions();
//     options
//       ..baseUrl = baseUrl
//       ..followRedirects = true
//       ..headers = {
//         'Content-Type': Headers.jsonContentType,
//         'Accept': Headers.jsonContentType,
//         'Transfer-Encoding': 'chunked',
//       };
//
//     this.interceptors.addAll([
//       // RegistryInterceptor(),
//       TokenInterceptor(),
//       if (kDebugMode) logInterceptor,
//       // LocalizationInterceptor(context),
//       ...interceptors,
//       errorInterceptor,
//     ]);
//   }
//
//   final String baseUrl;
//
//   @override
//   Future<Response<T>> get<T>(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return _handleRemoteCalls(
//       () => super.get(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         onReceiveProgress: onReceiveProgress,
//         cancelToken: cancelToken,
//       ),
//     );
//   }
//
//   @override
//   Future<Response<T>> post<T>(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return _handleRemoteCalls(
//       () => super.post(
//         path,
//         data: data,
//         options: options,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       ),
//     );
//   }
//
//   @override
//   Future<Response<T>> put<T>(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) {
//     return _handleRemoteCalls(
//       () => super.put(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       ),
//     );
//   }
//
//   @override
//   Future<Response<T>> delete<T>(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) {
//     return _handleRemoteCalls(
//       () => super.delete(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       ),
//     );
//   }
//
//   @override
//   Future<Response> download(
//     String urlPath,
//     dynamic savePath, {
//     ProgressCallback? onReceiveProgress,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//     bool deleteOnError = true,
//     String lengthHeader = Headers.contentLengthHeader,
//     Object? data,
//     Options? options,
//   }) {
//     return _handleRemoteCalls(
//       () => super.download(
//         urlPath,
//         savePath,
//         onReceiveProgress: onReceiveProgress,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         deleteOnError: deleteOnError,
//         lengthHeader: lengthHeader,
//         data: data,
//         options: options,
//       ),
//     );
//   }
// }
//
// class RegistryInterceptor extends Interceptor {
//   @override
//   Future<dynamic> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     options.headers.addAll(
//         {'X-Registry-Key': 'e8beb2913dad46d91d8c00787e5a7be0'});
//     handler.next(options);
//   }
// }
//
// class TokenInterceptor extends Interceptor {
//   @override
//   Future<dynamic> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (getIt.isRegistered<AuthLocal>()) {
//       final token = getIt<AuthLocal>().getToken();
//       if (token != null &&
//           !options.path
//               .contains('s3.eu-central-003.backblazeb2.com')) {
//         options.headers.addAll({'Authorization': 'Bearer $token'});
//       }
//     }
//     handler.next(options);
//   }
// }
//
// Future<T> _handleRemoteCalls<T>(FutureOr<T> Function() method) async {
//   try {
//     return await method();
//   } on DioException catch (err) {
//     if (err.error is AppException) {
//       throw AppException((err.error! as AppException).message, err);
//     } else {
//       throw AppException.unknown(
//         exception: err,
//       );
//     }
//   }
// }
//
// final logInterceptor = LogInterceptor(
//   responseBody: true,
//   error: true,
//   requestHeader: true,
//   responseHeader: true,
//   request: true,
//   requestBody: true,
// );