import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier{
  int? formIndex=0;
  void setFormIndex(int index)
  {
    formIndex = index;
    notifyListeners();
  }
  String? name;
  String? last_name;
  String? meddle_name;
  String? city;
  String? nationalId;
  String? mobile;
  String? email;
  String? date;
  String? password;
  String? confirmPassword;
  String? otp;
  void setName(String name)
  {
    this.name = name;
    notifyListeners();
  }
}

