// ignore_for_file: prefer_const_constructors
import 'package:app_jam_ai_flutter/providers/changeState.dart';
import 'package:app_jam_ai_flutter/utils/chatPage_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Soru Hazinesiyle Mesajlaş!"),
            IconButton(onPressed:(){
              
                showDialog(context: context, builder:(context) {
                  return AlertDialog(
                    title: Text("Konuşman ne hakkındaydı?"),
                    content: TextField(controller:Provider.of<ProvideMessage>(context).controller,),
                    actions: [
                      MaterialButton(onPressed: (){
                        Provider.of<ProvideMessage>(context,listen: false).messageState(context);
                        Navigator.of(context).pop();
                      },
                      child: Text("Kaydet",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  );
                },);   
                readonly=false;
                
                             
              
            }, icon: Icon(Icons.cloud_upload_outlined,size: 35,))
          ],
        ),
      ),
      body: Chatting(
        messages:Provider.of<ProvideMessage>(context).messages,
        onSaveMessages: (savedMessages) {
            Provider.of<ProvideMessage>(context,listen: false).messages=savedMessages;
        },
      ),
    );
  }
}

