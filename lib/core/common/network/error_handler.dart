// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../feature/app.dart';
import '../../injection/injection.dart';
import '../constant/strings.dart';
import 'dio/exceptions.dart';
import 'failure.dart';
import 'netword_info.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = getDioException(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}



Failure getKnownErrors({
  required String error,
  required int code,
  String? errorMessage,
}) {
  var mContext = navigatorKey.currentState!.context;

  switch (error) {
    case 'API:LOGIN_FAILED':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.LOGIN_FAILED.tr(mContext));
    case 'API:PASSWORD_MUST_CHANGE':
      return Failure(ResponseCode.DEFAULT,
          ResponseErrorKnown.PASSWORD_MUST_CHANGE.tr(mContext));
    case 'API:TOKEN_FAILED':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED.tr(mContext));
    case 'Authentication failed':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED.tr(mContext));
    case "API:CURRENT_PASSWORD_NOT_CORRECT":
      return Failure(ResponseCode.DEFAULT,
          ResponseErrorKnown.PASSWORD_NOT_CORRECT.tr(mContext));
    case "Current password not correct":
      return Failure(ResponseCode.DEFAULT,
          ResponseErrorKnown.PASSWORD_NOT_CORRECT.tr(mContext));
    case 'MISSING_DATA':
      return Failure(ResponseCode.DEFAULT, "missing_data".tr(mContext));
    case 'WRONG_DATA_FOR_MATERIAL':
      return Failure(ResponseCode.DEFAULT, "wrong_data_material".tr(mContext));
    case 'MISSING_ATTRIBUTE':
      return Failure(ResponseCode.DEFAULT, "missing_attribute".tr(mContext));
    case 'UNIT_ID_NOT_RELATED_TO_THIS_MATERIAL':
      return Failure(ResponseCode.DEFAULT, 'unit_not_related'.tr(mContext));
    case 'SERIAL_NUMBER_ALREADY_FOUND':
      return Failure(ResponseCode.DEFAULT, 'serial_number_error'.tr(mContext));
    case 'ROOM_ID_NOT_FOUND':
      return Failure(ResponseCode.DEFAULT, 'room_error'.tr(mContext));
    case 'CAN_NOT_DELETE_USED_ATTRIBUTE_VALUE':
      return Failure(ResponseCode.DEFAULT,
          'con_not_delete_used_attribute_value'.tr(mContext));
    case 'CAN_NOT_DELETE_USED_UNIT':
      return Failure(
          ResponseCode.DEFAULT, 'con_not_delete_used_unit'.tr(mContext));
    case 'SERIAL_NUMBERS_MUST_EQUAL_AMOUNT':
      return Failure(ResponseCode.DEFAULT, 'serial_number_error'.tr(mContext));
    case 'TRS:DOES_NOT_HAVE_PERMISSION_TODAY':
      return Failure(ResponseCode.DEFAULT, 'serial_number_error'.tr(mContext));

    default:
      return Failure(code, error,error: errorMessage);
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
  BADCERTIFCAITE,
  UNKNOWN,
  CONNECTION_ERROR,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    var mContext = navigatorKey.currentState!.context;
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            ResponseCode.SUCCESS, ResponseMessage.SUCCESS.tr(mContext));
      case DataSource.NO_CONTENT:
        return Failure(
            ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT.tr(mContext));
      case DataSource.BAD_REQUEST:
        return Failure(
            ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST.tr(mContext));
      case DataSource.FORBIDDEN:
        return Failure(
            ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN.tr(mContext));
      case DataSource.UNAUTORISED:
        return Failure(
            ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED.tr(mContext));
      case DataSource.NOT_FOUND:
        return Failure(
            ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND.tr(mContext));
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR.tr(mContext));
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT,
            ResponseMessage.CONNECT_TIMEOUT.tr(mContext));
      case DataSource.CANCEL:
        return Failure(
            ResponseCode.CANCEL, ResponseMessage.CANCEL.tr(mContext));
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT,
            ResponseMessage.RECIEVE_TIMEOUT.tr(mContext));
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT,
            ResponseMessage.SEND_TIMEOUT.tr(mContext));
      case DataSource.CACHE_ERROR:
        return Failure(
            ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR.tr(mContext));
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION.tr(mContext));
      case DataSource.DEFAULT:
        return Failure(
            ResponseCode.DEFAULT, ResponseMessage.DEFAULT.tr(mContext));
      case DataSource.UNKNOWN:
        return Failure(
            ResponseCode.DEFAULT, ResponseMessage.UNKNOWN.tr(mContext));
      case DataSource.BADCERTIFCAITE:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.BADCERTIFCAITE.tr(mContext));

      case DataSource.CONNECTION_ERROR:
        return Failure(ResponseCode.DEFAULT, 'connection_error'.tr(mContext));
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CONNECTION_ERROR = AppStrings.strConnectionError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
  static const String UNKNOWN = AppStrings.strUnknownError;
  static const String BADCERTIFCAITE = AppStrings.strNotFoundError; // failure, crash in server side
}

class ResponseErrorKnown {
  static const String LOGIN_FAILED = AppStrings.strLoginFail;
  static const String PASSWORD_MUST_CHANGE = AppStrings.strPasswordMustChange;
  static const String TOKEN_FAILED = AppStrings.strTokenFailed;
  static const String PASSWORD_NOT_CORRECT = AppStrings.strPasswordNotCorrect;
}

/// To use in repo
Future<Either<Failure, U>> handelCall<U>(
    FutureOr<U> Function() call ) async {
  if (await locator.get<NetworkInfo>().isConnected) {
    try {
      return Right(await call());
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  } else {
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}

///To use in remote
Future<T> handelDioResponse<T>(FutureOr<T> Function() call) async {
  try {
    return await call();
  } on DioException catch (e) {
    throw ErrorHandler.handle(e).failure;
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    rethrow;
    // throw AppException.unknown();
  }
}
