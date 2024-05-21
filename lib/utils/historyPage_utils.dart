// ignore_for_file: prefer_const_constructors
import 'package:app_jam_ai_flutter/providers/changeState.dart';
import 'package:app_jam_ai_flutter/utils/const.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

List<Widget> historyadd=[];

class HistoryAddWidget extends StatefulWidget {
  final String chatName;
  final List<ChatMessage>chatMessages;
  const HistoryAddWidget({
    super.key, required this.chatName, required this.chatMessages
  });

  @override
  State<HistoryAddWidget> createState() => _HistoryAddWidgetState();
}

class _HistoryAddWidgetState extends State<HistoryAddWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(height: 5,),
        Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(), children:[
            SlidableAction(onPressed: (context){

              Provider.of<DeleteHistoryList>(context,listen: false).deleteHistory(widget);

            },
            icon: Icons.delete_forever_outlined,
            backgroundColor: Colors.red,
            ), 
          ]
          ),
          child:Container(margin: EdgeInsets.only(left: 15,right: 15,),
          color: Color.fromARGB(255, 170, 207, 75),
          child: TextButton(
            style:TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
               return Scaffold(appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    IconButton(onPressed:(){
                      Navigator.pop(context);
                    },icon:Icon( Icons.navigate_before,size: 35,weight: 25,),),
                  ],
                ),
               ),
                body: SafeArea(
                  child: DashChat(
                    readOnly: true,
                    currentUser: currentUser, 
                    onSend:(message) {}, 
                    messages:widget.chatMessages)
                    ),
               );
              } 
              )
              );
            },
            child: ListTile(
              title:Text(widget.chatName),//name in içindeki yazı buraya gelecek
              leading: Icon(Icons.mark_chat_read,color: Colors.green,),
            ),
          ),
        ),
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}