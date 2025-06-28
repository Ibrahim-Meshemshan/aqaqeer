import 'package:aqaqeer/core/common/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@singleton
class AppConfigProvider extends ChangeNotifier {
  final SharedPreferences cashHelper;
  AppConfigProvider(this.cashHelper) {
    selectedLocal = cashHelper.getString(AppStrings.local) ?? 'ar';
  }

  String selectedLocal = 'en';
  Future<void> changeLanguage(String local)async{
    selectedLocal = local;
    await cashHelper.setString(AppStrings.local, selectedLocal);
    notifyListeners();
  }

  String getLocal(){
    return selectedLocal;
  }

  bool isEn(){
    return selectedLocal == 'en';
  }

}