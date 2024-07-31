import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          //makes it smaller
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(//returns an image provider object onlike Image.network that returns a widget
                'https://images.uncyclomedia.co/inciclopedia/es/6/64/Zarco1.JPG'), //background image from url
          ), //circular space for a photo
        ), //const Icon(Icons.ac_unit),
        title: const Text("El Ñero"),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    //provider can be accessed from the context 
    final chatProvider = context.watch<ChatProvider>();//watch listens to any changes on ChatProvider

    return SafeArea(
      //limits column to the area without buttons in android and notch in ios
      child: Padding(
        //creates a padding that makes the extended slightly smaller
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
              //expands row or column to fill available space
              child: ListView.builder(
                //scroll controller from provider because the provider has info on messages and scroll has to change after message sent
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,//50,//items produced by the generator (can change in execution time)
                itemBuilder: (context, index) {//this creates a generator based on an index (this is iterated)
                  
                  final message = chatProvider.messageList[index];//whatever exists in the list

                    return (message.fromWho == FromWho.hers ? HerMessageBubble(message:message) : MyMessageBubble(message:message));

                  //return (index%2 == 0 ? const HerMessageBubble() : const MyMessageBubble());
                  //return Text('index: $index');
                },
              ), //widget list that allows scrolling
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),//returns a future<void>
            )
          ],
        ),
      ),
    );
  }
}
