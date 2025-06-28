import 'dart:convert';
import 'dart:developer';

import '../../../../../../core/common/constant/strings.dart';
import '../../../../../../core/common/storage/cash_helper.dart';
import '../../../domain/entity/send_error_param.dart';
import '../../model/app_info_model.dart';

class AppManagerLocal{
  CashHelper cashHelper;
  AppManagerLocal({required this.cashHelper});
  /// ********* customer info cash *******

  Future saveFCMToken(String value) async {
    log('---- Save FCMToken to Cash----');
    await cashHelper.setString(AppStrings.FCM_TOKEN_KEY, value);
  }

  String? getFCMToken() {
    log('---- Get the FCMToken from Cash----');
    return cashHelper.getData(key: AppStrings.FCM_TOKEN_KEY);
  }

  removeFCMToken() {
    log('---- The FCMToken is removed ${getFCMToken()}----');
    return cashHelper.remove(AppStrings.FCM_TOKEN_KEY);
  }
  Future<void> saveCustomer(AppInfoModel value) async {
    log('------ set the customer to the cash-----');
    await cashHelper.setString(AppStrings.CUSTOMER_KEY, jsonEncode(value));
  }

  AppInfoModel? getCustomer() {
    log('------ get the customer from cash-----');
    final String? string = cashHelper.getString(AppStrings.CUSTOMER_KEY);
    if (string != null) {
      Map<String, dynamic> d = json.decode(string);
      AppInfoModel customer = AppInfoModel.fromJson(d);
      return customer;
    }
    return null;
  }

  removeCustomer() {
    log('---- The AuthFullName is removed ${getCustomer()}----');
    return cashHelper.remove(AppStrings.CUSTOMER_KEY);
  }

  Future saveBaseUrl(String value) async {
    log('---- Save BaseUrl to Cash----');
    await cashHelper.setString(AppStrings.BASE_URL_KEY, value);
  }

  String? getBaseUrl() {
    log('---- Get the BaseUrl from Cash----');
    return cashHelper.getData(key: AppStrings.BASE_URL_KEY);
  }

  removeBaseUrl() {
    log('---- The BaseUrl is removed ${getBaseUrl()}----');
    return cashHelper.remove(AppStrings.BASE_URL_KEY);
  }

  Future saveLogoPath(String value) async {
    log('---- Save LogoPath to Cash----');
    await cashHelper.setString(AppStrings.LOGO_PATH_KEY, value);
  }

  String? getLogoPath() {
    log('---- Get the LogoPath from Cash----');
    return cashHelper.getData(key: AppStrings.LOGO_PATH_KEY);
  }

  removeLogoPath() {
    log('---- The LogoPath is removed ${getBaseUrl()}----');
    return cashHelper.remove(AppStrings.LOGO_PATH_KEY);
  }

  Future saveClientCode(String value) async {
    log('---- Save ClientCode to Cash----');
    await cashHelper.setString(AppStrings.CLIENT_CODE_KEY, value);
  }

  String? getClientCode() {
    log('---- Get the ClientCode from Cash----');
    return cashHelper.getData(key: AppStrings.CLIENT_CODE_KEY);
  }

  removeClientCode() {
    log('---- The ClientCode is removed ${getClientCode()}----');
    return cashHelper.remove(AppStrings.CLIENT_CODE_KEY);
  }
  Future<void> saveError(ErrorParam error) async {
    List<String> storedErrors = cashHelper.getStringList(AppStrings.ERROR_KEY) ?? [];

    storedErrors.add(jsonEncode(error.toJson())); // Convert error to JSON
    await cashHelper.setStringList(AppStrings.ERROR_KEY, storedErrors);
  }

  Future<List<ErrorParam>> getErrors() async {
    List<String> storedErrors = cashHelper.getStringList(AppStrings.ERROR_KEY) ?? [];

    return storedErrors.map((e) => ErrorParam.fromJson(jsonDecode(e))).toList();
  }

  /// Clear stored errors after successful submission
  Future<void> clearErrors() async {
    await cashHelper.remove(AppStrings.ERROR_KEY);
  }
}
