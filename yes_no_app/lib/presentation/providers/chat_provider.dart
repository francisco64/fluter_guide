import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{//inform changes

  final ScrollController chatScrollController =ScrollController();//controlls scroll based on new message sent
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();


  List<Message> messageList = [//list of consecutve texts
    //Message(text: 'Quiubo ñero!', fromWho: FromWho.me),
    //Message(text: 'Qué hace?', fromWho: FromWho.me)
  ];

Future<void> sendMessage(String text) async {
  
    //asynchronous programming is commonly used to handle tasks that might take some time to complete, 
    //such as network requests, file I/O, or database queries, without blocking the main thread
    
    if (text.isEmpty) return;

    final newMessage = Message(text:text,fromWho: FromWho.me  );//message always comes from me

    messageList.add(newMessage);//add message to list

    notifyListeners();//notify listeners of a change in the list so that thet update their state
    moveScrollToBottom();// each time a message is sent scroll down as much as it can
    
    if (text.endsWith('?')){
      herReplay();
    }

    
}


Future<void> herReplay() async {
  final Message herMessage = await getYesNoAnswer.getAnswer();
  messageList.add(herMessage);
  notifyListeners();
  moveScrollToBottom();
}


Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));//wait some time for flutter to have the values before scrolling

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,//offset: go to the maximum it can go
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
}




}