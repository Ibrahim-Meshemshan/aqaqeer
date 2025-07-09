import 'dart:developer';


import '../../../../../core/common/constant/strings.dart';
import '../../../../../core/common/storage/cash_helper.dart';


class AuthLocal {
  CashHelper cashHelper;

  AuthLocal({required this.cashHelper});

  Future saveAuthToken(String value) async {
    log('---- Save AuthToken to Cash----');

    await cashHelper.setString(AppStrings.TOKEN_KEY, value);
  }

  String? getAuthToken() {
    log('---- Get the AuthToken from Cash----');
    return cashHelper.getData(key: AppStrings.TOKEN_KEY);
  }

  removeAuthToken() {
    log('---- The AuthToken is removed ${getAuthToken()}----');
    return cashHelper.remove(AppStrings.TOKEN_KEY);
  }

  Future saveRememberToken(String value) async {
    log('---- Save AuthToken to Cash----');
    await cashHelper.setString(AppStrings.REMEMBER_TOKEN_KEY, value);
  }

  String? getRememberToken() {
    log('---- Get the RememberToken from Cash----');
    return cashHelper.getData(key: AppStrings.REMEMBER_TOKEN_KEY);
  }

  removeRememberToken() {
    log('---- The AuthToken is removed ${getAuthToken()}----');
    return cashHelper.remove(AppStrings.REMEMBER_TOKEN_KEY);
  }

  Future saveAuthUserName(String value) async {
    log('---- Save UserName to Cash----');
    await cashHelper.setString(AppStrings.USER_NAME_KEY, value);
  }

  String? getAuthUserName() {
    log('---- Get the UserName from Cash----');
    return cashHelper.getData(key: AppStrings.USER_NAME_KEY);
  }

  removeAuthUserName() {
    log('---- The AuthToken is removed ${getAuthUserName()}----');
    return cashHelper.remove(AppStrings.USER_NAME_KEY);
  }

  //for change password
  Future saveLogInToken(String value) async {
    log('---- Save LogInToken to Cash----');
    await cashHelper.setString(AppStrings.LOGIN_TOKEN_KEY, value);
  }

  String? getLogInToken() {
    log('---- Get the saveLogInToken from Cash----');
    return cashHelper.getData(key: AppStrings.LOGIN_TOKEN_KEY);
  }

  removeLogInToken() {
    log('---- The saveLogInToken is removed ${getLogInToken()}----');
    return cashHelper.remove(AppStrings.LOGIN_TOKEN_KEY);
  }

  Future saveAuthFullName(String value) async {
    log('---- Save AuthFullName to Cash----');
    await cashHelper.setString(AppStrings.FULL_NAME_KEY, value);
  }

  String? getAuthFullName() {
    log('---- Get the AuthFullName from Cash----');
    return cashHelper.getData(key: AppStrings.FULL_NAME_KEY);
  }

  removeAuthFullName() {
    log('---- The AuthFullName is removed ${getAuthFullName()}----');
    return cashHelper.remove(AppStrings.FULL_NAME_KEY);
  }


}
