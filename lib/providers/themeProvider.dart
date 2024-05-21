import 'package:app_jam_ai_flutter/utils/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool value=false;
  String _username = '';
  ThemeData _themeData=lightMode;
  ThemeData get themeData=>_themeData;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  set username(String newValue) {
    _username = newValue;
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