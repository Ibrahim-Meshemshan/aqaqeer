import 'dart:developer';

import 'package:intl/intl.dart';

import '../../../../../core/common/config/lang/state/store_current_lang.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../core/common/network/network_info.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../auth/data/data_source/local/local.dart';
import '../../data/data_source/local/app_manager_local.dart';
import 'device_info_param.dart';

class ErrorParam {
  final String date;
  final String? applicationCode;
  final String? userName;
  final String? statusCode;
  final String? userTypeCode;
  final String? clientCode;
  final String? applicationName;
  final String? message;
  final String? stackTrace;
  final String? deviceName;
  final String? deviceModel;
  final String? deviceManufacturer;
  final String? deviceSystemVersion;
  final String? appLanguage;
  final String? devicePlatform;
  final String? deviceSdkInt;
  final String? screenPixelRatio;
  final String? networkStatus;
  final String? screenHeight;
  final String? screenWidth;
  final String? response;
  final String? appVersion;
  final String? requestPath;
  final String? requestMethod;
  final String? token;

  const ErrorParam(
      {required this.date,
      required this.applicationCode,
      required this.userName,
      this.statusCode,
      this.applicationName,
      required this.userTypeCode,
      required this.clientCode,
      required this.message,
      this.stackTrace,
      this.deviceName,
      this.deviceModel,
      this.deviceManufacturer,
      this.deviceSystemVersion,
      this.appLanguage,
      this.devicePlatform,
      this.deviceSdkInt,
      this.screenPixelRatio,
      this.networkStatus,
      this.screenHeight,
      this.screenWidth,
      this.response,
      this.appVersion,
      this.requestPath,
      this.requestMethod,
      this.token});

  /// Converts the `ErrorParam` instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'application_code': applicationCode,
      'user_name': locator.get<AuthLocal>().getAuthUserName(),
      'status_code': statusCode,
      'user_type_code': userTypeCode,
      'client_code': locator.get<AppManagerLocal>().getClientCode(),
      'application_name': applicationName,
      'message': message,
      'stack_trace': stackTrace,
      'device_name': deviceName,
      'device_model': deviceModel,
      'device_manufacturer': deviceManufacturer,
      'device_system_version': deviceSystemVersion,
      'app_language': 'ar',
      'device_platform': devicePlatform,
      'device_sdk_int': deviceSdkInt,
      'screen_pixel_ratio': screenPixelRatio,
      'network_status': networkStatus,
      'screen_height': screenHeight,
      'screen_width': screenWidth,
      'response': response,
      'app_version': appVersion,
      'request_path': requestPath,
      'request_method': requestMethod,
      'token': token
    };
  }

  factory ErrorParam.fromJson(Map<String, dynamic> json) {
    return ErrorParam(
      date: json['date'] ?? '',
      applicationCode: json['application_code'],
      userName: json['user_name'],
      statusCode: json['status_code'],
      userTypeCode: json['user_type_code'],
      clientCode: json['client_code'],
      applicationName: json['application_name'],
      message: json['message'],
      stackTrace: json['stack_trace'],
      deviceName: json['device_name'],
      deviceModel: json['device_model'],
      deviceManufacturer: json['device_manufacturer'],
      deviceSystemVersion: json['device_system_version'],
      appLanguage: json['app_language'],
      devicePlatform: json['device_platform'],
      deviceSdkInt: json['device_sdk_int'],
      screenPixelRatio: json['screen_pixel_ratio'],
      networkStatus: json['network_status'],
      screenHeight: json['screen_height'],
      screenWidth: json['screen_width'],
      response: json['response'],
      appVersion: json['app_version'],
      requestPath: json['request_path'],
      requestMethod: json['request_method'],
      token: json['token'],
    );
  }
}

Future<ErrorParam> createErrorParam({
  required String message,
  required String? stackTrace,
  String? statusCode,
  String? response,
  String? requestPath,
  String? requestMethod,
  required String param,
  required String body,
}) async {
  final deviceInfoService = locator.get<DeviceInfoParam>();
  final NetworkInfoImpl networkInfo = NetworkInfoImpl();
  final bool isConnected = await networkInfo.isConnected;
  log('isConnected ${isConnected.toString()}');
  log('locator.get<AuthLocal>().getAuthUserName() ${locator.get<AuthLocal>().getAuthUserName()}');
  // log('isConnected ErrorParam ${networkInfo.isConnected.toString()}');

  final String networkState =
      await networkInfo.isConnected == true ? "online" : "offline";
  // Fetch device info from the service
  final deviceName = deviceInfoService.deviceName;
  final deviceModel = deviceInfoService.deviceModel;
  final deviceManufacturer = deviceInfoService.deviceManufacturer;
  final deviceSystemVersion = deviceInfoService.deviceSystemVersion;
  final devicePlatform = deviceInfoService.devicePlatform;
  final deviceSdkInt = deviceInfoService.deviceSdkInt.toString();
  final screenPixelRatio = deviceInfoService.screenPixelRatio.toInt();
  final screenHeight = deviceInfoService.screenHeight.toInt();
  final screenWidth = deviceInfoService.screenWidth.toInt();
  final String appVersion = AppStrings.appVersion;

  // Capture the current date/time
  final date = DateTime.now();
  final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(date);

  // Return the populated ErrorParam
  return ErrorParam(
      date: formattedDate,
      applicationCode: AppStrings.applicationCode,
      userName: '',

      ///haya
      //  userName: locator.get<AuthLocal>().getAuthUserName(),
      userTypeCode: AppStrings.userTypeCode,
      clientCode: locator.get<AppManagerLocal>().getClientCode() ?? '',
      message: message,
      stackTrace: stackTrace,
      statusCode: statusCode,
      deviceName: deviceName,
      deviceModel: deviceModel,
      deviceManufacturer: deviceManufacturer,
      deviceSystemVersion: deviceSystemVersion,
      devicePlatform: devicePlatform,
      deviceSdkInt: deviceSdkInt,
      screenPixelRatio: screenPixelRatio.toString(),
      screenHeight: screenHeight.toString(),
      screenWidth: screenWidth.toString(),
      networkStatus: networkState,
      response: response,
      appVersion: appVersion,
      requestPath: requestPath,
      requestMethod: requestMethod,
      appLanguage: locator.get<LanguageStorage>().getCurrentLang(),
      applicationName: AppStrings.appName,
      token:
          'c451f3ff07b40457e21f4e32339ea8bbf8ad1716914ad7ef15b751977fa526777655502281821d7e5cb5876625d3d636f06ac5c1d04a0fd6f786936459271b6905c9166afd52767be5797e72ff9de06c65a10fb7832f9b8ced2d5aa6367d7c7dc8d8e286cbee6189523d72fbd88129bc63502347194f896ebd575a32d36646cc812b38439137785d6b8316665893c89618c6619349e90e22fb8daeee71d879f16cabbe062d3464c2db755daadca025a74191db53df1f39ac9114cf2d9341bb9ddc776c8a3578adf39b849d90228e1af01ff3c8be0aa060b6dc9b8c77d57ac5ffd4b289413ca0c89fe3d7253ccc80b517b3d640efe41f00914f84cae1bcdc549c');
}
