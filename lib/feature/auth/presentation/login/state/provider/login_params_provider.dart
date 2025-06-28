import 'package:flutter/cupertino.dart';

class LoginParamProvider extends  ChangeNotifier{
  String? name ;
  String? token  ;
  Future<void> setUserName(String value) async {
    name = value;
    notifyListeners();
  } Future<void> setUserToken(String value) async {
    token = value;
    notifyListeners();
  }
}