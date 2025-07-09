import 'package:dio/dio.dart';

import '../../../../feature/auth/data/data_source/local/local.dart';
import '../../../injection/injection.dart';
import '../../constant/strings.dart';
import '../error_handler.dart';
import '../failure.dart';

Failure getDioException(DioException error) {
  if (error.response != null && error.response?.statusCode != null) {
    final statusCode = error.response!.statusCode!;
    switch (error.type) {
      case DioExceptionType.connectionError:
        return DataSource.CONNECTION_ERROR.getFailure();
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        final errorData = error.response?.data;
        // error
        final message = errorData?["error"] ?? errorData?["message"];

        final errorCode = errorData?["error_code"];
        if (errorCode == AppStrings.strTokenFailed) {
          return Failure(statusCode, errorCode);
        }
        if (errorCode == AppStrings.strPasswordMustChange) {
          locator.get<AuthLocal>().saveLogInToken(errorData['data']['TOKEN']);
          locator
              .get<AuthLocal>()
              .saveAuthFullName(errorData['data']['EXTRA']['FULL_NAME']);
          locator
              .get<AuthLocal>()
              .saveAuthUserName(errorData['data']['USERNAME']);
          locator
              .get<AuthLocal>()
              .saveRememberToken(errorData['data']['REMEMBER_TOKEN']);
          return Failure(statusCode, errorCode);
        }

        if (errorCode == 'TRS:DOES_NOT_HAVE_PERMISSION_TODAY') {
          return Failure(statusCode, message);
        }
        if (errorCode != null) {
          if (errorCode != "") {
            return getKnownErrors(
                error: errorCode, code: statusCode, errorMessage: message);
          } else {
            return getKnownErrors(
                error: message, code: statusCode, errorMessage: message);
          }
        } else if (message != null) {
          return getKnownErrors(
            error: message,
            code: statusCode,
          );
        } else {
          return DataSource.DEFAULT.getFailure();
        }

      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:
        return DataSource.UNKNOWN.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BADCERTIFCAITE.getFailure();
    }
  } else {
    return DataSource.DEFAULT.getFailure();
  }
}
