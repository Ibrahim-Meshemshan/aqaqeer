
import 'dart:developer';

import '../../../constant/strings.dart';
import '../../../storage/cash_helper.dart';



class LanguageStorage{
  CashHelper cashHelper;
  LanguageStorage({required this.cashHelper});

  Future saveCurrentLang(String value) async {
    log('---- saveCurrentLang to Cash----');
    await cashHelper.setString(AppStrings.LANG_KEY, value);
  }

  String? getCurrentLang(){
    log('---- getCurrentLang from Cash ${cashHelper.getData(key:AppStrings.LANG_KEY)}----');
    return cashHelper.getData(key:AppStrings.LANG_KEY);
  }

  String? removeCurrentLang(){
    log('----remove the key of the lang----');
    return cashHelper.remove(AppStrings.LANG_KEY);
  }
}
