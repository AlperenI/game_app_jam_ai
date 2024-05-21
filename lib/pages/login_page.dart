// ignore_for_file: prefer_const_constructors
import 'package:app_jam_ai_flutter/nav_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themeProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Soru Hazinesi",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Image.asset("assets/logo.png",width: 60,),
              ),
              SizedBox(height: 50,),
              
              Text("Kullanıcı Girişi",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              //Email Burada!!!!
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: TextField(
                  controller: username,
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 224, 224, 224),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 1,color: Colors.transparent)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black,width: 3)
                    ),
                    hintText: "Username"
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if(username.text.length == 0){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          // backgroundColor: Color.fromARGB(255, 100, 224, 224),
                          backgroundColor: Color.fromARGB(255, 70, 70, 72),
                          content: Text("Lütfen giriş yapmak için kullanıcı adı giriniz!"),
                        ),
                      );
                    }
                    else{
                      Provider.of<ThemeProvider>(context,listen: false).username = username.text;
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:(context)=>NavPages()));
                    }
                  },
                ),
              ),
            SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}