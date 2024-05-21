// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_jam_ai_flutter/providers/changeState.dart';
import 'package:app_jam_ai_flutter/providers/themeProvider.dart';
import 'package:app_jam_ai_flutter/utils/list_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavPages extends StatefulWidget {
  const NavPages({super.key});
  @override
  State<NavPages> createState() => _NavPagesState();
}
class _NavPagesState extends State<NavPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[Provider.of<ChangePage>(context).indexIs],
      bottomNavigationBar: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          unselectedItemColor:Provider.of<ThemeProvider>(context).themeData.navigationBarTheme.surfaceTintColor,
          showUnselectedLabels: false,
          elevation: 115,
          fixedColor: Color.fromARGB(255, 70, 70, 72),
          backgroundColor:Provider.of<ThemeProvider>(context).themeData.canvasColor,
          type: BottomNavigationBarType.fixed,
          currentIndex:Provider.of<ChangePage>(context).indexIs,
          items: [
            
            BottomNavigationBarItem(label:"chat",icon: Icon(Icons.chat_bubble_outline)),
            BottomNavigationBarItem(label:"history",icon: Icon(Icons.cloud)),
            BottomNavigationBarItem(label:"settings",icon: Icon(Icons.settings)),
        ],
        onTap: (index){
          Provider.of<ChangePage>(context,listen: false).pageChange(index);
        },
        
        ),
      ),
    );
  }
}