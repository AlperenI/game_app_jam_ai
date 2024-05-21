
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  dialogBackgroundColor: Colors.grey.shade100,
  navigationBarTheme: NavigationBarThemeData(surfaceTintColor: Colors.grey.shade900),
  iconTheme: IconThemeData(color: Colors.black),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    
    onSurface: Color.fromARGB(255, 3, 3, 3),
    primary: Color.fromARGB(255, 0, 0, 0),
  ),
);

ThemeData darkMode=ThemeData(
  dialogBackgroundColor: Colors.grey.shade600,
  navigationBarTheme: NavigationBarThemeData(surfaceTintColor: Colors.white),
  iconTheme: IconThemeData(color: Colors.white),
  iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor:WidgetStatePropertyAll(Colors.white))),
  appBarTheme: AppBarTheme(backgroundColor:Color.fromARGB(255, 49, 53, 52),titleTextStyle: TextStyle(color: Colors.white,fontSize: 25)),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surfaceContainer: Colors.grey.shade600,
    background: Color.fromARGB(255, 49, 53, 52),
    surface: Color.fromARGB(255, 238, 243, 242),
    //onPrimary: Colors.white,
    primary: Color.fromARGB(255, 49, 53, 52),
    onSurface: Color.fromARGB(255, 0, 0, 0)
  ),
);