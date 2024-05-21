

import 'package:app_jam_ai_flutter/utils/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool value=false;
  ThemeData _themeData=lightMode;
  ThemeData get themeData=>_themeData;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if (_themeData==lightMode) {
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}