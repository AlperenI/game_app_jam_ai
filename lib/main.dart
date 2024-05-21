// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:app_jam_ai_flutter/pages/login_page.dart';
import 'package:app_jam_ai_flutter/providers/changeState.dart';
import 'package:app_jam_ai_flutter/providers/themeProvider.dart';
import 'package:app_jam_ai_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

void main()async{
  Gemini.init(apiKey:geminiApiKey);
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create:(context) => ChangePage(),),
      ChangeNotifierProvider(create:(context) => ProvideMessage(),),
      ChangeNotifierProvider(create:(context) => DeleteHistoryList(),),
      ChangeNotifierProvider(create:(context) => ThemeProvider(),)

    ],
    child:await MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:Provider.of<ThemeProvider>(context).themeData ,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}