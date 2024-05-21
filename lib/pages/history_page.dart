// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:app_jam_ai_flutter/providers/changeState.dart';
import 'package:app_jam_ai_flutter/utils/historyPage_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("History Page"),
      ),
      body:Consumer<DeleteHistoryList>(builder: (context, value, child) {
        return ListView.builder(itemCount:historyadd.length ,itemBuilder:(context, index) {
          return historyadd[index];
        },);
      },
      ),
    );
  }
}

//ListView.builder(itemCount: historyadd.length,itemBuilder: (context, index) {
//        return historyadd[index];
//    },
//  )