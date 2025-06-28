import 'package:flutter/material.dart';

import '../src/theme.dart';

class ThemeService with ChangeNotifier{
   ThemeData _themeData=AppThemes.lightThemeData;

  ThemeData get darkTheme => _themeData;

  set darkTheme(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==AppThemes.lightThemeData){
      _themeData=AppThemes.darkThemeData;
    }
    else {
      _themeData=AppThemes.lightThemeData;
    }

  }
}