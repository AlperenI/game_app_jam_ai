// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'dart:typed_data';
import 'package:app_jam_ai_flutter/providers/themeProvider.dart';
import 'package:app_jam_ai_flutter/utils/const.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

bool readonly=false;

class Chatting extends StatefulWidget {
  final List<ChatMessage>messages;
  final Function(List<ChatMessage>) onSaveMessages;
  
  const Chatting({super.key, required this.messages, required this.onSaveMessages});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  void sendImage() async {
  ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: ImageSource.gallery);

  if (file != null) {
    TextEditingController questionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Provider.of<ThemeProvider>(context).themeData.dialogBackgroundColor,
          title: Text("Görselle ilgili sorunuz nedir?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: InputDecoration(
                  hintText: "Sorunuzu buraya yazın...",
                  
                ),
              ),
              SizedBox(height: 10),
              // Seçilen görseli göster!!!
              Image.file(File(file.path), height: 200, width:200), 
            ],
          ),
          actions: [
            TextButton(
              child: Text("Gönder",style: TextStyle(color:Provider.of<ThemeProvider>(context).themeData.iconTheme.color),),
              onPressed: () {
                String question = questionController.text.trim();
                if (question.isNotEmpty) {
                  ChatMessage chatMessage = ChatMessage(
                    user: currentUser,
                    createdAt: DateTime.now(),
                    text: question,
                    medias: [
                      ChatMedia(url: file.path, fileName: "", type: MediaType.image)
                    ],
                  );
                  sendMessage(chatMessage);
                   // Dialog'u kapat!!!
                  Navigator.of(context).pop();
                } else {
                  // Kullanıcıyı boş soru yazamayacağına dair uyar!!!
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Lütfen bir soru yazın.")),
                    
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}void sendMessage(ChatMessage chatMessage) {
  if (chatMessage.text.trim().isNotEmpty) {
    setState(() {
      widget.messages.insert(0, chatMessage);
    });
    widget.onSaveMessages(widget.messages);
  }

  try {
    String question = chatMessage.text;
    List<Uint8List>? images;
    if (chatMessage.medias?.isNotEmpty ?? false) {
      images = [
        File(chatMessage.medias!.first.url).readAsBytesSync(),
      ];
    }

    // Geçici bir mesaj olacak!!!
    ChatMessage typingMessage = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: "Gemini is typing...",
    );

    // "Gemini is typing..." mesajını ekle!!!
    setState(() {
      widget.messages.insert(0, typingMessage);
    });

    // Yanıtları birleştirmek için bir String değişkeni olmalı!
    String fullResponse = "";

    // streamGenerateContent'e listen içine alacak!
    gemini.streamGenerateContent(question, images: images).listen((event) {
      // Her gelen yanıtı birleştirdiğimiz yer!!!
      String responsePart = event.content?.parts?.map((part) => part.text).join(" ") ?? "";
      fullResponse += responsePart;
    }, onDone: () {
      // Gemini cevabını yazınca "Gemini is typing..." mesajını kaldırılacak ve tüm yanıt eklenecek!!!
      setState(() {
        //Yanıt gelip birleştikten sonra Gemini is typing... mesajını siliniyor!!!
        widget.messages.remove(typingMessage);
        // Tüm yanıtı içeren yeni bir mesaj oluştur!!!
        ChatMessage responseMessage = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: fullResponse,
        );

        //Gemini'ın Yanıtını ekle!!!
        widget.messages.insert(0, responseMessage);
      });

      // Gemini'ın Mesajlarını kaydet!!!
      widget.onSaveMessages(widget.messages);
    }, onError: (e) {
      print(e);
    });
  } catch (e) {
    print(e);
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        readOnly: readonly,
        messageOptions: MessageOptions(currentUserTextColor: Colors.black,currentUserContainerColor: Color.fromARGB(255, 143, 219, 36)),
        inputOptions: InputOptions(
          trailing: [
            IconButton(onPressed:sendImage, icon: Icon(Icons.image_outlined,color:Provider.of<ThemeProvider>(context).themeData.iconTheme.color))
          ]
        ),
      currentUser: currentUser,
       
       onSend:sendMessage, 
       
       messages:widget.messages
       
       ),
    );
  }
}


