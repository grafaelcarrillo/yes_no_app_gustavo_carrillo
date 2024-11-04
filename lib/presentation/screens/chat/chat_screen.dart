import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_gustavo_carrillo/domain/entities/message.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_gustavo_carrillo/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/5231/5231019.png'),
          ),
        ),
        title: const Text('My Love'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length, 
                itemBuilder: (context, index){
                final message = chatProvider.messageList[index];  
                return (message.fromWho == FromWho.hers)
                ?  HerMessageBubble()
                :  MyMessageBubble(message:message,);

              }
              
              )
            ),

            //Caja de Texto de Mensajes
            MessageFieldBox(onValue: chatProvider.sendMessage,),
          ],
        ),
      ),
    );
  }
}




