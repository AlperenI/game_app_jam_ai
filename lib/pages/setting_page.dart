// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:app_jam_ai_flutter/providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../nav_pages.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File _image = File("assets/profile.png");

  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Settings Page"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: _image != null
                  ? FileImage(_image)
                  : null,
              child: _image == null
                  ? Icon(
                Icons.person,
                size: 80,
              )
                  : null,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectImageFromGallery,
              child: Text('Select Image'),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny_outlined),
                SizedBox(width: 20,),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Light Mode",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if (Provider.of<ThemeProvider>(context,listen: false).value==false) {
                    }
                    else if(Provider.of<ThemeProvider>(context,listen: false).value==true){
                      Provider.of<ThemeProvider>(context,listen: false).value=false;
                      Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.nightlight_outlined),
                SizedBox(width: 20,),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Night Mode",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if (Provider.of<ThemeProvider>(context,listen: false).value==false) {
                      Provider.of<ThemeProvider>(context,listen: false).value=true;
                      Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}