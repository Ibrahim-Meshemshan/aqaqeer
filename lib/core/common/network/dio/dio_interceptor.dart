import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../feature/root/app_manager/domain/entity/send_error_param.dart';
import '../../../../feature/root/state/app_manager_state/app_manager_bloc.dart';
import '../../../injection/injection.dart';
import '../../constant/src/app_url.dart';
import '../../function/re_auth.dart';
import '../../storage/cash_helper.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  bool _isReAuthenticating = false;
  late ErrorParam errorParam;
  Completer<void>?
  _reAuthCompleter; // Completer to notify other requests when re-authentication is complete

  DioInterceptor(this.dio);

  @override
  Future<void> onError (
      DioException err, ErrorInterceptorHandler handler) async {
    final errorMessage = err.message ?? 'Unknown error occurred';
    final stackTrace = err.toString();
    final statusCode = err.response?.statusCode?.toString();
    final response = err.response?.data?.toString();
    final requestPath = err.requestOptions.path;

    // Create the error param
    log('message before create error');
    errorParam = await createErrorParam(
        message: errorMessage,
        stackTrace: stackTrace,
        statusCode: statusCode,
        requestMethod: err.requestOptions.method,
        requestPath: requestPath,
        response: response,
        param: 'asd',
        body: 'aaa'
    );
    log('message after create error');

    // log('stack trace from dio $stackTrace');
    //
    // if (requestPath != AppUrl.sendError) {
    //   locator.get<AppManagerBloc>().add(SendError(
    //       errorParam: errorParam));
    // }

    if (err.response != null && err.response!.statusCode == 400) {
      final errorCode = err.response?.data?["error_code"];
      if (errorCode == "API:TOKEN_FAILED") {
        // If re-authentication is already in progress, do nothing
        if (_isReAuthenticating) {
          if (_reAuthCompleter != null) {
            await _reAuthCompleter!.future;
          }
          return super.onError(err, handler);
        }

        // Start re-authentication
        _isReAuthenticating = true;
        _reAuthCompleter = Completer<void>();

        // Trigger re-authentication (login)
        // await reAuth();

        // Mark re-authentication as complete
        _isReAuthenticating = false;
        _reAuthCompleter?.complete();
      }
    }
    return super.onError(err, handler);
  }
}
