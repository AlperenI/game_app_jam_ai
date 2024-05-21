import 'package:app_jam_ai_flutter/utils/historyPage_utils.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Sayfaları değiştirmek için!!!
class ChangePage extends ChangeNotifier{
  int indexIs=0;
   pageChange(index){
  if (index!=indexIs) {
    indexIs=index;
    notifyListeners();
}
  }
}

//Yazışmayı kaydetme iconuna basarken çalışacak provider!!!

class ProvideMessage extends ChangeNotifier{
  
  TextEditingController controller=TextEditingController(); 
  List<ChatMessage> messages = [];
  messageState(BuildContext context){
    String titleOfChatting=controller.text;
                        if (titleOfChatting.isEmpty) {
                          titleOfChatting="Başlıksız";
                        }
                        historyadd.add(HistoryAddWidget(
                          chatName:titleOfChatting,
                          chatMessages:List.from(messages),
                        ));
                        
                        messages.clear();
                        notifyListeners();
  }
}

// History Sayfasından Slide edip silmek için!!!

class DeleteHistoryList extends ChangeNotifier{
  deleteHistory(widget){
    historyadd.remove(widget);
    notifyListeners();
    
    
  }
}