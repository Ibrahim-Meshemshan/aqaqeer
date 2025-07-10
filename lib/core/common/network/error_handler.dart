// // ignore_for_file: depend_on_referenced_packages, constant_identifier_names
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:aqaqeer/core/common/config/lang/app_localizations.dart';
// import 'package:dio/dio.dart';
// import 'package:either_dart/either.dart';
// import '../../../feature/app.dart';
// import '../../injection/injection.dart';
// import '../constant/strings.dart';
// import 'dio/exceptions.dart';
// import 'failure.dart';
// import 'netword_info.dart';
//
// class ErrorHandler implements Exception {
//   late Failure failure;
//
//   ErrorHandler.handle(dynamic error) {
//     if (error is DioException) {
//       // dio error so its an error from response of the API or from dio itself
//       failure = getDioException(error);
//     } else {
//       // default error
//       failure = DataSource.DEFAULT.getFailure();
//     }
//   }
// }
//
//
//
// Failure getKnownErrors({
//   required String error,
//   required int code,
//   String? errorMessage,
// }) {
//   var mContext = navigatorKey.currentState!.context;
//
//   switch (error) {
//     case 'API:LOGIN_FAILED':
//       return Failure(
//           ResponseCode.DEFAULT, ResponseErrorKnown.LOGIN_FAILED);
//     case 'API:PASSWORD_MUST_CHANGE':
//       return Failure(ResponseCode.DEFAULT,
//           ResponseErrorKnown.PASSWORD_MUST_CHANGE);
//     case 'API:TOKEN_FAILED':
//       return Failure(
//           ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED);
//     case 'Authentication failed':
//       return Failure(
//           ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED);
//     case "API:CURRENT_PASSWORD_NOT_CORRECT":
//       return Failure(ResponseCode.DEFAULT,
//           ResponseErrorKnown.PASSWORD_NOT_CORRECT);
//     case "Current password not correct":
//       return Failure(ResponseCode.DEFAULT,
//           ResponseErrorKnown.PASSWORD_NOT_CORRECT);
//     case 'MISSING_DATA':
//       return Failure(ResponseCode.DEFAULT, "missing_data");
//     case 'WRONG_DATA_FOR_MATERIAL':
//       return Failure(ResponseCode.DEFAULT, "wrong_data_material");
//     case 'MISSING_ATTRIBUTE':
//       return Failure(ResponseCode.DEFAULT, "missing_attribute");
//     case 'UNIT_ID_NOT_RELATED_TO_THIS_MATERIAL':
//       return Failure(ResponseCode.DEFAULT, 'unit_not_related');
//     case 'SERIAL_NUMBER_ALREADY_FOUND':
//       return Failure(ResponseCode.DEFAULT, 'serial_number_error');
//     case 'ROOM_ID_NOT_FOUND':
//       return Failure(ResponseCode.DEFAULT, 'room_error');
//     case 'CAN_NOT_DELETE_USED_ATTRIBUTE_VALUE':
//       return Failure(ResponseCode.DEFAULT,
//           'con_not_delete_used_attribute_value');
//     case 'CAN_NOT_DELETE_USED_UNIT':
//       return Failure(
//           ResponseCode.DEFAULT, 'con_not_delete_used_unit');
//     case 'SERIAL_NUMBERS_MUST_EQUAL_AMOUNT':
//       return Failure(ResponseCode.DEFAULT, 'serial_number_error');
//     case 'TRS:DOES_NOT_HAVE_PERMISSION_TODAY':
//       return Failure(ResponseCode.DEFAULT, 'serial_number_error');
//
//     default:
//       return Failure(code, error,error: errorMessage);
//   }
// }
//
// enum DataSource {
//   SUCCESS,
//   NO_CONTENT,
//   BAD_REQUEST,
//   FORBIDDEN,
//   UNAUTORISED,
//   NOT_FOUND,
//   INTERNAL_SERVER_ERROR,
//   CONNECT_TIMEOUT,
//   CANCEL,
//   RECIEVE_TIMEOUT,
//   SEND_TIMEOUT,
//   CACHE_ERROR,
//   NO_INTERNET_CONNECTION,
//   DEFAULT,
//   BADCERTIFCAITE,
//   UNKNOWN,
//   CONNECTION_ERROR,
//   Unprocessable_Content
// }
//
// extension DataSourceExtension on DataSource {
//   Failure getFailure() {
//     var mContext = navigatorKey.currentState!.context;
//     switch (this) {
//       case DataSource.SUCCESS:
//         return Failure(
//             ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
//       case DataSource.NO_CONTENT:
//         return Failure(
//             ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
//       case DataSource.BAD_REQUEST:
//         return Failure(
//             ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
//       case DataSource.FORBIDDEN:
//         return Failure(
//             ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
//       case DataSource.UNAUTORISED:
//         return Failure(
//             ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
//       case DataSource.NOT_FOUND:
//         return Failure(
//             ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
//       case DataSource.INTERNAL_SERVER_ERROR:
//         return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
//             ResponseMessage.INTERNAL_SERVER_ERROR);
//       case DataSource.CONNECT_TIMEOUT:
//         return Failure(ResponseCode.CONNECT_TIMEOUT,
//             ResponseMessage.CONNECT_TIMEOUT);
//       case DataSource.CANCEL:
//         return Failure(
//             ResponseCode.CANCEL, ResponseMessage.CANCEL);
//       case DataSource.RECIEVE_TIMEOUT:
//         return Failure(ResponseCode.RECIEVE_TIMEOUT,
//             ResponseMessage.RECIEVE_TIMEOUT);
//       case DataSource.SEND_TIMEOUT:
//         return Failure(ResponseCode.SEND_TIMEOUT,
//             ResponseMessage.SEND_TIMEOUT);
//       case DataSource.CACHE_ERROR:
//         return Failure(
//             ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
//       case DataSource.NO_INTERNET_CONNECTION:
//         return Failure(ResponseCode.NO_INTERNET_CONNECTION,
//             ResponseMessage.NO_INTERNET_CONNECTION);
//       case DataSource.DEFAULT:
//         return Failure(
//             ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
//       case DataSource.UNKNOWN:
//         return Failure(
//             ResponseCode.DEFAULT, ResponseMessage.UNKNOWN);
//       case DataSource.BADCERTIFCAITE:
//         return Failure(ResponseCode.DEFAULT, ResponseMessage.BADCERTIFCAITE);
//       case DataSource.Unprocessable_Content:
//         return Failure(ResponseCode.DEFAULT, 'غلط');
//       case DataSource.CONNECTION_ERROR:
//         return Failure(ResponseCode.DEFAULT, 'connection_error');
//
//     }
//   }
// }
//
// class ResponseCode {
//   static const int SUCCESS = 200; // success with data
//   static const int NO_CONTENT = 201; // success with no data (no content)
//   static const int BAD_REQUEST = 400; // failure, API rejected request
//   static const int UNAUTORISED = 401; // failure, user is not authorised
//   static const int FORBIDDEN = 403; //  failure, API rejected request
//   static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
//   static const int NOT_FOUND = 404; // failure, not found
//   static const int Unprocessable_Content = 422; // failure, INFO is Fail
//
//   // local status code
//   static const int CONNECT_TIMEOUT = -1;
//   static const int CANCEL = -2;
//   static const int RECIEVE_TIMEOUT = -3;
//   static const int SEND_TIMEOUT = -4;
//   static const int CACHE_ERROR = -5;
//   static const int NO_INTERNET_CONNECTION = -6;
//   static const int DEFAULT = -7;
// }
//
// class ResponseMessage {
//   static const String SUCCESS = AppStrings.success; // success with data
//   static const String NO_CONTENT =
//       AppStrings.success; // success with no data (no content)
//   static const String BAD_REQUEST =
//       AppStrings.strBadRequestError; // failure, API rejected request
//   static const String UNAUTORISED =
//       AppStrings.strUnauthorizedError; // failure, user is not authorised
//   static const String FORBIDDEN =
//       AppStrings.strForbiddenError; //  failure, API rejected request
//   static const String INTERNAL_SERVER_ERROR =
//       AppStrings.strInternalServerError; // failure, crash in server side
//   static const String NOT_FOUND =
//       AppStrings.strNotFoundError; // failure, crash in server side
//
//   // local status code
//   static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
//   static const String CONNECTION_ERROR = AppStrings.strConnectionError;
//   static const String CANCEL = AppStrings.strDefaultError;
//   static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
//   static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
//   static const String CACHE_ERROR = AppStrings.strCacheError;
//   static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
//   static const String DEFAULT = AppStrings.strDefaultError;
//   static const String UNKNOWN = AppStrings.strUnknownError;
//   static const String BADCERTIFCAITE = AppStrings.strNotFoundError; // failure, crash in server side
// }
//
// class ResponseErrorKnown {
//   static const String LOGIN_FAILED = AppStrings.strLoginFail;
//   static const String PASSWORD_MUST_CHANGE = AppStrings.strPasswordMustChange;
//   static const String TOKEN_FAILED = AppStrings.strTokenFailed;
//   static const String PASSWORD_NOT_CORRECT = AppStrings.strPasswordNotCorrect;
// }
//
// /// To use in repo
// Future<Either<Failure, U>> handelCall<U>(
//     FutureOr<U> Function() call ) async {
//   if (await locator.get<NetworkInfo>().isConnected) {
//     try {
//       return Right(await call());
//     } on Failure catch (e) {
//       return Left(e);
//     } catch (e, s) {
//       log(e.toString(), stackTrace: s);
//       rethrow;
//     }
//   } else {
//     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//   }
// }
//
// ///To use in remote
// Future<T> handelDioResponse<T>(FutureOr<T> Function() call) async {
//   try {
//     return await call();
//   } on DioException catch (e) {
//     throw ErrorHandler.handle(e).failure;
//   } catch (e, s) {
//     log(e.toString(), stackTrace: s);
//     rethrow;
//     // throw AppException.unknown();
//   }
// }

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../feature/app.dart';
import '../constant/strings.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      //print("error ${error}");
      log("error ${error}");
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      //print("error ${error}");
      log("error ${error}");
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  if(error.response != null && error.response?.statusCode != null){
    final statusCode = error.response!.statusCode!;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        final errorData = error.response?.data;
        final message = errorData?["message"] ?? errorData?["error"];
        final errors = errorData?["errors"] ;
        final errorCode = errorData?["error_code"];
        if (errorCode == AppStrings.strTokenFailed) {
          return Failure(statusCode, errorCode);
        }
        if (message == 'Unauthenticated.') {
          return getKnownErrors(
              code: statusCode, errorMessage: message, error: message);
        }
        // if (errorCode == AppStrings.strPasswordMustChanged) {
        //   locator.get<AuthLocal>().saveLogInToken(errorData['data']['TOKEN']);
        //   return Failure(statusCode, errorCode);
        // }
        if (errorCode != null && errors.isNotEmpty) {
          //  //print("errors haya");
          return Failure(statusCode, errors);
        }
        if (errorCode != null && message.isNotEmpty) {
          //  //print("message haya");
          return Failure(statusCode, message);
        }
        if (errorCode != null) {
          //  //print("errorCode haya");

          return getKnownErrors(
            error: errorCode,
            code: statusCode,
          );
        }

        if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null && error.response?.data["error_code"]!=null) {
          // //print("1111111 haya");
          // if (error.response?.data['data'] != '' ) {
          //   //print('============= error from handler ${error.response?.data}');
          //   if( locator.get<AuthLocal>().getIsAutomata()!= true){
          //     //print('============= error from handler i am a customer not from automata ');
          //     //print('============= error from handler trueeeee  ${error.response?.data}');
          //     if(error.response!.data!['data']!= null){
          //       locator.get<AppManagerLocal>().saveCustomerNameEN(
          //           error.response!.data!['data']['EXTRA']['customerName']['en'] ?? '-');
          //       locator.get<AppManagerLocal>().saveCustomerNameAR(
          //           error.response!.data!['data']['EXTRA']['customerName']['ar'] ?? '-');
          //       locator.get<AuthLocal>().saveAuthToken(error.response!.data['data']['TOKEN']);
          //     }
          //   }
          //   //print("from error handler ${locator.get<AppManagerLocal>().getCustomerNameAR()}");
          // }
          return  getKnownErrors(error: error.response?.data["error_code"],code: error.response?.statusCode??0,errorMessage: error.response?.data["error"] );
        }
        else if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null && error.response?.data["errors"]!=null)
        {
          if(error.response?.data["errors"]["info_error"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["info_error"].toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["info_error"].toString()??'' );
          }

          else  if(error.response?.data["errors"]["documents_error"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["documents_error"].toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["documents_error"].toString()??'' );
          }
          else  if(error.response?.data["errors"]["username"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["username"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["username"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["password"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["password"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["password"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["mobile"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["mobile"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["mobile"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["national_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["national_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["national_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["file"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["file"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["file"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["filepond"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["filepond"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["filepond"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["image_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["image_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["image_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["otp"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["otp"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["otp"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["first_name"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["first_name"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["first_name"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["last_name"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["last_name"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["last_name"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["birth_date"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["birth_date"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["birth_date"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["password"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["password"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["password"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["documents"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["documents"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["documents"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["info"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["info"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["info"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["address_1"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["address_1"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["address_1"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["email"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["email"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["email"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["birth_date"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["birth_date"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["birth_date"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["father_name"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["father_name"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["father_name"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["gender_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["gender_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["gender_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["notes"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["notes"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["notes"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["state_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["state_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["state_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["request_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["request_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["request_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["rating"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["rating"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["rating"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["request_cycle_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["request_cycle_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["request_cycle_id"].first.toString()??'' );
          }





          else  if(error.response?.data["errors"]["request_type_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["request_type_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["request_type_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["form_version_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["form_version_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["form_version_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["complaint_subject_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["complaint_subject_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["complaint_subject_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["complaint_service_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["complaint_service_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["complaint_service_id"].first.toString()??'' );
          }
          else  if(error.response?.data["errors"]["corporate_hierarchy_id"]!=null){
            return  getKnownErrors(error: error.response?.data["errors"]["corporate_hierarchy_id"].first.toString()??'',code: error.response?.statusCode??0,errorMessage: error.response?.data["errors"]["corporate_hierarchy_id"].first.toString()??'' );
          }


          else{
            return  getKnownErrors(error: error.response?.data["message"],code: error.response?.statusCode??0,errorMessage: error.response?.data["error"] );
          }
        }
        else if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null && error.response?.data["message"]!=null)
        {
          //  //print("333333 haya");
          return  getKnownErrors(error: error.response?.data["message"],code: error.response?.statusCode??0,errorMessage: error.response?.data["error"] );
        }
        else {
          // //print("444444 haya");
          return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.unknown:return DataSource.UNKNOWN.getFailure();

    // case DioExceptionType.badCertificate:
    //   // TODO: Handle this case.
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
  else {
    return DataSource.DEFAULT.getFailure();
  }

}

// Failure getKnownErrors({
//   required String error,
//   required String? errorMessage,
//   required int code,
// }) {
//   var mContext = navigatorKey!.currentState!.context;
//   switch (error) {
//     case 'API:LOGIN_FAILED':
//       return Failure(
//           ResponseCode.DEFAULT, ResponseErrorKnown.LOGIN_FAILED);
//     case 'API:PASSWORD_MUST_CHANGED':
//       return Failure(ResponseCode.DEFAULT,
//           ResponseErrorKnown.PASSWORD_MUST_CHANGED);
//     default:
//       return Failure(code, errorMessage ?? error);
//   }
// }

Failure getKnownErrors({
  required String error,
  String? errorMessage,
  required int code,
}) {
  var mContext = navigatorKey.currentState!.context;
  switch (error) {
    case 'API:LOGIN_FAILED':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.LOGIN_FAILED);
  // case 'API:PASSWORD_MUST_CHANGED':
  //   return Failure(ResponseCode.DEFAULT,
  //       ResponseErrorKnown.PASSWORD_MUST_CHANGED);
    case 'API:TOKEN_FAILED':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED);
    case 'Unauthenticated.':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED);
    case 'Authentication failed':
      return Failure(
          ResponseCode.DEFAULT, ResponseErrorKnown.TOKEN_FAILED);
    case "API:CURRENT_PASSWORD_NOT_CORRECT":
      return Failure(ResponseCode.DEFAULT,
          ResponseErrorKnown.PASSWORD_NOT_CORRECT);
    case "Current password not correct":
      return Failure(ResponseCode.DEFAULT,
          ResponseErrorKnown.PASSWORD_NOT_CORRECT);
    default:
      return Failure(code, errorMessage ?? error);
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
  UNKNOWN, CONNECTION_ERROR, BADCERTIFCAITE
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    var mContext = navigatorKey.currentState!.context;
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      case DataSource.UNKNOWN:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.UNKNOWN);
      case DataSource.CONNECTION_ERROR:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.BADCERTIFCAITE:
        // TODO: Handle this case.
        throw UnimplementedError();
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
  static const String NO_CONTENT = AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST = AppStrings.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED = AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN = AppStrings.strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR = AppStrings.strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND = AppStrings.strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
  static const String UNKNOWN = AppStrings.strUnknownError;
}
class ResponseErrorKnown{
  static const String LOGIN_FAILED = AppStrings.strLoginFail;
  // static const String PASSWORD_MUST_CHANGED = AppStrings.strPasswordMustChanged;
  static const String TOKEN_FAILED = AppStrings.strTokenFailed;
  static const String PASSWORD_NOT_CORRECT = AppStrings.strPasswordNotCorrect;
}

class ApiInternalStatus {
  static const int SUCCESS = 200;
  static const int FAILURE = 400;
}

