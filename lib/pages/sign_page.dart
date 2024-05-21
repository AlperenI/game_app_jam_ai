// ignore_for_file: prefer_const_constructors

import 'package:app_jam_ai_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text("Sign In Page"),
      ),
      body: Center(child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder:(context)=>LoginPage() ),
                      );
        },
        child: Text("Giriş Sayfası"),),),
    );
  }
}