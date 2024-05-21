// ignore_for_file: prefer_const_constructors
import 'package:app_jam_ai_flutter/nav_pages.dart';
import 'package:app_jam_ai_flutter/pages/sign_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Email Burada!!!!
              
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: TextField(
                  controller: TextEditingController(),
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 3)
                    ),
                    hintText: "email"
                  ),
                ),
              ),
              SizedBox(height: 20,),

              //Password Burada!!!!

              Padding(
                padding: const EdgeInsets.only(left:40.0,right: 40),
                child: TextField(
                  obscureText: true,
                  controller: TextEditingController(),
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1,color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 3)
                    ),
                    hintText: "password"
                  ),
                ),
              )
            ,SizedBox(height: 20,),

            //Giriş Yap Butonu Burada!!!

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      shape:BoxShape.rectangle,
                      border:Border.all(color: Colors.greenAccent.shade700,strokeAlign:BorderSide.strokeAlignCenter),
                      color: Colors.green,
                      ),
                    child: Center(child: Text("Giriş Yap",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),))),
                  onTap: () {
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder:(context)=>NavPages() ),
                      );
                  },
                ),
              ],
            ),
           SizedBox(height: 20,),

           // ÜYE OLMA BUTONU BURAYA!!!
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Üye değil misin?   "),
                SizedBox(width: 15,child: Text("|",style: TextStyle(fontSize:30,fontWeight: FontWeight.w100),),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder:(context)=>SignPage() ),
                      );
                  },
                  child: Text("Üye OL!",style: TextStyle(
                    fontWeight: FontWeight.bold,color: Colors.black87,fontSize:19
                  ),)),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}