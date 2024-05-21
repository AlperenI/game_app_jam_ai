// ignore_for_file: prefer_const_constructors

import 'package:app_jam_ai_flutter/providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Settings Page"),
      ),
      body: Center(
        child:CupertinoSwitch(
          activeColor: Color.fromARGB(255, 122, 184, 110),
          value: Provider.of<ThemeProvider>(context).value, onChanged:(bool value){
          Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
          if (Provider.of<ThemeProvider>(context,listen: false).value==false) {
            Provider.of<ThemeProvider>(context,listen: false).value=true;
          }else{
            Provider.of<ThemeProvider>(context,listen: false).value=false;

          }
        }),
        ),
    );
  }
}